import 'package:collection/collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:volunteer_work_app/blocs/program_tasks/get_tasks_of_program/get_tasks_of_program_cubit.dart';
import 'package:volunteer_work_app/blocs/task_accomplishes/get_task_accomplishes_of_volunteer/get_task_accomplishes_of_volunteer_cubit.dart';
import 'package:volunteer_work_app/blocs/work_day_attendance/get_work_attendances_of_volunteer/get_work_attendances_of_volunteer_cubit.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/main.dart';
import 'package:volunteer_work_app/ui/common_components/input_page_title.dart';
import 'package:volunteer_work_app/ui/pages/student/tasks/student_view_task_details_page.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../../blocs/program_photos/delete_program_photo/delete_program_photo_cubit.dart';
import '../../../../blocs/program_photos/get_photos_of_program/get_photos_of_program_cubit.dart';
import '../../../../blocs/volunteer_students/get_volunteer_by_student_id/get_volunteer_by_student_id_cubit.dart';
import '../../../../blocs/work_days/get_work_days_of_program/get_work_days_of_program_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../../utils/pick_images.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/details_item.dart';
import '../../../common_components/snack_bars.dart';
import '../../common_pages/preview_to_upload_photo_page.dart';
import '../../common_pages/view_organization_profile_page.dart';

class StudentViewEnrolledProgramPage extends StatefulWidget {
  const StudentViewEnrolledProgramPage({Key? key}) : super(key: key);

  @override
  State<StudentViewEnrolledProgramPage> createState() =>
      _StudentViewEnrolledProgramPageState();
}

