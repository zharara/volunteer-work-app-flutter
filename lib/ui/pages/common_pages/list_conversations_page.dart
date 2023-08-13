import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/main.dart';
import 'package:volunteer_work_app/ui/pages/common_pages/conversation_messages_page.dart';

import '../../../blocs/conversations/get_conversations/get_conversations_cubit.dart';
import '../../../constants/api_constants.dart';
import '../../common_components/centered_error_message.dart';

class ListConversationsPage extends StatefulWidget {
  const ListConversationsPage({Key? key}) : super(key: key);

  @override
  State<ListConversationsPage> createState() => _ListConversationsPageState();
}

class _ListConversationsPageState extends State<ListConversationsPage> {
  @override
  void initState() {
    super.initState();

    context.read<GetConversationsCubit>().getConversations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المحادثات'),
      ),
      body: BlocBuilder<GetConversationsCubit, GetConversationsState>(
        builder: (context, state) {
          if (state is GetConversationsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is GetConversationsEmpty) {
            return const Center(
              child: Text('لا يوجد محادثات بعد'),
            );
          }

          if (state is GetConversationsError) {
            return const CenteredErrorMessage(
              verticalPadding: 0,
            );
          }

          if (state is GetConversationsSuccess) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (BuildContext context, int index) {
                final item = state.data[index];

                int currentUserId = globalAppStorage.getCurrentAccountId();

                final peerId =
                    item.user1Id != currentUserId ? item.user1Id : item.user2Id;

                bool isPeer1 = item.user1Id != currentUserId;

                return Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: ListTile(
                    leading: Stack(
                      children: [
                        Material(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                          color: Colors.transparent,
                          clipBehavior: Clip.hardEdge,
                          child: CachedNetworkImage(
                            imageUrl:
                                '$kDownloadFilesURL/${isPeer1 ? item.user1?.profilePicture?.fileKey ?? '' : item.user2?.profilePicture?.fileKey ?? ''}',
                            httpHeaders: {
                              'Authorization':
                                  'Bearer ${globalAppStorage.getAccessToken()}'
                            },
                            imageBuilder: (ctx, image) => Image(
                              image: image,
                              width: 45,
                              height: 45,
                              fit: BoxFit.cover,
                            ),
                            progressIndicatorBuilder:
                                (context, url, loadingProgress) {
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
                                size: 45,
                                color: Colors.grey,
                              );
                            },
                            width: 45,
                            height: 45,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 8,
                              child: CircleAvatar(
                                backgroundColor:
                                    // (isPeer1 && item.user1Online) ||
                                    //         (!isPeer1 && item.user2Online)
                                    //     ? Colors.greenAccent.shade400
                                    //     :
                                    Theme.of(context).disabledColor,
                                radius: 6.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    title: Text(isPeer1
                        ? item.user1?.fullName ?? '-'
                        : item.user2?.fullName ?? ''),
                    // subtitle:
                    //     lastMessage == null && item.lastMessageTime == null
                    //         ? null
                    //         : Text(
                    //             lastMessage != null
                    //                 ? lastMessage.type == ChatMessageType.image
                    //                     ? 'صورة'
                    //                     : lastMessage.content
                    //                 : item.lastMessageContent ?? '',
                    //             style: const TextStyle(color: Colors.black),
                    //             maxLines: 1,
                    //             overflow: TextOverflow.ellipsis,
                    //           ),
                    // trailing: Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    //     if (lastMessage != null || item.lastMessageTime != null)
                    //       Text(
                    //         timeago.format(
                    //           lastMessage?.createdAtServerTimestamp != null
                    //               ? (lastMessage?.createdAtServerTimestamp
                    //                   as DateTime)
                    //               : item.lastMessageTime?.toDate() ??
                    //                   DateTime.now(),
                    //           locale: 'ar',
                    //         ),
                    //         style: const TextStyle(
                    //             color: Colors.grey, fontSize: 12),
                    //       ),
                    //     if ((isPeer1 && ((item.user2UnreadCount as int) > 0)) ||
                    //         (!isPeer1 && ((item.user1UnreadCount as int) > 0)))
                    //       const SizedBox(
                    //         width: 8,
                    //       ),
                    //     if ((isPeer1 && ((item.user2UnreadCount as int) > 0)) ||
                    //         (!isPeer1 && ((item.user1UnreadCount as int) > 0)))
                    //       CircleAvatar(
                    //         backgroundColor: Colors.green,
                    //         radius: 12,
                    //         child: Text(
                    //           isPeer1
                    //               ? (item.user2UnreadCount as int).toString()
                    //               : (item.user1UnreadCount as int).toString(),
                    //           style: const TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.white,
                    //             fontSize: 14,
                    //           ),
                    //         ),
                    //       )
                    //   ],
                    // ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (c) => ConversationMessagesPage(
                            conversationDto: item,
                            isPeer1: isPeer1,
                            peerUserName: isPeer1
                                ? item.user1?.fullName ?? '-'
                                : item.user2?.fullName ?? '-',
                            peerUserImage: isPeer1
                                ? item.user1?.profilePicture?.fileKey ?? '-'
                                : item.user2?.profilePicture?.fileKey ?? '-',
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
