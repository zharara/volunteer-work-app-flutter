import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/ui/common_components/add_size.dart';

import '../../../../blocs/students/create_student_account/create_student_account_cubit.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../../utils/form_validators.dart';
import '../../../common_components/snack_bars.dart';

class CreateStudentAccountPage extends StatefulWidget {
  const CreateStudentAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateStudentAccountPage> createState() =>
      _CreateStudentAccountPageState();
}

class _CreateStudentAccountPageState extends State<CreateStudentAccountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameTEC = TextEditingController();
  final TextEditingController _lastNameTEC = TextEditingController();
  final TextEditingController _usernameTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  final TextEditingController _rePasswordTEC = TextEditingController();
  final TextEditingController _addressTEC = TextEditingController();
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _middleNameTEC = TextEditingController();
  final TextEditingController _specializationTEC = TextEditingController();
  final TextEditingController _universityIdNumberTEC = TextEditingController();
  final TextEditingController _phoneTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateStudentAccountCubit,
        CreateStudentAccountState>(
      listener: (context, state) {
        if (state is CreateStudentAccountError) {
          showNetworkException(context: context, error: state.error);
        }
        if (state is CreateStudentAccountSuccess) {
          showSuccessSnackBar(
            context: context,
            message: 'تم إنشاء حساب الطالب بنجاح',
          );
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إنشاء حساب طالب جديد'),
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
                        addVerticalSize(8),
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'معلومات الطالب',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        TextFormField(
                          controller: _firstNameTEC,
                          validator: fieldRequiredValidator,
                          decoration: const InputDecoration(
                            labelText: 'الاسم الأول *',
                          ),
                        ),
                        addVerticalSize(10),
                        TextFormField(
                          controller: _middleNameTEC,
                          decoration: const InputDecoration(
                            labelText: 'اسم الأب',
                          ),
                        ),
                        addVerticalSize(10),
                        TextFormField(
                          controller: _lastNameTEC,
                          validator: fieldRequiredValidator,
                          decoration: const InputDecoration(
                            labelText: 'اسم العائلة *',
                          ),
                        ),
                        addVerticalSize(10),
                        TextFormField(
                          controller: _universityIdNumberTEC,
                          keyboardType: TextInputType.number,
                          validator: fieldRequiredValidator,
                          decoration: const InputDecoration(
                            labelText: 'الرقم الجامعي *',

                          ),
                        ),
                        addVerticalSize(20),
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'معلومات إضافية (اختياري)',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),

                        TextFormField(
                          controller: _specializationTEC,
                          decoration: const InputDecoration(
                            labelText: 'تخصص الطالب',
                          ),
                        ),
                        addVerticalSize(10),
                        TextFormField(
                          controller: _addressTEC,
                          decoration: const InputDecoration(
                            labelText: 'العنوان',
                          ),
                        ),
                        addVerticalSize(10),
                        TextFormField(
                          controller: _phoneTEC,
                          decoration: const InputDecoration(
                            labelText: 'رقم الهاتف',
                          ),
                        ),

                        addVerticalSize(20),
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'معلومات الحساب',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        TextFormField(
                          controller: _usernameTEC,
                          validator: fieldRequiredValidator,
                          decoration: const InputDecoration(
                            labelText: 'اسم المستخدم *',
                          ),
                        ),
                        addVerticalSize(10),
                        TextFormField(
                          controller: _emailTEC,
                          validator: fieldRequiredValidator,
                          decoration: const InputDecoration(
                            labelText: 'الإيميل *',
                          ),
                        ),
                        addVerticalSize(10),
                        TextFormField(
                          controller: _passwordTEC,
                          validator: fieldRequiredValidator,
                          decoration: const InputDecoration(
                            labelText: 'كلمة المرور *',
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
                      BlocProvider.of<CreateStudentAccountCubit>(context)
                          .createAccount(
                        CreateStudentDto(
                          universityIdNumber: int.parse(
                              _universityIdNumberTEC.text),
                          userName: _usernameTEC.text,
                          password: _passwordTEC.text,
                          firstName: _firstNameTEC.text,
                          middleName: _middleNameTEC.text,
                          lastName: _lastNameTEC.text,
                          specialization: _specializationTEC.text,
                          email: _emailTEC.text,
                          phoneNumber: _phoneTEC.text,
                          address: _addressTEC.text,
                        )
                      );
                    }
                  },
                  child:
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: const Center(child: Text('إنشاء حساب طالب')),
                  ),

                ),
                BlocBuilder<CreateStudentAccountCubit,
                    CreateStudentAccountState>(
                  builder: (context, state) {
                    if (state is CreateStudentAccountLoading) {
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
