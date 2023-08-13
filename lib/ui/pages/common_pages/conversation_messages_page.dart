import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/messages/get_conversation_messages/get_conversation_messages_cubit.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/main.dart';
import 'package:volunteer_work_app/ui/common_components/add_size.dart';
import 'package:volunteer_work_app/ui/common_components/centered_progress_indicator.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../blocs/messages/create_message/create_message_cubit.dart';
import '../../../blocs/messages/delete_message/delete_message_cubit.dart';
import '../../../constants/api_constants.dart';
import '../../../utils/exception_handlers.dart';
import '../../common_components/centered_error_message.dart';

class ConversationMessagesPage extends StatefulWidget {
  const ConversationMessagesPage({
    Key? key,
    this.conversationDto,
    this.isPeer1,
    this.peerUserId,
    this.peerUserImage,
    this.peerUserName,
  }) : super(key: key);

  final ConversationDto? conversationDto;
  final bool? isPeer1;
  final int? peerUserId;
  final String? peerUserImage;
  final String? peerUserName;

  @override
  State<ConversationMessagesPage> createState() =>
      _ConversationMessagesPageState();
}

class _ConversationMessagesPageState extends State<ConversationMessagesPage> {
  ConversationDto? _chat;
  bool _isPeer1 = false;
  int? _peerUserId;

  late int currentUserId;

  List<MessageDto> listOfMessages = [];
  int _limit = 20;
  final int _limitIncrement = 20;

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();

  bool _isThereMessageTyped = false;

