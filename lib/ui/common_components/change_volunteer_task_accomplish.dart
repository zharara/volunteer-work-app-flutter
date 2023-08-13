import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/task_accomplishes/change_task_accomplish/change_task_accomplish_cubit.dart';

import '../../blocs/program_tasks/get_tasks_of_program/get_tasks_of_program_cubit.dart';
import '../../blocs/task_accomplishes/get_accomplishes_of_task/get_accomplishes_of_task_cubit.dart';
import '../../domain/api_generated_code/api.models.swagger.dart';
import '../../utils/exception_handlers.dart';
import '../../utils/form_validators.dart';
import 'add_size.dart';
import 'bottom_sheet_app_bar.dart';
import 'centered_progress_indicator.dart';
import 'snack_bars.dart';

void changeVolunteerTaskAccomplish(
  BuildContext context,
  VolunteerStudentDto volunteerStudentDto,
  VolunteerProgramTaskDto taskDto,
  VolunteerStudentTaskAccomplishDto? taskAccomplishDto,
) {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController rateTEC = TextEditingController();

  if (taskAccomplishDto != null) {
    rateTEC.text = taskAccomplishDto.rate.toString();
  }

  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      builder: (ctx) {
        return BlocListener<ChangeTaskAccomplishCubit,
            ChangeTaskAccomplishState>(
          listener: (context, state) {
            if (state is ChangeTaskAccomplishSuccess) {
              formKey.currentState?.reset();
              rateTEC.clear();

              if (taskAccomplishDto == null) {
                context
                    .read<GetAccomplishesOfTaskCubit>()
                    .addItemInternally(state.data);
              } else {
                context
                    .read<GetAccomplishesOfTaskCubit>()
                    .updateItemInternally(
                  taskAccomplishDto.copyWith(
                    isAccomplished: state.data.isAccomplished,
                    rate: state.data.rate,
                  )
                );
              }

              Navigator.pop(context);

              showSuccessSnackBar(
                context: context,
                message: 'تم تعيين إنجاز المتطوع للمهمة بنجاح',
              );
            }
            if (state is ChangeTaskAccomplishError) {
              showNetworkException(context: context, error: state.error);
            }
          },
          child: Scaffold(
            appBar: const BottomSheetAppBar(
              title: 'تعيين إنجاز المتطوع للمهمة',
            ),
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: rateTEC,
                          validator: (text) {
                            if (text?.isEmpty ?? true) {
                              return 'هذا الحقل مطلوب';
                            }
                            if (double.parse(text!) > 10 ||
                                double.parse(text) < 0) {
                              return 'يجب أن يكون التقييم من 0 إلى 10';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'التقييم من 10 *',
                          ),
                        ),
                        addVerticalSize(10),
                      ],
                    ),
                  ),
                  addVerticalSize(25),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        if (taskAccomplishDto != null) {
                          BlocProvider.of<ChangeTaskAccomplishCubit>(context)
                              .changeTaskAccomplish(
                            taskAccomplishDto: taskAccomplishDto,
                            rate: double.parse(rateTEC.text),
                            isAccomplished: true,
                          );
                        } else {
                          BlocProvider.of<ChangeTaskAccomplishCubit>(context)
                              .changeTaskAccomplish(
                            volunteerStudentId: volunteerStudentDto.id,
                            taskId: taskDto.id,
                            rate: double.parse(rateTEC.text),
                            isAccomplished: true,
                          );
                        }
                      }
                    },
                    child: const Text('حفظ'),
                  ),
                  BlocBuilder<ChangeTaskAccomplishCubit,
                      ChangeTaskAccomplishState>(
                    builder: (context, state) {
                      if (state is ChangeTaskAccomplishLoading) {
                        return const CenteredProgressIndicator(
                            verticalPadding: 15);
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
