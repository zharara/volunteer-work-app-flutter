import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/work_days/delete_work_day/delete_work_day_cubit.dart';
import 'package:volunteer_work_app/blocs/work_days/get_work_days_of_program/get_work_days_of_program_cubit.dart';
import 'package:volunteer_work_app/blocs/work_days/update_work_day/update_work_day_cubit.dart';
import 'package:volunteer_work_app/ui/common_components/dialogs.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../domain/api_generated_code/api.models.swagger.dart';
import '../../utils/exception_handlers.dart';
import '../../utils/form_validators.dart';
import 'add_size.dart';
import 'bottom_sheet_app_bar.dart';
import 'centered_progress_indicator.dart';
import 'snack_bars.dart';

class UpdateWorkDayButton extends StatelessWidget {
  const UpdateWorkDayButton({
    Key? key,
    required this.workDayDto,
  }) : super(key: key);

  final VolunteerProgramWorkDayDto workDayDto;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final GlobalKey<FormState> formKey = GlobalKey<FormState>();
        final TextEditingController dayNameTEC = TextEditingController();
        final TextEditingController dateTEC = TextEditingController();

        dayNameTEC.text = workDayDto.name ?? '';
        dateTEC.text = workDayDto.date?.getDateString() ?? '';

        DateTime? selectedDate = workDayDto.date;

        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            builder: (ctx) {
              return BlocListener<UpdateWorkDayCubit, UpdateWorkDayState>(
                listener: (context, state) {
                  if (state is UpdateWorkDaySuccess) {
                    context
                        .read<GetWorkDaysOfProgramCubit>()
                        .updateItemInternally(state.data);

                    showSuccessSnackBar(
                      context: context,
                      message: 'تم تعديل يوم العمل بنجاح',
                    );
                  }
                  if (state is UpdateWorkDayError) {
                    showNetworkException(context: context, error: state.error);
                  }
                },
                child: Scaffold(
                  appBar: BottomSheetAppBar(
                    title: 'تعديل يوم العمل',
                    actions: [
                      IconButton(
                          onPressed: () {
                            showDeleteDialog(
                                context: context,
                                itemName: workDayDto.name ?? '-',
                                loadingOrDeleteButton: BlocConsumer<
                                    DeleteWorkDayCubit,
                                    DeleteWorkDayState>(
                                    listener: (context, state) {
                                      if(state is DeleteWorkDayError){
                                        showNetworkException(context: context, error: state.error);
                                      }

                                      if(state is DeleteWorkDaySuccess){
                                        context
                                            .read<GetWorkDaysOfProgramCubit>()
                                            .deleteItemInternally(workDayDto.id!);

                                        context
                                            .read<DeleteWorkDayCubit>()
                                            .resetState();

                                        Navigator.pop(context);
                                        Navigator.pop(context);

                                        showSuccessSnackBar(
                                          context: context,
                                          message: 'تم حذف يوم العمل بنجاح',
                                        );
                                      }
                                    },
                                    builder: (context, state) {
                                  if (state is DeleteWorkDayLoading) {
                                    return Transform.scale(
                                        scale: 0.7,
                                        child:
                                            const CircularProgressIndicator());
                                  }

                                  return deleteButton(() {
                                    context
                                        .read<DeleteWorkDayCubit>()
                                        .deleteWorkDay(workDayDto.id ?? 0);
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
                                controller: dayNameTEC,
                                validator: fieldRequiredValidator,
                                decoration: const InputDecoration(
                                  labelText: 'عنوان اليوم أو اسم للمتييز *',
                                ),
                              ),
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
                              BlocProvider.of<UpdateWorkDayCubit>(context)
                                  .updateWorkDay(UpdateVolunteerProgramWorkDayDto(
                                id: workDayDto.id ?? 0,
                                name: dayNameTEC.text,
                                date: selectedDate!,
                              ));
                            }
                          },
                          child: const Text('تعديل'),
                        ),
                        BlocBuilder<UpdateWorkDayCubit, UpdateWorkDayState>(
                          builder: (context, state) {
                            if (state is UpdateWorkDayLoading) {
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