  @override
  void initState() {
    super.initState();

    currentUserId = globalAppStorage.getCurrentAccountId();

    if (widget.conversationDto != null) {
      _chat = widget.conversationDto;
      _isPeer1 = widget.isPeer1 ?? _chat!.user1Id != currentUserId;
      _peerUserId = _isPeer1 ? _chat?.user1Id : _chat?.user2Id;

      context.read<GetConversationMessagesCubit>().getConversationMessages(
            skipCount: 0,
            maxResultCount: _limit,
            conversationId: _chat?.id,
          );
    } else if (widget.peerUserId != null) {
      _peerUserId = widget.peerUserId;
    }

    listScrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    if (!listScrollController.hasClients) return;
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange &&
        _limit <= listOfMessages.length) {
      setState(() {
        _limit += _limitIncrement;

        context.read<GetConversationMessagesCubit>().loadMore(
              maxResultCount: _limit,
              conversationId: _chat?.id,
            );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.6),
        elevation: 1,
        title: Row(
          children: [
            CachedNetworkImage(
                imageUrl: '$kDownloadFilesURL/${widget.peerUserImage ?? ''}',
                httpHeaders: {
                  'Authorization': 'Bearer ${globalAppStorage.getAccessToken()}'
                },
                imageBuilder: (ctx, image) => CircleAvatar(
                  backgroundImage: image,
                ),
                progressIndicatorBuilder: (context, url, loadingProgress) {
                  return Center(
                    child: Transform.scale(
                      scale: 0.5,
                      child: CircularProgressIndicator(
                        value: loadingProgress.progress,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, stackTrace) {
                  return const Icon(
                    Icons.account_circle,
                    size: 40,
                    color: Colors.white,
                  );
                },
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),

            const SizedBox(
              width: 8,
            ),
            Text(
              widget.peerUserName ?? '-',
            ),
          ],
        ),
      ),
      body: BlocListener<CreateMessageCubit, CreateMessageState>(
        listener: (context, state) {
          if (state is CreateMessageSuccess) {
            textEditingController.clear();

            setState(() {
              listOfMessages.add(state.data);
              listOfMessages
                  .sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));

              _isThereMessageTyped = false;
            });

            if (listScrollController.hasClients) {
              listScrollController.animateTo(0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut);
            }

            context.read<CreateMessageCubit>().resetState();
          }

          if (state is CreateMessageError) {
            showNetworkException(context: context, error: state.error);

            context.read<CreateMessageCubit>().resetState();
          }
        },
        child: BlocListener<DeleteMessageCubit, DeleteMessageState>(
          listener: (context, state) {
            if (state is DeleteMessageSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم حذف الرسالة بنجاح'),
                ),
              );

              context.read<DeleteMessageCubit>().resetState();
            }

            if (state is DeleteMessageError) {
              showNetworkException(context: context, error: state.error);

              context.read<DeleteMessageCubit>().resetState();
            }
          },
          child: SafeArea(
              child: Column(
            children: [
              buildMessagesList(),
              buildInput(),
            ],
          )),
        ),
      ),
    );
  }

  Future<void> onSendMessage(
    String content,
  ) async {
    await context.read<CreateMessageCubit>().createMessage(
          CreateMessageDto(
            senderId: currentUserId,
            receiverId: _peerUserId ?? 0,
            content: content.trim(),
            conversationId: _chat?.id,
          ),
        );
  }

  Widget buildMessagesList() {
    return Flexible(
      child: _chat == null
          ? listOfMessages.isEmpty
              ? const Center(child: Text("لا يوجد رسائل بعد"))
              : messagesList()
          : BlocBuilder<GetConversationMessagesCubit,
              GetConversationMessagesState>(
              builder: (context, state) {
                if (state is GetConversationMessagesLoading) {
                  return const CenteredProgressIndicator(verticalPadding: 0);
                }

                if (state is GetConversationMessagesError) {
                  return const CenteredErrorMessage(
                    verticalPadding: 0,
                  );
                }

                if (state is GetConversationMessagesEmpty) {
                  return const Center(child: Text("لا يوجد رسائل بعد"));
                }

                if (state is GetConversationMessagesSuccess) {
                  listOfMessages = state.data;

                  return messagesList();
                }

                return const SizedBox.shrink();
              },
            ),
    );
  }

  Widget messagesList() {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        MessageDto item = listOfMessages[index];

        if (item.createdDate == null) {
          item = item.copyWith(createdDate: DateTime.now());
        }
        return buildMessageItem(index, item);
      },
      itemCount: listOfMessages.length,
      reverse: true,
      controller: listScrollController,
    );
  }

  Widget buildInput() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade400,
            width: 0.5,
          ),
        ),
        color: Colors.white,
      ),
      child: BlocBuilder<CreateMessageCubit, CreateMessageState>(
        builder: (context, state) {
          return Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextField(
                  onSubmitted: (text) {
                    if (text.isNotEmpty) {
                      onSendMessage(
                        textEditingController.text,
                      );
                    }
                  },
                  onChanged: (text) {
                    setState(() {
                      _isThereMessageTyped = text.isNotEmpty;
                    });
                  },
                  style: const TextStyle(fontSize: 15),
                  controller: textEditingController,
                  decoration: const InputDecoration.collapsed(
                    hintText: 'اكتب رسالة...',
                  ),
                  autofocus: false,
                ),
              ),
              Material(
                color: Colors.white,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: IconButton(
                    icon: const Icon(Icons.send_outlined),
                    onPressed: state is CreateMessageLoading
                        ? null
                        : !_isThereMessageTyped
                            ? null
                            : () => onSendMessage(
                                  textEditingController.text,
                                ),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              if (state is CreateMessageLoading)
            ...[    Transform.scale(
                    scale: 0.6,
                    child: const CircularProgressIndicator()),
              addHorizontalSize(5),
          ]
            ],
          );
        },
      ),
    );
  }

  Widget buildMessageItem(int index, MessageDto message) {
    if (message.senderId == currentUserId) {
      // Right (my message)
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: (message.content?.length ?? 0) < 15
                ? (message.content?.length ?? 0) < 7
                    ? 140
                    : 180
                : (message.content?.length ?? 0) > 50
                    ? 290
                    : 230,
            child: Container(
              margin: EdgeInsets.only(
                  bottom: isLastMessageFromPeer(index) ? 20 : 10, right: 10),
              child: InkWell(
                onTap: () => onDeleteMessage(
                  message,
                ),
                borderRadius: BorderRadius.circular(18),
                child: Card(
                  color: Colors.blue,
                  elevation: 0.1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: (message.content?.length ?? 0) < 15
                        ? IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Text(
                                        (message.createdDate as DateTime)
                                            .getTimeString(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 11),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    message.content ?? '',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  textAlign: RegExp(r'[a-zA-Z]').hasMatch(
                                          message.content?.substring(0, 1) ??
                                              '-')
                                      ? TextAlign.end
                                      : TextAlign.start,
                                  message.content ?? '',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  (message.createdDate as DateTime)
                                      .getTimeString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 11),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      // Left (peer message)
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: (message.content?.length ?? 0) < 15
                      ? (message.content?.length ?? 0) < 7
                          ? 140
                          : 180
                      : (message.content?.length ?? 0) > 50
                          ? 290
                          : 230,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(18)),
                  margin: const EdgeInsets.only(left: 10),
                  child: (message.content?.length ?? 0) < 15
                      ? IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      (message.createdDate as DateTime)
                                          .getTimeString(),
                                      style: const TextStyle(
                                          color: Colors.black87, fontSize: 11),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  message.content ?? '',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                textAlign: RegExp(r'[a-zA-Z]').hasMatch(
                                        message.content?.substring(0, 1) ?? '-')
                                    ? TextAlign.end
                                    : TextAlign.start,
                                message.content ?? '',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                (message.createdDate as DateTime)
                                    .getTimeString(),
                                style: const TextStyle(
                                    color: Colors.black87, fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                ),
                isLastMessageFromMe(index)
                    ? Material(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: CachedNetworkImage(
                          imageUrl: widget.peerUserImage ?? '',
                          imageBuilder: (ctx, image) => Image(image: image),
                          progressIndicatorBuilder:
                              (context, url, loadingProgress) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor,
                                value: loadingProgress.progress,
                              ),
                            );
                          },
                          errorWidget: (context, url, stackTrace) {
                            return const Icon(
                              Icons.account_circle,
                              size: 35,
                              color: Colors.grey,
                            );
                          },
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(width: 35),
              ],
            ),

            // Time
            isLastMessageFromMe(index)
                ? Container(
                    margin: const EdgeInsets.only(left: 50, top: 5, bottom: 5),
                    child: Text(
                      (message.createdDate as DateTime).getTimeString(),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontStyle: FontStyle.italic),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      );
    }
  }

  void onDeleteMessage(MessageDto message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: const [
            Icon(Icons.delete_forever),
            SizedBox(
              width: 10,
            ),
            Text('حذف الرسالة'),
          ],
        ),
        content: const Text('هل أنت متأكد من حذف هذه الرسالة نهائياً؟'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('تراجع')),
          TextButton(
            onPressed: () {
              context.read<DeleteMessageCubit>().deleteMessage(message.id!);
              Navigator.pop(context);
            },
            child: Text(
              'حذف',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isLastMessageFromMe(int index) {
    if ((index > 0 && listOfMessages[index - 1].senderId == currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isLastMessageFromPeer(int index) {
    if ((index > 0 && listOfMessages[index - 1].senderId != currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }
}
