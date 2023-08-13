import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/program_tasks/delete_task/delete_task_cubit.dart';
import 'package:volunteer_work_app/blocs/program_tasks/update_task/update_task_cubit.dart';
import 'package:volunteer_work_app/ui/common_components/dialogs.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../blocs/program_tasks/get_tasks_of_program/get_tasks_of_program_cubit.dart';
import '../../domain/api_generated_code/api.models.swagger.dart';
import '../../utils/exception_handlers.dart';
import '../../utils/form_validators.dart';
import 'add_size.dart';
import 'bottom_sheet_app_bar.dart';
import 'centered_progress_indicator.dart';
import 'snack_bars.dart';

class UpdateTaskButton extends StatelessWidget {
  const UpdateTaskButton({
    Key? key,
    required this.taskDto,
  }) : super(key: key);

  final VolunteerProgramTaskDto taskDto;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final GlobalKey<FormState> formKey = GlobalKey<FormState>();
        final TextEditingController titleTEC = TextEditingController();
        final TextEditingController descriptionTEC = TextEditingController();
        final TextEditingController startDateTEC = TextEditingController();
        final TextEditingController endDateTEC = TextEditingController();

        titleTEC.text = taskDto.title ?? '';
        descriptionTEC.text = taskDto.description ?? '';
        startDateTEC.text = taskDto.startDate?.getDateString() ?? '';
        endDateTEC.text = taskDto.endDate?.getDateString() ?? '';

        DateTime? selectedStartDate = taskDto.startDate;
        DateTime? selectedEndDate = taskDto.endDate;

        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            builder: (ctx) {
              return BlocListener<UpdateTaskCubit, UpdateTaskState>(
                listener: (context, state) {
                  if (state is UpdateTaskSuccess) {
                    context
                        .read<GetTasksOfProgramCubit>()
                        .updateItemInternally(state.data);

                    showSuccessSnackBar(
                      context: context,
                      message: 'تم تعديل المهمة بنجاح',
                    );
                  }
                  if (state is UpdateTaskError) {
                    showNetworkException(context: context, error: state.error);
                  }
                },
                child: Scaffold(
                  appBar: BottomSheetAppBar(
                    title: 'تعديل المهمة',
                    actions: [
                      IconButton(
                          onPressed: () {
                            showDeleteDialog(
                                context: context,
                                itemName: taskDto.title ?? '-',
                                loadingOrDeleteButton: BlocConsumer<
                                    DeleteTaskCubit,
                                    DeleteTaskState>(
                                    listener: (context, state) {
                                      if(state is DeleteTaskError){
                                        showNetworkException(context: context, error: state.error);
                                      }

                                      if(state is DeleteTaskSuccess){
                                        context
                                            .read<GetTasksOfProgramCubit>()
                                            .deleteItemInternally(taskDto.id!);

                                        context
                                            .read<DeleteTaskCubit>()
                                            .resetState();

                                        Navigator.pop(context);
                                        Navigator.pop(context);

                                        showSuccessSnackBar(
                                          context: context,
                                          message: 'تم حذف المهمة بنجاح',
                                        );
                                      }
                                    },
                                    builder: (context, state) {
                                  if (state is DeleteTaskLoading) {
                                    return Transform.scale(
                                        scale: 0.7,
                                        child:
                                            const CircularProgressIndicator());
                                  }

                                  return deleteButton(() {
                                    context
                                        .read<DeleteTaskCubit>()
                                        .deleteTask(taskDto.id ?? 0);
                                  });
                                }));
                          },
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          ))
                    ],
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
                                controller: titleTEC,
                                validator: fieldRequiredValidator,
                                decoration: const InputDecoration(
                                  labelText: 'عنوان المهمة *',
                                ),
                              ),
                              addVerticalSize(10),
                              TextFormField(
                                controller: descriptionTEC,
                                validator: fieldRequiredValidator,
                                maxLines: 5,
                                minLines: 3,
                                decoration: const InputDecoration(
                                  labelText: 'الوصف *',
                                ),
                              ),
                              addVerticalSize(10),
                              TextFormField(
                                controller: startDateTEC,
                                readOnly: true,
                                onTap: () async {
                                  final now = DateTime.now();
                                  selectedStartDate = await showDatePicker(
                                    context: context,
                                    initialDate: now,
                                    firstDate: DateTime(now.year),
                                    lastDate:
                                        now.add(const Duration(days: 500)),
                                  );

                                  if (selectedStartDate != null) {
                                    startDateTEC.text =
                                        selectedStartDate!.getDateString();
                                  }
                                },
                                validator: fieldRequiredValidator,
                                decoration: const InputDecoration(
                                  labelText: 'تاريخ بدء المهمة *',
                                ),
                              ),
                              addVerticalSize(10),
                              TextFormField(
                                controller: endDateTEC,
                                readOnly: true,
                                onTap: () async {
                                  final now = DateTime.now();
                                  selectedEndDate = await showDatePicker(
                                    context: context,
                                    initialDate: now,
                                    firstDate: DateTime(now.year),
                                    lastDate:
                                        now.add(const Duration(days: 500)),
                                  );

                                  if (selectedEndDate != null) {
                                    endDateTEC.text =
                                        selectedEndDate!.getDateString();
                                  }
                                },
                                validator: fieldRequiredValidator,
                                decoration: const InputDecoration(
                                  labelText: 'تاريخ انتهاء المهمة *',
                                ),
                              ),
                            ],
                          ),
                        ),
                        addVerticalSize(25),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              BlocProvider.of<UpdateTaskCubit>(context)
                                  .updateTask(UpdateVolunteerProgramTaskDto(
                                id: taskDto.id ?? 0,
                                title: titleTEC.text,
                                description: descriptionTEC.text,
                                startDate: selectedStartDate!,
                                endDate: selectedEndDate!,
                              ));
                            }
                          },
                          child: const Text('تعديل'),
                        ),
                        BlocBuilder<UpdateTaskCubit, UpdateTaskState>(
                          builder: (context, state) {
                            if (state is UpdateTaskLoading) {
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
      },
      icon: const Icon(
        Icons.edit,
        color: Colors.blue,
      ),
    );
  }
}
