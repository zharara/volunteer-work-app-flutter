import 'package:collection/collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:volunteer_work_app/blocs/task_accomplishes/change_task_accomplish/change_task_accomplish_cubit.dart';
import 'package:volunteer_work_app/blocs/volunteer_students/get_volunteers_of_program/get_volunteers_of_program_cubit.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/ui/common_components/add_size.dart';
import 'package:volunteer_work_app/ui/common_components/change_volunteer_task_accomplish.dart';
import 'package:volunteer_work_app/ui/common_components/title_with_action.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../../blocs/task_accomplishes/delete_task_accomplish/delete_task_accomplish_cubit.dart';
import '../../../../blocs/task_accomplishes/get_accomplishes_of_task/get_accomplishes_of_task_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/details_item.dart';
import '../../../common_components/snack_bars.dart';
import '../../common_pages/view_student_profile_page.dart';

class MngViewOrgProgramTaskDetailsPage extends StatefulWidget {
  const MngViewOrgProgramTaskDetailsPage(
      {Key? key, required this.taskDto, required this.programId})
      : super(key: key);

  final VolunteerProgramTaskDto taskDto;
  final int programId;

  @override
  State<MngViewOrgProgramTaskDetailsPage> createState() => _MngViewOrgProgramTaskDetailsPageState();
}

class _MngViewOrgProgramTaskDetailsPageState extends State<MngViewOrgProgramTaskDetailsPage> {
  @override
  void initState() {
    super.initState();

    context
        .read<GetAccomplishesOfTaskCubit>()
        .getAccomplishesOfTask(widget.taskDto.id ?? 0);

    if (context.read<GetVolunteersOfProgramCubit>().state
        is! GetVolunteersOfProgramSuccess) {
      context
          .read<GetVolunteersOfProgramCubit>()
          .getVolunteersOfProgram(widget.programId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل المهمة'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSize(15),
              DetailsItem(
                title: 'عنوان المهمة:',
                details: widget.taskDto.title ?? '-',
              ),
              DetailsItem(
                title: 'الوصف:',
                details: widget.taskDto.description ?? '-',
              ),
              DetailsItem(
                title: 'تاريخ بدء المهمة:',
                details: widget.taskDto.startDate?.getDateString() ?? '-',
              ),
              DetailsItem(
                title: 'تاريخ انتهاء المهمة:',
                details: widget.taskDto.endDate?.getDateString() ?? '-',
              ),
              addVerticalSize(10),
              const Divider(),
              addVerticalSize(10),
              TitleWithAction(
                  title: 'إنجاز المتطوعين',
                  action: '',
                  icon: Icons.refresh,
                  onIconPressed: () {
                    context
                        .read<GetAccomplishesOfTaskCubit>()
                        .getAccomplishesOfTask(widget.taskDto.id ?? 0);

                    if (context.read<GetVolunteersOfProgramCubit>().state
                        is! GetVolunteersOfProgramSuccess) {
                      context
                          .read<GetVolunteersOfProgramCubit>()
                          .getVolunteersOfProgram(widget.programId);
                    }
                  }),
              BlocConsumer<GetAccomplishesOfTaskCubit,
                  GetAccomplishesOfTaskState>(
                listener: (context, state) {
                  if (state is GetAccomplishesOfTaskError) {
                    showNetworkException(context: context, error: state.error);
                  }
                },
                builder: (context, state) {
                  return BlocBuilder<GetVolunteersOfProgramCubit,
                      GetVolunteersOfProgramState>(
                    builder: (context, volunteersState) {
                      if (volunteersState is GetVolunteersOfProgramLoading ||
                          state is GetAccomplishesOfTaskLoading) {
                        return const CenteredProgressIndicator(
                          verticalPadding: 50,
                        );
                      }
                      if (volunteersState is GetVolunteersOfProgramError ||
                          state is GetAccomplishesOfTaskError) {
                        return const CenteredErrorMessage(
                          verticalPadding: 50,
                        );
                      }

                      if (volunteersState is GetVolunteersOfProgramEmpty) {
                        return const CenteredEmptyData();
                      }

                      if (volunteersState is GetVolunteersOfProgramSuccess) {
                        return Column(
                          children: [
                            for (final item in volunteersState.data)
                              Builder(builder: (context) {
                                VolunteerStudentTaskAccomplishDto?
                                    taskAccomplishItem =
                                    state is GetAccomplishesOfTaskSuccess
                                        ? state.data.firstWhereOrNull(
                                            (e) =>
                                                e.volunteerStudent?.studentId ==
                                                item.studentId,
                                          )
                                        : null;

                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Card(
                                    child: ListTile(
                                      leading: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Checkbox(
                                              value: taskAccomplishItem
                                                      ?.isAccomplished ??
                                                  false,
                                              onChanged: null,),
                                          addHorizontalSize(8),
                                          Container(
                                            child: item.student
                                                        ?.profilePicture ==
                                                    null
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
                                                          backgroundImage:
                                                              image);
                                                    },
                                                    progressIndicatorBuilder:
                                                        (ctx, url,
                                                            downloadProgress) {
                                                      return CircularProgressIndicator(
                                                        value: downloadProgress
                                                            .progress,
                                                      );
                                                    },
                                                    errorWidget:
                                                        (ctx, url, error) {
                                                      return const Icon(
                                                        Icons.error_outline,
                                                        size: 32,
                                                      );
                                                    },
                                                  ),
                                          ),
                                        ],
                                      ),
                                      title:
                                          Text(item.student?.fullName ?? '-'),
                                      isThreeLine:
                                          taskAccomplishItem?.isAccomplished ??
                                              false,
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(item.student?.universityIdNumber
                                                  .toString() ??
                                              '-'),
                                          if (taskAccomplishItem
                                                  ?.isAccomplished ??
                                              false)
                                            Row(
                                              children: [
                                                Text(
                                                    'التقييم: ${taskAccomplishItem?.rate ?? 0}'),
                                                addHorizontalSize(10),
                                                RatingBarIndicator(
                                                  rating: (taskAccomplishItem?.rate ?? 0) / 2,
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
                                                    ViewStudentProfilePage(
                                                        studentDto:
                                                            item.student!),
                                              ),
                                            );
                                          },
                                          icon:
                                              const Icon(Icons.arrow_forward)),
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
