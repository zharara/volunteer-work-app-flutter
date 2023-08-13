import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:volunteer_work_app/blocs/volunteer_programs/get_all_internal_programs/get_all_internal_programs_cubit.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/ui/common_components/change_volunteer_mng_final_grade.dart';
import 'package:volunteer_work_app/ui/pages/management/programs/update_internal_program_page.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../../blocs/program_photos/delete_program_photo/delete_program_photo_cubit.dart';
import '../../../../blocs/program_photos/get_photos_of_program/get_photos_of_program_cubit.dart';
import '../../../../blocs/program_tasks/get_tasks_of_program/get_tasks_of_program_cubit.dart';
import '../../../../blocs/volunteer_programs/update_internal_program/update_internal_program_cubit.dart';
import '../../../../blocs/volunteer_students/delete_volunteer/delete_volunteer_cubit.dart';
import '../../../../blocs/volunteer_students/get_volunteers_of_program/get_volunteers_of_program_cubit.dart';
import '../../../../blocs/work_days/get_work_days_of_program/get_work_days_of_program_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../../utils/pick_images.dart';
import '../../../common_components/add_new_task_floating_button.dart';
import '../../../common_components/add_new_volunteer_floating_button.dart';
import '../../../common_components/add_new_work_day_floating_button.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/details_item.dart';
import '../../../common_components/dialogs.dart';
import '../../../common_components/input_page_title.dart';
import '../../../common_components/snack_bars.dart';
import '../../../common_components/update_task_button.dart';
import '../../../common_components/update_work_day_button.dart';
import '../../common_pages/view_student_profile_page.dart';
import '../../common_pages/preview_to_upload_photo_page.dart';
import '../../organization/tasks/org_view_task_details_page.dart';
import '../../organization/work_days/org_view_work_day_details_page.dart';

class MngViewInternalProgramPage extends StatefulWidget {
  const MngViewInternalProgramPage({Key? key, required this.programDto})
      : super(key: key);

  final VolunteerProgramDto programDto;

  @override
  State<MngViewInternalProgramPage> createState() =>
      _MngViewInternalProgramPageState();
}

