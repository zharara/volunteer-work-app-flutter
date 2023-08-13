import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:volunteer_work_app/blocs/volunteer_students/get_volunteer_by_student_id/get_volunteer_by_student_id_cubit.dart';
import 'package:volunteer_work_app/blocs/work_day_attendance/get_work_attendances_of_volunteer/get_work_attendances_of_volunteer_cubit.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/ui/common_components/details_item.dart';
import 'package:volunteer_work_app/ui/pages/common_pages/view_task_details_page.dart';
import 'package:volunteer_work_app/ui/pages/management/programs/mng_view_org_program_details_page.dart';
import 'package:volunteer_work_app/ui/pages/organization/programs/org_view_program_page.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../blocs/task_accomplishes/get_task_accomplishes_of_volunteer/get_task_accomplishes_of_volunteer_cubit.dart';
import '../../../constants/api_constants.dart';
import '../../../main.dart';
import '../../../utils/exception_handlers.dart';
import '../../../utils/types.dart';
import '../../common_components/add_size.dart';
import '../../common_components/centered_empty_data.dart';
import '../../common_components/centered_error_message.dart';
import '../../common_components/centered_progress_indicator.dart';
import '../../common_components/input_page_title.dart';
import '../../common_components/profile_picture_widget.dart';
import 'conversation_messages_page.dart';

class ViewStudentProfilePage extends StatefulWidget {
  const ViewStudentProfilePage({Key? key, required this.studentDto})
      : super(key: key);

  final StudentDto studentDto;

  @override
  State<ViewStudentProfilePage> createState() => _ViewStudentProfilePageState();
}

