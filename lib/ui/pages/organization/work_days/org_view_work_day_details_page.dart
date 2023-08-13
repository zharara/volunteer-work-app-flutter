import 'package:collection/collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/volunteer_students/get_volunteers_of_program/get_volunteers_of_program_cubit.dart';
import 'package:volunteer_work_app/blocs/work_day_attendance/delete_work_day_attendance/delete_work_day_attendance_cubit.dart';
import 'package:volunteer_work_app/blocs/work_day_attendance/get_work_attendances_of_day/get_work_attendances_of_day_cubit.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/ui/common_components/add_size.dart';
import 'package:volunteer_work_app/ui/common_components/title_with_action.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../../blocs/work_day_attendance/change_work_day_attendance/change_work_day_attendance_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/details_item.dart';
import '../../../common_components/snack_bars.dart';
import '../../common_pages/view_student_profile_page.dart';

class OrgViewWorkDayDetailsPage extends StatefulWidget {
  const OrgViewWorkDayDetailsPage(
      {Key? key, required this.workDayDto, required this.programId})
      : super(key: key);

  final VolunteerProgramWorkDayDto workDayDto;
  final int programId;

  @override
  State<OrgViewWorkDayDetailsPage> createState() =>
      _OrgViewWorkDayDetailsPageState();
}

