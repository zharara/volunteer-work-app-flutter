import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/work_days/get_work_days_of_program/get_work_days_of_program_cubit.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../blocs/work_days/create_work_day/create_work_day_cubit.dart';
import '../../domain/api_generated_code/api.models.swagger.dart';
import '../../utils/exception_handlers.dart';
import '../../utils/form_validators.dart';
import 'add_size.dart';
import 'bottom_sheet_app_bar.dart';
import 'centered_progress_indicator.dart';
import 'snack_bars.dart';

class AddNewWorkDayFloatingButton extends StatelessWidget {
  const AddNewWorkDayFloatingButton({Key? key, required this.programDto})
      : super(key: key);

  final VolunteerProgramDto programDto;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final GlobalKey<FormState> formKey = GlobalKey<FormState>();
        final TextEditingController dayNameTEC = TextEditingController();
        final TextEditingController dateTEC = TextEditingController();

        DateTime? selectedDate;

        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            builder: (ctx) {
              return BlocListener<CreateWorkDayCubit, CreateWorkDayState>(
                listener: (context, state) {
                  if (state is CreateWorkDaySuccess) {
                    formKey.currentState?.reset();
                    dayNameTEC.clear();
                    dateTEC.clear();

                    selectedDate = null;

                    context
                        .read<GetWorkDaysOfProgramCubit>()
                        .addItemInternally(state.data);

                    Navigator.pop(context);

                    showSuccessSnackBar(
                      context: context,
                      message: 'تم إنشاء يوم عمل جديد بنجاح',
                    );
                  }
                  if (state is CreateWorkDayError) {
                    showNetworkException(context: context, error: state.error);
                  }
                },
                child: Scaffold(
                  appBar: const BottomSheetAppBar(
                    title: 'إنشاء يوم عمل جديد',
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
                                controller: dayNameTEC,
                                validator: fieldRequiredValidator,
                                decoration: const InputDecoration(
                                  labelText: 'عنوان اليوم أو اسم للتمييز *',
                                ),
                              ),
                              addVerticalSize(10),

                              addVerticalSize(10),
                              TextFormField(
                                controller: dateTEC,
                                readOnly: true,
                                onTap: () async {
                                  final now = DateTime.now();
                                  selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: now,
                                    firstDate: DateTime(now.year),
                                    lastDate:
                                        now.add(const Duration(days: 500)),
                                  );

                                  if (selectedDate != null) {
                                    dateTEC.text =
                                        selectedDate!.getDateString();
                                  }
                                },
                                validator: fieldRequiredValidator,
                                decoration: const InputDecoration(
                                  labelText: 'التاريخ *',
                                ),
                              ),

                            ],
                          ),
                        ),
                        addVerticalSize(25),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              BlocProvider.of<CreateWorkDayCubit>(context)
                                  .createWorkDay(CreateVolunteerProgramWorkDayDto(
                                name: dayNameTEC.text,
                                date: selectedDate!,
                                volunteerProgramId: programDto.id ?? 0,
                              ));
                            }
                          },
                          child: const Text('إنشاء'),
                        ),
                        BlocBuilder<CreateWorkDayCubit, CreateWorkDayState>(
                          builder: (context, state) {
                            if (state is CreateWorkDayLoading) {
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
