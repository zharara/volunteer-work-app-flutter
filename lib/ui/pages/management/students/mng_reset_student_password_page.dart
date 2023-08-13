import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/auth/management_reset_student_password/management_reset_student_password_cubit.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/ui/common_components/details_item.dart';

import '../../../../utils/exception_handlers.dart';
import '../../../../utils/form_validators.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/snack_bars.dart';

class MngResetStudentPasswordPage extends StatefulWidget {
  const MngResetStudentPasswordPage({Key? key, required this.studentDto})
      : super(key: key);

  final StudentDto studentDto;

  @override
  State<MngResetStudentPasswordPage> createState() =>
      _MngResetStudentPasswordPageState();
}

class _MngResetStudentPasswordPageState
    extends State<MngResetStudentPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTEC = TextEditingController();
  final TextEditingController _rePasswordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ManagementResetStudentPasswordCubit,
        ManagementResetStudentPasswordState>(
      listener: (context, state) {
        if (state is ManagementResetStudentPasswordError) {
          showNetworkException(context: context, error: state.error);
        }
        if (state is ManagementResetStudentPasswordSuccess) {
          showSuccessSnackBar(
            context: context,
            message: 'تم إعادة تعيين كلمة مرور حساب الطالب بنجاح',
          );
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إعادة تعيين كلمة مرور حساب الطالب'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addVerticalSize(20),
                      DetailsItem(
                        title: 'اسم الطالب',
                        details: widget.studentDto.fullName ?? '-',
                      ),
                      DetailsItem(
                        title: 'الرقم الجامعي',
                        details:
                            widget.studentDto.universityIdNumber?.toString() ??
                                '-',
                      ),
                      DetailsItem(
                        title: 'الإيميل',
                        details: widget.studentDto.email ?? '-',
                      ),
                      addHorizontalSize(10),
                      const Divider(),
                      addHorizontalSize(10),
                      const Text(
                        'قم بإدخال كلمة المرور الجديدة',
                        style: TextStyle(fontSize: 20),
                      ),
                      addVerticalSize(20),
                      TextFormField(
                        controller: _passwordTEC,
                        validator: fieldRequiredValidator,
                        decoration: const InputDecoration(
                          labelText: 'كلمة المرور الجديدة*',
                        ),
                      ),
                      addVerticalSize(10),
                      TextFormField(
                        controller: _rePasswordTEC,
                        validator: (input) {
                          if (input != _passwordTEC.text) {
                            return 'كلمات المرور لا تتطابق';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'تأكيد كلمة المرور *',
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSize(15),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      BlocProvider.of<ManagementResetStudentPasswordCubit>(
                              context)
                          .resetStudentPassword(
                        studentId: widget.studentDto.id ?? 0,
                        newPassword: _passwordTEC.text,
                      );
                    }
                  },
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: const Center(child: Text('تغيير كلمة مرور الطالب')),
                  ),
                ),
                BlocBuilder<ManagementResetStudentPasswordCubit,
                    ManagementResetStudentPasswordState>(
                  builder: (context, state) {
                    if (state is ManagementResetStudentPasswordLoading) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                addVerticalSize(50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