class _OrgViewWorkDayDetailsPageState extends State<OrgViewWorkDayDetailsPage> {
  @override
  void initState() {
    super.initState();

    context
        .read<GetWorkAttendancesOfDayCubit>()
        .getWorkAttendancesOfDay(widget.workDayDto.id ?? 0);

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
        title: const Text('تفاصيل يوم العمل'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSize(15),
              DetailsItem(
                title: 'عنوان يوم العمل:',
                details: widget.workDayDto.name ?? '-',
              ),
              DetailsItem(
                title: 'التاريخ:',
                details: widget.workDayDto.date?.getDateString() ?? '-',
              ),
              addVerticalSize(10),
              const Divider(),
              addVerticalSize(10),
              TitleWithAction(
                  title: 'حضور المتطوعين',
                  action: '',
                  icon: Icons.refresh,
                  onIconPressed: () {
                    context
                        .read<GetWorkAttendancesOfDayCubit>()
                        .getWorkAttendancesOfDay(widget.workDayDto.id ?? 0);

                    if (context.read<GetVolunteersOfProgramCubit>().state
                        is! GetVolunteersOfProgramSuccess) {
                      context
                          .read<GetVolunteersOfProgramCubit>()
                          .getVolunteersOfProgram(widget.programId);
                    }
                  }),
              BlocConsumer<GetWorkAttendancesOfDayCubit,
                  GetWorkAttendancesOfDayState>(
                listener: (context, state) {
                  if (state is GetWorkAttendancesOfDayError) {
                    showNetworkException(context: context, error: state.error);
                  }
                },
                builder: (context, state) {
                  return BlocBuilder<GetVolunteersOfProgramCubit,
                      GetVolunteersOfProgramState>(
                    builder: (context, volunteersState) {
                      if (volunteersState is GetVolunteersOfProgramLoading ||
                          state is GetWorkAttendancesOfDayLoading) {
                        return const CenteredProgressIndicator(
                          verticalPadding: 50,
                        );
                      }
                      if (volunteersState is GetVolunteersOfProgramError ||
                          state is GetWorkAttendancesOfDayError) {
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
                                VolunteerStudentWorkAttendanceDto?
                                    workAttendanceItem =
                                    state is GetWorkAttendancesOfDaySuccess
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
                                              value: workAttendanceItem
                                                      ?.isAttended ??
                                                  false,
                                              onChanged: (attended) {
                                                if (attended ?? false) {
                                                  showDialog(
                                                    context: context,
                                                    builder: (dContext) => BlocListener<
                                                        ChangeWorkDayAttendanceCubit,
                                                        ChangeWorkDayAttendanceState>(
                                                      listener:
                                                          (context, state) {
                                                        if (state
                                                            is ChangeWorkDayAttendanceError) {
                                                          showNetworkException(
                                                              context: context,
                                                              error:
                                                                  state.error);
                                                        }

                                                        if (state
                                                            is ChangeWorkDayAttendanceSuccess) {
                                                          if (workAttendanceItem !=
                                                              null) {
                                                            context
                                                                .read<
                                                                    GetWorkAttendancesOfDayCubit>()
                                                                .updateItemInternally(
                                                                workAttendanceItem.copyWith(
                                                                    isAttended: state
                                                                            .data
                                                                            .isAttended ??
                                                                        false));
                                                          } else {
                                                            context
                                                                .read<
                                                                    GetWorkAttendancesOfDayCubit>()
                                                                .addItemInternally(
                                                                    state.data);
                                                          }

                                                          Navigator.pop(
                                                              context);

                                                          showSuccessSnackBar(
                                                            context: context,
                                                            message:
                                                                'تم تعيين حضور المتطوع ليوم العمل بنجاح',
                                                          );
                                                        }
                                                      },
                                                      child: AlertDialog(
                                                        title: Row(
                                                          children: const [
                                                            Icon(
                                                              Icons.check_box,
                                                              color:
                                                                  Colors.teal,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                                'تعيين حضور المتطوع ليوم العمل',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18)),
                                                          ],
                                                        ),
                                                        content: Text(
                                                          'هل أنت متأكد من تعيين حضور المتطوع ${item.student?.fullName ?? ''} ليوم العمل؟',
                                                        ),
                                                        actionsAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  dContext);
                                                            },
                                                            child: const Text(
                                                                'إغلاق'),
                                                          ),
                                                          BlocBuilder<
                                                              ChangeWorkDayAttendanceCubit,
                                                              ChangeWorkDayAttendanceState>(
                                                            builder: (context,
                                                                state) {
                                                              if (state
                                                                  is ChangeWorkDayAttendanceLoading) {
                                                                return Transform
                                                                    .scale(
                                                                        scale:
                                                                            0.7,
                                                                        child:
                                                                            const CircularProgressIndicator());
                                                              }

                                                              return TextButton(
                                                                onPressed: () {
                                                                  context
                                                                      .read<
                                                                          ChangeWorkDayAttendanceCubit>()
                                                                      .changeWorkDayAttendance(
                                                                        volunteerStudentId:
                                                                            item.id,
                                                                        workDayId: widget
                                                                            .workDayDto
                                                                            .id,
                                                                        workAttendanceDto:
                                                                            workAttendanceItem,
                                                                      );
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'تأكيد',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .teal),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  showDialog(
                                                    context: context,
                                                    builder: (dContext) => BlocListener<
                                                        DeleteWorkDayAttendanceCubit,
                                                        DeleteWorkDayAttendanceState>(
                                                      listener:
                                                          (context, state) {
                                                        if (state
                                                            is DeleteWorkDayAttendanceError) {
                                                          showNetworkException(
                                                              context: context,
                                                              error:
                                                                  state.error);
                                                        }

                                                        if (state
                                                            is DeleteWorkDayAttendanceSuccess) {
                                                          context
                                                              .read<
                                                                  GetWorkAttendancesOfDayCubit>()
                                                              .deleteItemInternally(
                                                                  workAttendanceItem!
                                                                      .id!);

                                                          Navigator.pop(
                                                              context);

                                                          showSuccessSnackBar(
                                                            context: context,
                                                            message:
                                                                'تم إلغاء تعيين حضور المتطوع ليوم العمل بنجاح',
                                                          );
                                                        }
                                                      },
                                                      child: AlertDialog(
                                                        title: Row(
                                                          children: const [
                                                            Icon(
                                                              Icons
                                                                  .indeterminate_check_box,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                                'حذف حضور المتطوع',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18)),
                                                          ],
                                                        ),
                                                        content: Text(
                                                          'هل أنت متأكد من إلغاء تحديد حضور المتطوع ${item.student?.fullName ?? ''} ليوم العمل؟',
                                                        ),
                                                        actionsAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  dContext);
                                                            },
                                                            child: const Text(
                                                                'إغلاق'),
                                                          ),
                                                          BlocBuilder<
                                                              DeleteWorkDayAttendanceCubit,
                                                              DeleteWorkDayAttendanceState>(
                                                            builder: (context,
                                                                state) {
                                                              if (state
                                                                  is DeleteWorkDayAttendanceLoading) {
                                                                return Transform
                                                                    .scale(
                                                                        scale:
                                                                            0.7,
                                                                        child:
                                                                            const CircularProgressIndicator());
                                                              }

                                                              return TextButton(
                                                                onPressed: () {
                                                                  context
                                                                      .read<
                                                                          DeleteWorkDayAttendanceCubit>()
                                                                      .deleteWorkDayAttendance(
                                                                        workAttendanceItem!
                                                                            .id!,
                                                                      );
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'تأكيد',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }
                                              }),
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
                                      subtitle: Text(item
                                              .student?.universityIdNumber
                                              .toString() ??
                                          '-'),
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