class _MngViewInternalProgramPageState
    extends State<MngViewInternalProgramPage> {
  int _tabIndex = 0;

  late VolunteerProgramDto _programDto;

  @override
  void initState() {
    super.initState();

    _programDto = widget.programDto;

    context
        .read<GetVolunteersOfProgramCubit>()
        .getVolunteersOfProgram(_programDto.id ?? 0);
  }

  @override
  void dispose() {
    context.read<GetTasksOfProgramCubit>().resetState();
    context.read<GetWorkDaysOfProgramCubit>().resetState();
    context.read<GetPhotosOfProgramCubit>().resetState();

    super.dispose();
  }

  String tabTitle() {
    switch (_tabIndex) {
      case 0:
        return 'معلومات البرنامج';
      case 1:
        return 'المتطوعون';
      case 2:
        return 'المهام';
      case 3:
        return 'أيام العمل';
      case 4:
        return 'تقييمات المتطوعين';
      case 5:
        return 'ألبوم صور البرنامج';
      default:
        return 'معلومات البرنامج';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateInternalProgramCubit, UpdateInternalProgramState>(
      listener: (context, state) {
        if (state is UpdateInternalProgramSuccess) {
          setState(() {
            _programDto = state.data;
          });

          context
              .read<GetAllInternalProgramsCubit>()
              .updateItemInternally(state.data);
        }
      },
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            title: Text(tabTitle()),
            actions: [
              if (_tabIndex == 0)
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => UpdateInternalProgramPage(
                                programDto: _programDto)));
                  },
                  icon: const Icon(Icons.edit),
                ),
              if (_tabIndex >= 1)
                IconButton(
                  onPressed: () {
                    switch (_tabIndex) {
                      case 1:
                        context
                            .read<GetVolunteersOfProgramCubit>()
                            .getVolunteersOfProgram(_programDto.id ?? 0);
                        break;
                      case 2:
                        context
                            .read<GetTasksOfProgramCubit>()
                            .getTasksOfProgram(programId: _programDto.id ?? 0);
                        break;
                      case 3:
                        context
                            .read<GetWorkDaysOfProgramCubit>()
                            .getWorkDaysOfProgram(_programDto.id ?? 0);
                        break;
                      case 4:
                        context
                            .read<GetVolunteersOfProgramCubit>()
                            .getVolunteersOfProgram(_programDto.id ?? 0);
                        break;
                      case 5:
                        context
                            .read<GetPhotosOfProgramCubit>()
                            .getPhotosOfProgram(programId: _programDto.id ?? 0);
                        break;
                    }
                  },
                  icon: const Icon(Icons.refresh),
                ),
            ],
            bottom: TabBar(
              onTap: (index) {
                if (index == 2) {
                  if (context.read<GetTasksOfProgramCubit>().state
                          is! GetTasksOfProgramSuccess &&
                      context.read<GetTasksOfProgramCubit>().state
                          is! GetTasksOfProgramLoading) {
                    context
                        .read<GetTasksOfProgramCubit>()
                        .getTasksOfProgram(programId: _programDto.id ?? 0);
                  }
                }

                if (index == 3) {
                  if (context.read<GetWorkDaysOfProgramCubit>().state
                          is! GetWorkDaysOfProgramSuccess &&
                      context.read<GetWorkDaysOfProgramCubit>().state
                          is! GetWorkDaysOfProgramLoading) {
                    context
                        .read<GetWorkDaysOfProgramCubit>()
                        .getWorkDaysOfProgram(_programDto.id ?? 0);
                  }
                }

                if (index == 5) {
                  if (context.read<GetPhotosOfProgramCubit>().state
                          is! GetPhotosOfProgramSuccess &&
                      context.read<GetPhotosOfProgramCubit>().state
                          is! GetPhotosOfProgramLoading) {
                    context
                        .read<GetPhotosOfProgramCubit>()
                        .getPhotosOfProgram(programId: _programDto.id ?? 0);
                  }
                }

                setState(() {
                  _tabIndex = index;
                });
              },
              tabs: const [
                Tab(icon: Icon(Icons.list_alt)),
                Tab(icon: Icon(Icons.people)),
                Tab(icon: Icon(Icons.task)),
                Tab(icon: Icon(Icons.calendar_month)),
                Tab(icon: Icon(Icons.stars)),
                Tab(icon: Icon(Icons.photo_album_outlined)),
              ],
            ),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              detailsTab(),
              volunteersTab(),
              tasksTab(),
              workDaysTab(),
              assessmentsTab(),
              photosTab(),
            ],
          ),
          floatingActionButton: _tabFloatingButton(),
        ),
      ),
    );
  }

  Widget? _tabFloatingButton(){
    switch(_tabIndex){
      case 1:
        return AddNewVolunteerFloatingButton(programDto: widget.programDto,);
      case 2:
        return AddNewTaskFloatingButton(
          programDto: _programDto,
        );
      case 3:
        return AddNewWorkDayFloatingButton(
          programDto: _programDto,
        );
      case 5:
        return FloatingActionButton(
          onPressed: () async {
            final image = await pickImage();
            if (image != null) {
              if (mounted) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PreviewToUploadPhoto(
                          image: image,
                          programId: _programDto.id!),
                    ));
              }
            }
          },
          child: const Icon(Icons.add),
        );
      default:
        return null;
    }
  }

  Widget detailsTab() {
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
                  child: _programDto.logo == null
                      ? const Icon(
                          Icons.workspace_premium,
                          size: 40,
                          color: Colors.indigoAccent,
                        )
                      : CachedNetworkImage(
                          imageUrl:
                              '$kDownloadFilesURL/${_programDto.logo?.fileKey ?? ''}',
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
                    _programDto.title ?? '-',
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
              details: _programDto.category?.name ?? '-',
            ),
            DetailsItem(
              title: 'الوصف:',
              details: _programDto.description ?? '-',
            ),
            DetailsItem(
              title: 'تاريخ بدء البرنامج:',
              details: _programDto.startDate?.getDateString() ?? '-',
            ),
            DetailsItem(
              title: 'تاريخ انتهاء البرنامج:',
              details: _programDto.endDate?.getDateString() ?? '-',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Divider(
                indent: 5,
                endIndent: 5,
              ),
            ),
            const SectionTitle(title: 'المتطوعون'),
            BlocConsumer<GetVolunteersOfProgramCubit,
                GetVolunteersOfProgramState>(
              listener: (context, state) {
                if (state is GetVolunteersOfProgramError) {
                  showNetworkException(context: context, error: state.error);
                }
              },
              builder: (context, state) {
                if (state is GetVolunteersOfProgramLoading) {
                  return const CenteredProgressIndicator(
                    verticalPadding: 50,
                  );
                }
                if (state is GetVolunteersOfProgramError) {
                  return const CenteredErrorMessage(
                    verticalPadding: 50,
                  );
                }

                if (state is GetVolunteersOfProgramEmpty) {
                  return const CenteredEmptyData();
                }
                if (state is GetVolunteersOfProgramSuccess) {
                  return Column(
                    children: [
                      for (final item in state.data)
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Card(
                            child: ListTile(
                              leading: Container(
                                child: item.student?.profilePicture == null
                                    ? const Icon(
                                        Icons.person,
                                        size: 35,
                                        color: Colors.indigoAccent,
                                      )
                                    : CachedNetworkImage(
                                        imageUrl:
                                            '$kDownloadFilesURL/${item.student?.profilePicture?.fileKey ?? ''}',
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
                              title: Text(item.student?.fullName ?? '-'),
                              isThreeLine: true,
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.student?.universityIdNumber
                                          .toString() ??
                                      '-'),
                                  Text(item.student?.userName ?? '-'),
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) =>
                                            ViewStudentProfilePage(
                                                studentDto: item.student!),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.arrow_forward)),
                            ),
                          ),
                        )
                    ],
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            addVerticalSize(30),
          ],
        ),
      ),
    );
  }

  Widget volunteersTab() {
    return BlocConsumer<GetVolunteersOfProgramCubit,
        GetVolunteersOfProgramState>(
      listener: (context, state) {
        if (state is GetVolunteersOfProgramError) {
          showNetworkException(context: context, error: state.error);
        }
      },
      builder: (context, state) {
        if (state is GetVolunteersOfProgramLoading) {
          return const CenteredProgressIndicator(
            verticalPadding: 0,
          );
        }
        if (state is GetVolunteersOfProgramError) {
          return const CenteredErrorMessage(
            verticalPadding: 0,
          );
        }

        if (state is GetVolunteersOfProgramEmpty) {
          return const CenteredEmptyData();
        }
        if (state is GetVolunteersOfProgramSuccess) {
          return
            ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (ctx, index) {
              final item = state.data[index];
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  child: ListTile(
                    leading: Container(
                      child: item.student?.profilePicture == null
                          ? const Icon(
                        Icons.person,
                        size: 35,
                        color: Colors.indigoAccent,
                      )
                          : CachedNetworkImage(
                        imageUrl:
                        '$kDownloadFilesURL/${item.student?.profilePicture?.fileKey ?? ''}',
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
                    title: Text(item.student?.fullName ?? '-'),
                    isThreeLine: true,
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.student?.universityIdNumber.toString() ??
                            '-'),
                        Text(item.student?.userName ?? '-'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDeleteDialog(
                                  context: context,
                                  title: 'إزالة انضمام متطوع',
                                  itemName: item.student?.fullName ?? '-',
                                  altMessage: 'إزالة انضمام المتطوع',
                                  loadingOrDeleteButton: BlocConsumer<
                                      DeleteVolunteerCubit,
                                      DeleteVolunteerState>(
                                      listener: (context, state) {
                                        if(state is DeleteVolunteerError){
                                          showNetworkException(context: context, error: state.error);
                                        }

                                        if(state is DeleteVolunteerSuccess){
                                          context
                                              .read<GetVolunteersOfProgramCubit>()
                                              .deleteItemInternally(item.id!);

                                          context
                                              .read<DeleteVolunteerCubit>()
                                              .resetState();

                                          Navigator.pop(context);

                                          showSuccessSnackBar(
                                            context: context,
                                            message: 'تم إزالة انضمام المتطوع من البرنامج بنجاح',
                                          );
                                        }
                                      },
                                      builder: (context, state) {
                                        if (state is DeleteVolunteerLoading) {
                                          return Transform.scale(
                                              scale: 0.7,
                                              child:
                                              const CircularProgressIndicator());
                                        }

                                        return deleteButton(() {
                                          context
                                              .read<DeleteVolunteerCubit>()
                                              .deleteVolunteer(item.id ?? 0);
                                        });
                                      }));
                            },
                            icon: const Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => ViewStudentProfilePage(
                                      studentDto: item.student!),
                                ),
                              );
                            },
                            icon: const Icon(Icons.arrow_forward)),
                      ],
                    ),
                  ),
                ),
              );
            });
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
      builder: (context, state) {
        if (state is GetTasksOfProgramLoading) {
          return const CenteredProgressIndicator(
            verticalPadding: 50,
          );
        }
        if (state is GetTasksOfProgramError) {
          return const CenteredErrorMessage(
            verticalPadding: 50,
          );
        }

        if (state is GetTasksOfProgramEmpty) {
          return const CenteredEmptyData();
        }
        if (state is GetTasksOfProgramSuccess) {
          return Column(
            children: [
              addVerticalSize(5),
              for (final item in state.data)
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.task,
                        color: Colors.amber,
                        size: 27,
                      ),
                      title: Text(item.title ?? '-'),
                      subtitle: Row(
                        children: [
                          Text('تبدأ: ${item.startDate?.getDateString()}'),
                          addHorizontalSize(5),
                          const Text('|'),
                          addHorizontalSize(5),
                          Text('تنتهي: ${item.endDate?.getDateString()}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          UpdateTaskButton(
                            taskDto: item,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => OrgViewTaskDetailsPage(
                                      taskDto: item,
                                      programId: _programDto.id ?? 0,
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.arrow_forward,
                              )),
                        ],
                      ),
                    ),
                  ),
                )
            ],
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
      builder: (context, state) {
        if (state is GetWorkDaysOfProgramLoading) {
          return const CenteredProgressIndicator(
            verticalPadding: 50,
          );
        }
        if (state is GetWorkDaysOfProgramError) {
          return const CenteredErrorMessage(
            verticalPadding: 50,
          );
        }

        if (state is GetWorkDaysOfProgramEmpty) {
          return const CenteredEmptyData();
        }
        if (state is GetWorkDaysOfProgramSuccess) {
          return Column(
            children: [
              addVerticalSize(5),
              for (final item in state.data)
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.deepOrangeAccent,
                        size: 27,
                      ),
                      title: Text(item.name ?? '-'),
                      subtitle: Text('التاريخ: ${item.date?.getDateString()}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          UpdateWorkDayButton(
                            workDayDto: item,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => OrgViewWorkDayDetailsPage(
                                      workDayDto: item,
                                      programId: _programDto.id ?? 0,
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.arrow_forward,
                              )),
                        ],
                      ),
                    ),
                  ),
                )
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget assessmentsTab() {
    return BlocConsumer<GetVolunteersOfProgramCubit,
        GetVolunteersOfProgramState>(
      listener: (context, state) {
        if (state is GetVolunteersOfProgramError) {
          showNetworkException(context: context, error: state.error);
        }
      },
      builder: (context, state) {
        if (state is GetVolunteersOfProgramLoading) {
          return const CenteredProgressIndicator(
            verticalPadding: 50,
          );
        }
        if (state is GetVolunteersOfProgramError) {
          return const CenteredErrorMessage(
            verticalPadding: 50,
          );
        }

        if (state is GetVolunteersOfProgramEmpty) {
          return const CenteredEmptyData();
        }
        if (state is GetVolunteersOfProgramSuccess) {
          return Column(
            children: [
              for (final item in state.data)
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    child: ListTile(
                      leading: Container(
                        child: item.student?.profilePicture == null
                            ? const Icon(
                                Icons.person,
                                size: 35,
                                color: Colors.indigoAccent,
                              )
                            : CachedNetworkImage(
                                imageUrl:
                                    '$kDownloadFilesURL/${item.student?.profilePicture?.fileKey ?? ''}',
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
                      title: Text(item.student?.fullName ?? '-'),
                      isThreeLine: true,
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.student?.universityIdNumber.toString() ??
                              '-'),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    changeVolunteerMngFinalGrade(context, item);
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  )),
                              if (item.finalGrade != null) ...[
                                Flexible(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: 'تقييم الإدارة: ',
                                              style: const TextStyle(
                                                  color: Colors.black),
                                              children: [
                                                TextSpan(
                                                    text: item.finalGrade
                                                            ?.toString() ??
                                                        '-',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black))
                                              ],
                                            ),
                                          ),
                                          addHorizontalSize(10),
                                          RatingBarIndicator(
                                            rating: (item.finalGrade ?? 0) / 20,
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
                                      RichText(
                                        text: TextSpan(
                                          text: 'ملاحظات التقييم: ',
                                          style: const TextStyle(
                                              color: Colors.black),
                                          children: [
                                            TextSpan(
                                                text:
                                                    item.finalGradeNotes ?? '-',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ] else
                                const Text('لم يتم التقييم من قبل المؤسسة')
                            ],
                          )
                        ],
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => ViewStudentProfilePage(
                                    studentDto: item.student!),
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward)),
                    ),
                  ),
                )
            ],
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
                child: Align(
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
                              DeleteProgramPhotoCubit, DeleteProgramPhotoState>(
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
                                  message: 'تم حذف الصورة من الألبوم بنجاح',
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
                              actionsAlignment: MainAxisAlignment.spaceEvenly,
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
                                    if (state is DeleteProgramPhotoLoading) {
                                      return Transform.scale(
                                          scale: 0.7,
                                          child:
                                              const CircularProgressIndicator());
                                    }

                                    return TextButton(
                                      onPressed: () {
                                        context
                                            .read<DeleteProgramPhotoCubit>()
                                            .deleteProgramPhoto(
                                              item.id!,
                                            );
                                      },
                                      child: const Text(
                                        'تأكيد',
                                        style: TextStyle(color: Colors.red),
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
                ),
              ),
            ),
          ),
        ),
      );
}
