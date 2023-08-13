import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/students/get_not_volunteer_students/get_not_volunteer_students_cubit.dart';
import 'package:volunteer_work_app/blocs/volunteer_students/get_volunteers_of_program/get_volunteers_of_program_cubit.dart';

import '../../blocs/volunteer_students/add_volunteer_to_program/add_volunteer_to_program_cubit.dart';
import '../../domain/api_generated_code/api.models.swagger.dart';
import '../../utils/exception_handlers.dart';
import 'bottom_sheet_app_bar.dart';
import 'centered_empty_data.dart';
import 'centered_error_message.dart';
import 'centered_progress_indicator.dart';
import 'snack_bars.dart';

class AddNewVolunteerFloatingButton extends StatelessWidget {
  const AddNewVolunteerFloatingButton({Key? key, required this.programDto})
      : super(key: key);

  final VolunteerProgramDto programDto;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        BlocProvider.of<GetNotVolunteerStudentsCubit>(context)
            .getNotVolunteerStudents();

        StudentDto? selectedStudent;

        showModalBottomSheet(
            context: context,
            builder: (ctx) {
              return StatefulBuilder(
                builder: (ctx, sSetState) => Scaffold(
                  backgroundColor: Colors.white,
                  appBar: BottomSheetAppBar(
                    title: 'إضافة متطوع جديد إلى البرنامج',
                    actions: [
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<GetNotVolunteerStudentsCubit>(
                                    context)
                                .getNotVolunteerStudents();
                          },
                          icon: const Icon(Icons.refresh))
                    ],
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: BlocConsumer<GetNotVolunteerStudentsCubit,
                            GetNotVolunteerStudentsState>(
                          listener: (context, state) {
                            if (state is GetNotVolunteerStudentsError) {}
                          },
                          builder: (context, state) {
                            if (state is GetNotVolunteerStudentsLoading) {
                              return const CenteredProgressIndicator(
                                  verticalPadding: 0);
                            }
                            if (state is GetNotVolunteerStudentsError) {
                              return const CenteredErrorMessage(
                                  verticalPadding: 0);
                            }
                            if (state is GetNotVolunteerStudentsEmpty) {
                              return const CenteredEmptyData();
                            }
                            if (state is GetNotVolunteerStudentsSuccess) {
                              return ListView.builder(
                                itemCount: state.data.length,
                                itemBuilder: (ctx, index) =>
                                    RadioListTile<StudentDto>(
                                  value: state.data[index],
                                  title:
                                      Text(state.data[index].fullName ?? '-'),
                                  groupValue: selectedStudent,
                                  onChanged: (selected) {
                                    sSetState(() {
                                      selectedStudent = selected;
                                    });
                                  },
                                ),
                              );
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BlocConsumer<AddVolunteerToProgramCubit,
                              AddVolunteerToProgramState>(
                            listener: (context, state) {
                              if (state is AddVolunteerToProgramSuccess) {
                                BlocProvider.of<GetVolunteersOfProgramCubit>(
                                        context)
                                    .addItemInternally(state.data);

                                showSuccessSnackBar(
                                  context: context,
                                  message:
                                      'تم إضافة المتطوع إلى البرنامج بنجاح',
                                );

                                Navigator.pop(context);
                              }
                              if (state is AddVolunteerToProgramError) {
                                showNetworkException(
                                    context: context, error: state.error);
                              }
                            },
                            builder: (context, state) {
                              return TextButton(
                                  onPressed: selectedStudent == null
                                      ? null
                                      : state is AddVolunteerToProgramLoading
                                          ? null
                                          : () {
                                              context
                                                  .read<
                                                      AddVolunteerToProgramCubit>()
                                                  .addVolunteer(
                                                    CreateVolunteerStudentDto(
                                                      studentId:
                                                          selectedStudent!.id ??
                                                              0,
                                                      volunteerProgramId:
                                                          programDto.id ?? 0,
                                                    ),
                                                  );
                                            },
                                  child: const Text('إضافة'));
                            },
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'رجوع',
                                style: TextStyle(color: Colors.red),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      child: const Icon(Icons.add),
    );
  }
}
