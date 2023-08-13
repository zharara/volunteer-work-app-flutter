import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/student_applications/get_applications_of_student/get_applications_of_student_cubit.dart';

import '../../../../constants/api_constants.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/application_status_chip.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import 'student_edit_application_page.dart';

class StudentListApplicationsPage extends StatefulWidget {
  const StudentListApplicationsPage({Key? key}) : super(key: key);

  @override
  State<StudentListApplicationsPage> createState() => _StudentListApplicationsPageState();
}

class _StudentListApplicationsPageState extends State<StudentListApplicationsPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetApplicationsOfStudentCubit>(context)
        .getApplicationsOfStudent(
      studentId: globalAppStorage.getStudentAccount()?.id ?? 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('طلبات التطوع'),
      ),
      body: BlocConsumer<GetApplicationsOfStudentCubit,
          GetApplicationsOfStudentState>(
        listener: (context, state) {
          if (state is GetApplicationsOfStudentError) {
            showNetworkException(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is GetApplicationsOfStudentLoading) {
            return const CenteredProgressIndicator(verticalPadding: 0);
          }
          if (state is GetApplicationsOfStudentError) {
            return const CenteredErrorMessage(verticalPadding: 0);
          }
          if (state is GetApplicationsOfStudentEmpty) {
            return const CenteredEmptyData();
          }
          if (state is GetApplicationsOfStudentSuccess) {
            return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (ctx, index) {
                  final item = state.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(3),
                    child:  Card(
                      child: ListTile(
                        leading: item.student?.profilePicture == null
                            ? null
                            : CircleAvatar(
                          backgroundImage: NetworkImage(
                              '$kDownloadFilesURL/${item.volunteerOpportunity?.logo?.fileKey ?? ''}',
                              headers: {
                                'Authorization':
                                globalAppStorage.getAccessToken()
                              }),
                        ),
                        title: Text(item.volunteerOpportunity?.title ?? '-'),
                        isThreeLine: true,
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.volunteerOpportunity?.organization?.fullName ?? '-'),
                            addVerticalSize(5),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('الإدارة: '),
                                    ApplicationStatusChip(
                                        status: item.statusForManagement)
                                  ],
                                ),
                                addHorizontalSize(4),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('المؤسسة: '),
                                    ApplicationStatusChip(
                                        status: item.statusForOrganization)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            StudentEditApplicationPage(
                                              applicationDto: item,
                                            )),
                                  );
                                },
                                icon: const Icon(Icons.arrow_forward)),
                          ],
                        ),
                      ),
                    )
                  );
                });
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
