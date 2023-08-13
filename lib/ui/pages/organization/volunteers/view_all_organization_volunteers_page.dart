import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/main.dart';

import '../../../../blocs/volunteer_students/get_volunteers_of_organization/get_volunteers_of_organization_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../common_pages/view_student_profile_page.dart';

class ViewAllOrganizationVolunteersPage extends StatefulWidget {
  const ViewAllOrganizationVolunteersPage({Key? key}) : super(key: key);

  @override
  State<ViewAllOrganizationVolunteersPage> createState() =>
      _ViewAllOrganizationVolunteersPageState();
}

class _ViewAllOrganizationVolunteersPageState
    extends State<ViewAllOrganizationVolunteersPage> {
  @override
  void initState() {
    super.initState();

    if (BlocProvider.of<GetVolunteersOfOrganizationCubit>(context).state
        is! GetVolunteersOfOrganizationSuccess) {
      BlocProvider.of<GetVolunteersOfOrganizationCubit>(context)
          .getVolunteersOfOrganization(
              globalAppStorage.getOrganizationAccount()?.id ?? 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المتطوعون'),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<GetVolunteersOfOrganizationCubit>(context)
                    .getVolunteersOfOrganization(
                        globalAppStorage.getOrganizationAccount()?.id ?? 0);
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: BlocConsumer<GetVolunteersOfOrganizationCubit,
          GetVolunteersOfOrganizationState>(
        listener: (context, state) {
          if (state is GetVolunteersOfOrganizationError) {
            showNetworkException(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is GetVolunteersOfOrganizationLoading) {
            return const CenteredProgressIndicator(verticalPadding: 0);
          }
          if (state is GetVolunteersOfOrganizationError) {
            return const CenteredErrorMessage(
              verticalPadding: 0,
            );
          }
          if (state is GetVolunteersOfOrganizationEmpty) {
            return const CenteredEmptyData();
          }
          if (state is GetVolunteersOfOrganizationSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<GetVolunteersOfOrganizationCubit>(context)
                    .getVolunteersOfOrganization(
                        globalAppStorage.getOrganizationAccount()?.id ?? 0);
              },
              child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Card(
                        child: ListTile(
                          leading: Container(
                            child: state.data[index].student?.profilePicture ==
                                    null
                                ? const Icon(
                                    Icons.person,
                                    size: 35,
                                    color: Colors.indigoAccent,
                                  )
                                : CachedNetworkImage(
                                    imageUrl:
                                        '$kDownloadFilesURL/${state.data[index].student?.profilePicture?.fileKey ?? ''}',
                                    httpHeaders: {
                                      'Authorization':
                                          'Bearer ${globalAppStorage.getAccessToken()}'
                                    },
                                    imageBuilder: (ctx, image) {
                                      return CircleAvatar(
                                          backgroundImage: image);
                                    },
                                    progressIndicatorBuilder:
                                        (ctx, url, downloadProgress) {
                                      return CircularProgressIndicator(
                                        value: downloadProgress.progress,
                                      );
                                    },
                                    errorWidget: (ctx, url, error) {
                                      return const Icon(
                                        Icons.error_outline,
                                        size: 32,
                                      );
                                    },
                                  ),
                          ),
                          title:
                              Text(state.data[index].student?.fullName ?? '-'),
                          isThreeLine: true,
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.data[index].student?.universityIdNumber
                                      .toString() ??
                                  '-'),
                              Text(
                                  'البرنامج: ${state.data[index].volunteerProgram?.title ?? '-'}'
                                  ),
                            ],
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => ViewStudentProfilePage(
                                        studentDto: state.data[index].student!),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.arrow_forward)),
                        ),
                      ),
                    );
                  }),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