class _StudentViewEnrolledProgramPageState
    extends State<StudentViewEnrolledProgramPage> {
  VolunteerStudentDto? volunteerStudentDto;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();

    context
        .read<GetVolunteerByStudentIdCubit>()
        .getVolunteer(globalAppStorage.getStudentAccount()?.id ?? 0);
  }

  String tabTitle() {
    switch (_tabIndex) {
      case 0:
        return 'برنامجي';
      case 1:
        return 'المهام';
      case 2:
        return 'أيام العمل';
      case 3:
        return 'ألبوم صور البرنامج';
      default:
        return 'برنامجي';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(tabTitle()),
          actions: [
            IconButton(
              onPressed: () {
                switch (_tabIndex) {
                  case 0:
                    context.read<GetVolunteerByStudentIdCubit>().getVolunteer(
                        globalAppStorage.getStudentAccount()?.id ?? 0);
                    break;
                  case 1:
                    if (volunteerStudentDto != null) {
                      context.read<GetTasksOfProgramCubit>().getTasksOfProgram(
                          programId:
                              volunteerStudentDto!.volunteerProgram?.id ?? 0);

                      context
                          .read<GetTaskAccomplishesOfVolunteerCubit>()
                          .getTaskAccomplishesOfVolunteer(
                              volunteerStudentDto?.id ?? 0);
                    }
                    break;
                  case 2:
                    if (volunteerStudentDto != null) {
                      context
                          .read<GetWorkDaysOfProgramCubit>()
                          .getWorkDaysOfProgram(
                              volunteerStudentDto!.volunteerProgram?.id ?? 0);

                      context
                          .read<GetWorkAttendancesOfVolunteerCubit>()
                          .getWorkAttendancesOfVolunteer(
                              volunteerStudentDto?.id ?? 0);
                    }
                    break;
                  case 3:
                    if (volunteerStudentDto != null) {
                      context
                          .read<GetPhotosOfProgramCubit>()
                          .getPhotosOfProgram(
                              programId:
                                  volunteerStudentDto!.volunteerProgram?.id ??
                                      0);
                    }
                    break;
                }
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                _tabIndex = index;
              });

              if (volunteerStudentDto != null) {
                switch (index) {
                  case 1:
                    if (volunteerStudentDto != null) {
                      if (context.read<GetTasksOfProgramCubit>().state
                              is! GetTasksOfProgramSuccess &&
                          context.read<GetTasksOfProgramCubit>().state
                              is! GetTasksOfProgramLoading) {
                        context
                            .read<GetTasksOfProgramCubit>()
                            .getTasksOfProgram(
                                programId:
                                    volunteerStudentDto!.volunteerProgram?.id ??
                                        0);

                        context
                            .read<GetTaskAccomplishesOfVolunteerCubit>()
                            .getTaskAccomplishesOfVolunteer(
                                volunteerStudentDto?.id ?? 0);
                      }
                    }
                    break;

                  case 2:
                    if (volunteerStudentDto != null) {
                      if (context.read<GetWorkDaysOfProgramCubit>().state
                              is! GetWorkDaysOfProgramSuccess &&
                          context.read<GetWorkDaysOfProgramCubit>().state
                              is! GetWorkDaysOfProgramLoading) {
                        context
                            .read<GetWorkDaysOfProgramCubit>()
                            .getWorkDaysOfProgram(
                                volunteerStudentDto!.volunteerProgram?.id ?? 0);

                        context
                            .read<GetWorkAttendancesOfVolunteerCubit>()
                            .getWorkAttendancesOfVolunteer(
                                volunteerStudentDto?.id ?? 0);
                      }
                    }
                    break;

                  case 3:
                    if (volunteerStudentDto != null) {
                      if (context.read<GetPhotosOfProgramCubit>().state
                              is! GetPhotosOfProgramSuccess &&
                          context.read<GetPhotosOfProgramCubit>().state
                              is! GetPhotosOfProgramLoading) {
                        context
                            .read<GetPhotosOfProgramCubit>()
                            .getPhotosOfProgram(
                                programId:
                                    volunteerStudentDto!.volunteerProgram?.id ??
                                        0);
                      }
                    }
                    break;
                }
              }
            },
            tabs: const [
              Tab(icon: Icon(Icons.list_alt)),
              Tab(icon: Icon(Icons.task)),
              Tab(icon: Icon(Icons.calendar_month)),
              Tab(icon: Icon(Icons.photo_album_outlined)),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            detailsTab(),
            tasksTab(),
            workDaysTab(),
            photosTab(),
          ],
        ),
        floatingActionButton: volunteerStudentDto != null && _tabIndex == 3
            ? FloatingActionButton(
                onPressed: () async {
                  final image = await pickImage();
                  if (image != null) {
                    if (mounted) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PreviewToUploadPhoto(
                                image: image,
                                programId: volunteerStudentDto!.id ?? 0),
                          ));
                    }
                  }
                },
                child: const Icon(Icons.add),
              )
            : null,
      ),
    );
  }

  Widget detailsTab() {
    return BlocConsumer<GetVolunteerByStudentIdCubit,
        GetVolunteerByStudentIdState>(
      listener: (context, state) {
        if (state is GetVolunteerByStudentIdError) {
          showNetworkException(context: context, error: state.error);
        }

        if (state is GetVolunteerByStudentIdSuccess) {
          volunteerStudentDto = state.data;
        }
      },
      builder: (context, state) {
        if (state is GetVolunteerByStudentIdLoading) {
          return const CenteredProgressIndicator(verticalPadding: 0);
        }
        if (state is GetVolunteerByStudentIdError) {
          return const CenteredErrorMessage(verticalPadding: 0);
        }
        if (state is GetVolunteerByStudentIdEmpty) {
          return const Center(child: Text('لم يتم الالتحاق بأي برنامج بعد'));
        }

        if (state is GetVolunteerByStudentIdSuccess) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSize(20),
                  Row(
                    children: [
                      Container(
                        child: state.data.volunteerProgram?.logo == null
                            ? const Icon(
                                Icons.workspace_premium,
                                size: 40,
                                color: Colors.indigoAccent,
                              )
                            : CachedNetworkImage(
                                imageUrl:
                                    '$kDownloadFilesURL/${state.data.volunteerProgram?.logo?.fileKey ?? ''}',
                                httpHeaders: {
                                  'Authorization':
                                      'Bearer ${globalAppStorage.getAccessToken()}'
                                },
                                imageBuilder: (ctx, image) {
                                  return CircleAvatar(
                                      radius: 55, backgroundImage: image);
                                },
                                progressIndicatorBuilder:
                                    (ctx, url, downloadProgress) {
                                  return CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                  );
                                },
                                errorWidget: (ctx, url, error) {
                                  return const Icon(
                                    Icons.broken_image_outlined,
                                    size: 40,
                                  );
                                },
                              ),
                      ),
                      addHorizontalSize(15),
                      Flexible(
                        child: Text(
                          state.data.volunteerProgram?.title ?? '-',
                          style: const TextStyle(fontSize: 21),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Divider(
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  addVerticalSize(10),
                  DetailsItem(
                    title: 'التصنيف/الفئة:',
                    details: state.data.volunteerProgram?.category?.name ?? '-',
                  ),
                  DetailsItem(
                    title: 'نوع البرنامج:',
                    details: (state.data.volunteerProgram?.isInternalProgram ??
                            false)
                        ? 'برنامج داخلي (إدارة)'
                        : 'برنامج مؤسسة',
                  ),
                  DetailsItem(
                    title: 'الوصف:',
                    details: state.data.volunteerProgram?.description ?? '-',
                  ),
                  DetailsItem(
                    title: 'تاريخ بدء البرنامج:',
                    details: state.data.volunteerProgram?.startDate
                            ?.getDateString() ??
                        '-',
                  ),
                  DetailsItem(
                    title: 'تاريخ انتهاء البرنامج:',
                    details:
                        state.data.volunteerProgram?.endDate?.getDateString() ??
                            '-',
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Divider(
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  Text('معلومات المؤسسة/الشركة:',
                      style: const TextStyle(
                        fontSize: 17,
                      )),
                  Card(
                    child: ListTile(
                      leading: Container(
                        child: state.data.volunteerProgram?.organization
                                    ?.profilePicture ==
                                null
                            ? const Icon(
                                Icons.account_balance,
                                size: 35,
                                color: Colors.indigoAccent,
                              )
                            : CachedNetworkImage(
                                imageUrl:
                                    '$kDownloadFilesURL/${state.data.volunteerProgram?.organization?.profilePicture?.fileKey ?? ''}',
                                httpHeaders: {
                                  'Authorization':
                                      'Bearer ${globalAppStorage.getAccessToken()}'
                                },
                                imageBuilder: (ctx, image) {
                                  return CircleAvatar(backgroundImage: image);
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
                      title: Text(
                          state.data.volunteerProgram?.organization?.fullName ??
                              '-'),
                      isThreeLine: true,
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.data.volunteerProgram?.organization
                                  ?.fieldOfWork ??
                              '-'),
                          Text(state.data.volunteerProgram?.organization
                                  ?.address ??
                              '-'),
                        ],
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => ViewOrganizationProfilePage(
                                    organization: state
                                        .data.volunteerProgram!.organization!),
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Divider(
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  const SectionTitle(title: 'التقييمات'),
                  if (!(state.data.volunteerProgram?.isInternalProgram ??
                      false)) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailsItem(
                          title: 'تقييم المؤسسة:',
                          details: state.data.orgAssessmentGrade?.toString() ??
                              'لم يتم التقييم بعد',
                        ),
                        if (state.data.orgAssessmentGrade != null)
                          RatingBarIndicator(
                            rating: (state.data.orgAssessmentGrade ?? 0) / 20,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20.0,
                          ),
                      ],
                    ),
                    DetailsItem(
                      title: 'ملاحظات تقييم المؤسسة:',
                      details: state.data.orgAssessmentGradeNotes ??
                          'لم يتم التقييم بعد',
                    ),
                    const Divider(
                      endIndent: 200,
                    ),
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailsItem(
                        title: 'تقييم الإدارة النهائي:',
                        details: state.data.finalGrade?.toString() ??
                            'لم يتم التقييم بعد',
                      ),
                      if (state.data.finalGrade != null)
                        RatingBarIndicator(
                          rating: (state.data.finalGrade ?? 0) / 20,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                        ),
                    ],
                  ),
                  DetailsItem(
                    title: 'ملاحظات تقييم الإدارة النهائي:',
                    details: state.data.finalGradeNotes ?? 'لم يتم التقييم بعد',
                  ),
                  addVerticalSize(30),
                ],
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget tasksTab() {
    return BlocConsumer<GetTasksOfProgramCubit, GetTasksOfProgramState>(
      listener: (context, state) {
        if (state is GetTasksOfProgramError) {
          showNetworkException(context: context, error: state.error);
        }
      },
      builder: (context, taskState) {
        if (taskState is GetTasksOfProgramLoading) {
          return const CenteredProgressIndicator(
            verticalPadding: 50,
          );
        }
        if (taskState is GetTasksOfProgramError) {
          return const CenteredErrorMessage(
            verticalPadding: 50,
          );
        }

        if (taskState is GetTasksOfProgramEmpty) {
          return const CenteredEmptyData();
        }
        if (taskState is GetTasksOfProgramSuccess) {
          return BlocBuilder<GetTaskAccomplishesOfVolunteerCubit,
              GetTaskAccomplishesOfVolunteerState>(
            builder: (context, accomplishState) {
              if (accomplishState is GetTaskAccomplishesOfVolunteerLoading) {
                return const CenteredProgressIndicator(
                  verticalPadding: 50,
                );
              }
              if (accomplishState is GetTaskAccomplishesOfVolunteerError) {
                return const CenteredErrorMessage(
                  verticalPadding: 50,
                );
              }

              if (accomplishState is GetTaskAccomplishesOfVolunteerEmpty) {
                return const CenteredEmptyData();
              }

              if (accomplishState is GetTaskAccomplishesOfVolunteerSuccess) {
                return Column(
                  children: [
                    for (final taskItem in taskState.data)
                      Builder(builder: (context) {
                        VolunteerStudentTaskAccomplishDto? taskAccomplishItem =
                            accomplishState.data.firstWhereOrNull(
                          (e) => e.volunteerProgramTaskId == taskItem.id,
                        );

                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Card(
                            child: ListTile(
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                      value:
                                          taskAccomplishItem?.isAccomplished ??
                                              false,
                                      onChanged: null),
                                  addHorizontalSize(8),
                                  const Icon(
                                    Icons.task,
                                    color: Colors.amber,
                                    size: 30,
                                  ),
                                ],
                              ),
                              title: Text(taskItem.title ?? '-'),
                              isThreeLine:
                                  taskAccomplishItem?.isAccomplished ?? false,
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          'تبدأ: ${taskItem.startDate?.getDateString()}'),
                                      addHorizontalSize(5),
                                      const Text('|'),
                                      addHorizontalSize(5),
                                      Text(
                                          'تنتهي: ${taskItem.endDate?.getDateString()}'),
                                    ],
                                  ),
                                  if (taskAccomplishItem?.isAccomplished ??
                                      false)
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                            'التقييم: ${taskAccomplishItem?.rate ?? 0}'),
                                        addHorizontalSize(10),
                                        RatingBarIndicator(
                                          rating:
                                              (taskAccomplishItem?.rate ?? 0) /
                                                  2,
                                          itemBuilder: (context, index) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) =>
                                            StudentViewTaskDetailsPage(
                                          taskDto: taskItem,
                                          taskAccomplishDto: taskAccomplishItem,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.arrow_forward)),
                            ),
                          ),
                        );
                      })
                  ],
                );
              }

              return const SizedBox.shrink();
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget workDaysTab() {
    return BlocConsumer<GetWorkDaysOfProgramCubit, GetWorkDaysOfProgramState>(
      listener: (context, state) {
        if (state is GetWorkDaysOfProgramError) {
          showNetworkException(context: context, error: state.error);
        }
      },
      builder: (context, workDayState) {
        if (workDayState is GetWorkDaysOfProgramLoading) {
          return const CenteredProgressIndicator(
            verticalPadding: 50,
          );
        }
        if (workDayState is GetWorkDaysOfProgramError) {
          return const CenteredErrorMessage(
            verticalPadding: 50,
          );
        }

        if (workDayState is GetWorkDaysOfProgramEmpty) {
          return const CenteredEmptyData();
        }
        if (workDayState is GetWorkDaysOfProgramSuccess) {
          return BlocBuilder<GetWorkAttendancesOfVolunteerCubit,
              GetWorkAttendancesOfVolunteerState>(
            builder: (context, attendanceState) {
              if (attendanceState is GetWorkAttendancesOfVolunteerLoading) {
                return const CenteredProgressIndicator(
                  verticalPadding: 50,
                );
              }
              if (attendanceState is GetWorkAttendancesOfVolunteerError) {
                return const CenteredErrorMessage(
                  verticalPadding: 50,
                );
              }

              if (attendanceState is GetWorkAttendancesOfVolunteerEmpty) {
                return const CenteredEmptyData();
              }

              if (attendanceState is GetWorkAttendancesOfVolunteerSuccess) {
                return Column(
                  children: [
                    for (final workDayItem in workDayState.data)
                      Builder(builder: (context) {
                        VolunteerStudentWorkAttendanceDto? attendanceItem =
                            attendanceState.data.firstWhereOrNull(
                          (e) => e.volunteerProgramWorkDayId == workDayItem.id,
                        );

                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Card(
                            child: ListTile(
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                      value:
                                          attendanceItem?.isAttended ?? false,
                                      onChanged: null),
                                  addHorizontalSize(8),
                                  const Icon(
                                    Icons.calendar_month_outlined,
                                    color: Colors.deepOrangeAccent,
                                    size: 30,
                                  ),
                                ],
                              ),
                              title: Text(workDayItem.name ?? '-'),
                              subtitle: Text(
                                  'التاريخ: ${workDayItem.date?.getDateString()}'),
                            ),
                          ),
                        );
                      })
                  ],
                );
              }

              return const SizedBox.shrink();
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget photosTab() {
    return BlocConsumer<GetPhotosOfProgramCubit, GetPhotosOfProgramState>(
      listener: (context, state) {
        if (state is GetPhotosOfProgramError) {
          showNetworkException(context: context, error: state.error);
        }
      },
      builder: (context, state) {
        if (state is GetPhotosOfProgramLoading) {
          return const CenteredProgressIndicator(
            verticalPadding: 50,
          );
        }
        if (state is GetPhotosOfProgramError) {
          return const CenteredErrorMessage(
            verticalPadding: 50,
          );
        }

        if (state is GetPhotosOfProgramEmpty) {
          return const CenteredEmptyData();
        }
        if (state is GetPhotosOfProgramSuccess) {
          return GridView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) =>
                buildImageCard(index, state.data[index]),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget buildImageCard(int index, VolunteerProgramGalleryPhotoDto item) =>
      Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            margin: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      '$kDownloadFilesURL/${item.photo?.fileKey ?? ''}',
                      headers: {
                        'Authorization':
                            'Bearer ${globalAppStorage.getAccessToken()}'
                      },
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: (item.volunteerStudentUploaderId ==
                            volunteerStudentDto?.id &&
                        !(item.isApproved ?? false))
                    ? Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(100)),
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (dContext) => BlocListener<
                                    DeleteProgramPhotoCubit,
                                    DeleteProgramPhotoState>(
                                  listener: (context, state) {
                                    if (state is DeleteProgramPhotoError) {
                                      showNetworkException(
                                          context: context, error: state.error);
                                    }

                                    if (state is DeleteProgramPhotoSuccess) {
                                      context
                                          .read<GetPhotosOfProgramCubit>()
                                          .deleteItemInternally(state.data.id!);

                                      Navigator.pop(context);

                                      showSuccessSnackBar(
                                        context: context,
                                        message:
                                            'تم حذف الصورة من الألبوم بنجاح',
                                      );
                                    }
                                  },
                                  child: AlertDialog(
                                    title: Row(
                                      children: const [
                                        Icon(
                                          Icons.delete_forever,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('حذف صورة من ألبوم البرنامج',
                                            style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                    content: const Text(
                                      'هل أنت متأكد من حذف هذه الصورة بشكل نهائي؟',
                                    ),
                                    actionsAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(dContext);
                                        },
                                        child: const Text('إغلاق'),
                                      ),
                                      BlocBuilder<DeleteProgramPhotoCubit,
                                          DeleteProgramPhotoState>(
                                        builder: (context, state) {
                                          if (state
                                              is DeleteProgramPhotoLoading) {
                                            return Transform.scale(
                                                scale: 0.7,
                                                child:
                                                    const CircularProgressIndicator());
                                          }

                                          return TextButton(
                                            onPressed: () {
                                              context
                                                  .read<
                                                      DeleteProgramPhotoCubit>()
                                                  .deleteProgramPhoto(
                                                    item.id!,
                                                  );
                                            },
                                            child: const Text(
                                              'تأكيد',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ),
      );
}
