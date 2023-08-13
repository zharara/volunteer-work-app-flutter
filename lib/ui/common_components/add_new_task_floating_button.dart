import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../blocs/program_tasks/create_task/create_task_cubit.dart';
import '../../blocs/program_tasks/get_tasks_of_program/get_tasks_of_program_cubit.dart';
import '../../domain/api_generated_code/api.models.swagger.dart';
import '../../utils/exception_handlers.dart';
import '../../utils/form_validators.dart';
import 'add_size.dart';
import 'bottom_sheet_app_bar.dart';
import 'centered_progress_indicator.dart';
import 'snack_bars.dart';

class AddNewTaskFloatingButton extends StatelessWidget {
  const AddNewTaskFloatingButton({Key? key, required this.programDto})
      : super(key: key);

  final VolunteerProgramDto programDto;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final GlobalKey<FormState> formKey = GlobalKey<FormState>();
        final TextEditingController titleTEC = TextEditingController();
        final TextEditingController descriptionTEC = TextEditingController();
        final TextEditingController startDateTEC = TextEditingController();
        final TextEditingController endDateTEC = TextEditingController();

        DateTime? selectedStartDate;
        DateTime? selectedEndDate;

        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            builder: (ctx) {
              return BlocListener<CreateTaskCubit, CreateTaskState>(
                listener: (context, state) {
                  if (state is CreateTaskSuccess) {
                    formKey.currentState?.reset();
                    titleTEC.clear();
                    descriptionTEC.clear();
                    startDateTEC.clear();
                    endDateTEC.clear();

                    selectedStartDate = null;
                    selectedEndDate = null;

                    context
                        .read<GetTasksOfProgramCubit>()
                        .addItemInternally(state.data);

                    Navigator.pop(context);

                    showSuccessSnackBar(
                      context: context,
                      message: 'تم إنشاء مهمة جديدة بنجاح',
                    );
                  }
                  if (state is CreateTaskError) {
                    showNetworkException(context: context, error: state.error);
                  }
                },
                child: Scaffold(
                  appBar: const BottomSheetAppBar(
                    title: 'إنشاء مهمة تطوع جديدة',
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
                              BlocProvider.of<CreateTaskCubit>(context)
                                  .createTask(CreateVolunteerProgramTaskDto(
                                title: titleTEC.text,
                                description: descriptionTEC.text,
                                startDate: selectedStartDate!,
                                endDate: selectedEndDate!,
                                volunteerProgramId: programDto.id ?? 0,
                              ));
                            }
                          },
                          child: const Text('إنشاء'),
                        ),
                        BlocBuilder<CreateTaskCubit, CreateTaskState>(
                          builder: (context, state) {
                            if (state is CreateTaskLoading) {
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
      child: const Icon(Icons.add),
    );
  }
}
