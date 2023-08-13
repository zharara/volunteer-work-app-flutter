import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/volunteer_students/change_volunteer_grade/change_volunteer_grade_cubit.dart';
import 'package:volunteer_work_app/blocs/volunteer_students/get_volunteers_of_program/get_volunteers_of_program_cubit.dart';

import '../../domain/api_generated_code/api.models.swagger.dart';
import '../../utils/exception_handlers.dart';
import 'add_size.dart';
import 'bottom_sheet_app_bar.dart';
import 'centered_progress_indicator.dart';
import 'snack_bars.dart';

void changeVolunteerOrgAssessment(
  BuildContext context,
  VolunteerStudentDto volunteerStudentDto,
) {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController gradeTEC = TextEditingController();
  final TextEditingController notesTEC = TextEditingController();

  gradeTEC.text = volunteerStudentDto.orgAssessmentGrade?.toString() ?? '';
  notesTEC.text = volunteerStudentDto.orgAssessmentGradeNotes ?? '';

  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      builder: (ctx) {
        return BlocListener<ChangeVolunteerGradeCubit,
            ChangeVolunteerGradeState>(
          listener: (context, state) {
            if (state is ChangeVolunteerGradeSuccess) {
              formKey.currentState?.reset();
              gradeTEC.clear();

              context
                  .read<GetVolunteersOfProgramCubit>()
                  .updateItemInternally(volunteerStudentDto.copyWith(
                    orgAssessmentGrade: state.data.orgAssessmentGrade,
                    orgAssessmentGradeNotes: state.data.orgAssessmentGradeNotes,
                  ));

              Navigator.pop(context);

              showSuccessSnackBar(
                context: context,
                message: 'تم حفظ التقييم النهائي للمتطوع بنجاح',
              );
            }
            if (state is ChangeVolunteerGradeError) {
              showNetworkException(context: context, error: state.error);
            }
          },
          child: Scaffold(
            appBar: const BottomSheetAppBar(
              title: 'تقييم المؤسسة النهائي للمتطوع',
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
                          controller: gradeTEC,
                          validator: (text) {
                            if (text?.isEmpty ?? true) {
                              return 'هذا الحقل مطلوب';
                            }
                            if (double.parse(text!) > 100 ||
                                double.parse(text) < 0) {
                              return 'يجب أن يكون التقييم من 0 إلى 100';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'التقييم من 100 *',
                          ),
                        ),
                        addVerticalSize(10),
                        TextFormField(
                          controller: notesTEC,
                          decoration: const InputDecoration(
                            labelText: 'ملاحظات التقييم',
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
                        BlocProvider.of<ChangeVolunteerGradeCubit>(context)
                            .changeVolunteerGrade(
                          volunteerStudentId: volunteerStudentDto.id ?? 0,
                          orgAssessmentGrade: double.parse(gradeTEC.text),
                          orgAssessmentGradeNotes: notesTEC.text,
                        );
                      }
                    },
                    child: const Text('حفظ التقييم'),
                  ),
                  BlocBuilder<ChangeVolunteerGradeCubit,
                      ChangeVolunteerGradeState>(
                    builder: (context, state) {
                      if (state is ChangeVolunteerGradeLoading) {
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