class _ViewStudentProfilePageState extends State<ViewStudentProfilePage> {
  @override
  void initState() {
    super.initState();

    if (widget.studentDto.isEnrolledInProgram ?? false) {
      context
          .read<GetVolunteerByStudentIdCubit>()
          .getVolunteer(widget.studentDto.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف التعريفي للطالب'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ConversationMessagesPage(
                            peerUserId: widget.studentDto.id,
                            peerUserName: widget.studentDto.fullName,
                            peerUserImage:
                                widget.studentDto.profilePicture?.fileKey,
                          )));
            },
            icon: const Icon(Icons.chat_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ProfilePictureWidget(
                      imageRadius: 55,
                      iconRadius: 50,
                      iconSize: 50,
                      savedFileDto: widget.studentDto.profilePicture),
                  addHorizontalSize(15),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            widget.studentDto.fullName ?? '-',
                            style: const TextStyle(
                              fontSize: 21,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            widget.studentDto.email ?? '-',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Divider(),
              DetailsItem(
                title: 'الرقم الجامعي:',
                details:
                    widget.studentDto.universityIdNumber?.toString() ?? '-',
              ),
              DetailsItem(
                title: 'التخصص:',
                details: widget.studentDto.specialization ?? '-',
              ),
              DetailsItem(
                title: 'تاريخ الميلاد:',
                details: widget.studentDto.dateOfBirth?.getDateString() ?? '-',
              ),
              DetailsItem(
                title: 'العنوان:',
                details: widget.studentDto.address ?? '-',
              ),
              DetailsItem(
                title: 'رقم الهاتف:',
                details: widget.studentDto.phoneNumber ?? '-',
              ),
              DetailsItem(
                title: 'نبذة عنه:',
                details: widget.studentDto.biography ?? '-',
              ),
              const Text('المهارات:',
                  style: TextStyle(
                    fontSize: 17,
                  )),
              if (widget.studentDto.skills?.isEmpty ?? true)
                const Text('لم يتم اختيار مهارات بعد',
                    style: const TextStyle(
                      fontSize: 16,
                    ))
              else
                Wrap(
                  runSpacing: 8,
                  spacing: 8,
                  children: [
                    for (final SkillDto skill in widget.studentDto.skills ?? [])
                      ActionChip(
                          onPressed: () {},
                          backgroundColor: Colors.teal,
                          label: Text(
                            skill.name ?? '-',
                            style: const TextStyle(color: Colors.white),
                          )),
                  ],
                ),
              const Divider(),
              if (widget.studentDto.isEnrolledInProgram ?? false) ...[
                const SectionTitle(title: 'البرنامج الملتحق به الطالب'),
                addVerticalSize(10),
                BlocConsumer<GetVolunteerByStudentIdCubit,
                    GetVolunteerByStudentIdState>(
                  listener: (context, state) {
                    if (state is GetVolunteerByStudentIdError) {
                      showNetworkException(
                          context: context, error: state.error);
                    }

                    if (state is GetVolunteerByStudentIdSuccess) {
                      context
                          .read<GetTaskAccomplishesOfVolunteerCubit>()
                          .getTaskAccomplishesOfVolunteer(state.data.id!);

                      context
                          .read<GetWorkAttendancesOfVolunteerCubit>()
                          .getWorkAttendancesOfVolunteer(state.data.id!);
                    }
                  },
                  builder: (context, state) {
                    if (state is GetVolunteerByStudentIdLoading) {
                      return const CenteredProgressIndicator(
                          verticalPadding: 0);
                    }
                    if (state is GetVolunteerByStudentIdError) {
                      return const CenteredErrorMessage(verticalPadding: 0);
                    }

                    if (state is GetVolunteerByStudentIdSuccess) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Card(
                            child: ListTile(
                              leading: Container(
                                child: state.data.volunteerProgram?.logo == null
                                    ? const Icon(
                                        Icons.workspace_premium,
                                        size: 35,
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
                                  Text(state.data.volunteerProgram?.title ?? '-'),
                              isThreeLine: true,
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.data.volunteerProgram?.description ?? '-',
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  Text(
                                      state.data.volunteerProgram?.category?.name ??
                                          '-'),
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    final accountType =
                                        globalAppStorage.getAccountType();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => accountType ==
                                                AccountType.management
                                            ? MngViewOrgProgramDetailsPage(
                                                programDto:
                                                    state.data.volunteerProgram!)
                                            : OrgViewProgramPage(
                                                programDto:
                                                    state.data.volunteerProgram!),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.arrow_forward)),
                            ),
                          ),
                          const SectionTitle(title: 'التقييمات'),

                          if(!(state.data.volunteerProgram?.isInternalProgram ?? false)) ...[
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
                            ),],
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
                        ],
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
                addVerticalSize(10),  const Divider(),
                addVerticalSize(10),
                const SectionTitle(title: 'المهام المنجزة'),
                BlocConsumer<GetTaskAccomplishesOfVolunteerCubit,
                    GetTaskAccomplishesOfVolunteerState>(
                  listener: (context, state) {
                    if (state is GetTaskAccomplishesOfVolunteerError) {
                      showNetworkException(
                          context: context, error: state.error);
                    }
                  },
                  builder: (context, state) {
                    if (state is GetTaskAccomplishesOfVolunteerLoading) {
                      return const CenteredProgressIndicator(
                        verticalPadding: 50,
                      );
                    }
                    if (state is GetTaskAccomplishesOfVolunteerError) {
                      return const CenteredErrorMessage(
                        verticalPadding: 50,
                      );
                    }

                    if (state is GetTaskAccomplishesOfVolunteerEmpty) {
                      return const CenteredEmptyData();
                    }

                    if (state is GetTaskAccomplishesOfVolunteerSuccess) {
                      return Column(
                        children: [
                          for (final item in state.data)
                            Builder(builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: Card(
                                  child: ListTile(
                                    leading: Checkbox(
                                      value: item.isAccomplished ?? false,
                                      onChanged: null,
                                      fillColor:
                                          const MaterialStatePropertyAll<Color>(
                                              Colors.teal),
                                    ),
                                    title: Text(
                                        item.volunteerProgramTask?.title ??
                                            '-'),
                                    isThreeLine: item.isAccomplished ?? false,
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(item.volunteerProgramTask
                                                ?.description ??
                                            '-'),
                                        if (item.isAccomplished ?? false)
                                          Row(
                                            children: [
                                              Text(
                                                  'التقييم: ${item.rate ?? 0}'),
                                              addHorizontalSize(10),
                                              RatingBarIndicator(
                                                rating: (item.rate ?? 0) / 2,
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
                                                  ViewTaskDetailsPage(
                                                      taskDto: item
                                                          .volunteerProgramTask!),
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
                ),
                addVerticalSize(10),
                const SectionTitle(title: 'حضور الأيام'),
                BlocConsumer<GetWorkAttendancesOfVolunteerCubit,
                    GetWorkAttendancesOfVolunteerState>(
                  listener: (context, state) {
                    if (state is GetWorkAttendancesOfVolunteerError) {
                      showNetworkException(
                          context: context, error: state.error);
                    }
                  },
                  builder: (context, state) {
                    if (state is GetWorkAttendancesOfVolunteerLoading) {
                      return const CenteredProgressIndicator(
                        verticalPadding: 50,
                      );
                    }
                    if (state is GetWorkAttendancesOfVolunteerError) {
                      return const CenteredErrorMessage(
                        verticalPadding: 50,
                      );
                    }

                    if (state is GetWorkAttendancesOfVolunteerEmpty) {
                      return const CenteredEmptyData();
                    }

                    if (state is GetWorkAttendancesOfVolunteerSuccess) {
                      return Column(
                        children: [
                          for (final item in state.data)
                            Builder(builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: Card(
                                  child: ListTile(
                                    leading: Checkbox(
                                      value: item.isAttended ?? false,
                                      onChanged: null,
                                      fillColor:
                                          const MaterialStatePropertyAll<Color>(
                                              Colors.teal),
                                    ),
                                    title: Text(
                                        item.volunteerProgramWorkDay?.name ??
                                            '-'),
                                    subtitle: Text(item
                                            .volunteerProgramWorkDay?.date
                                            ?.getDateString() ??
                                        '-'),
                                  ),
                                ),
                              );
                            })
                        ],
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ] else ...[
                addVerticalSize(15),
                const Center(
                    child: Text(
                  'الطالب غير ملتحق بأي برنامج بعد',
                  style: TextStyle(fontSize: 17),
                )),
              ],
              addVerticalSize(30),
            ],
          ),
        ),
      ),
    );
  }
}
