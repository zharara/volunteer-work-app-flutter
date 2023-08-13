import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../blocs/notifications/get_all_notifications/get_all_notifications_cubit.dart';
import '../../../utils/exception_handlers.dart';
import '../../common_components/centered_error_message.dart';
import '../../common_components/centered_progress_indicator.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetAllNotificationsCubit>(context).getAllNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإشعارات'),
      ),
      body: BlocConsumer<GetAllNotificationsCubit, GetAllNotificationsState>(
        listener: (context, state) {
          if (state is GetAllNotificationsError) {
            showNetworkException(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is GetAllNotificationsLoading) {
            return const CenteredProgressIndicator(verticalPadding: 0);
          }
          if (state is GetAllNotificationsError) {
            return const CenteredErrorMessage(
              verticalPadding: 0,
            );
          }

          if (state is GetAllNotificationsEmpty) {
            return const Center(
              child: Text('لا يوجد إشعارات بعد'),
            );
          }
          if (state is GetAllNotificationsSuccess) {
            return ListView.builder(
                itemCount: state.data.length,
                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (ctx) => ApplyForOpportunityPage(
                          //         volunteerOpportunityDto: state.data[index]),
                          //   ),
                          // );
                        },
                        icon: const Icon(Icons.arrow_forward)),
                    leading: const Icon(
                      Icons.notifications_active,
                      size: 30,
                      color: Colors.amber,
                    ),
                    title: Text(state.data[index].title ?? '-'),
                    isThreeLine: true,
                    subtitle: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.data[index].body ?? '-'),
                        Text(state.data[index].createdDate?.getDateString() ??
                            '-'),
                      ],
                    ),
                  );
                });
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
