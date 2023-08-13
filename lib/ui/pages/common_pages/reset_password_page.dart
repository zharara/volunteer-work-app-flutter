import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth/reset_password/reset_password_cubit.dart';
import '../../../utils/exception_handlers.dart';
import '../../../utils/form_validators.dart';
import '../../common_components/add_size.dart';
import '../../common_components/snack_bars.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordTEC = TextEditingController();
  final TextEditingController _newPasswordTEC = TextEditingController();
  final TextEditingController _reNewPasswordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordError) {
          showNetworkException(context: context, error: state.error);
        }
        if (state is ResetPasswordSuccess) {
          showSuccessSnackBar(
            context: context,
            message: 'تم إعادة تعيين كلمة مرور الحساب بنجاح',
          );
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إعادة تعيين كلمة مرور الحساب'),
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
                      addVerticalSize(10),
                      const Text(
                        'قم بإدخال كلمة المرور الحالية ثم الجديدة',
                        style: TextStyle(fontSize: 20),
                      ),
                      addVerticalSize(20),
                      TextFormField(
                        controller: _currentPasswordTEC,
                        validator: fieldRequiredValidator,
                        decoration: const InputDecoration(
                          labelText: 'كلمة المرور الحالية *',
                        ),
                      ),
                      addVerticalSize(10),
                      TextFormField(
                        controller: _newPasswordTEC,
                        validator: fieldRequiredValidator,
                        decoration: const InputDecoration(
                          labelText: 'كلمة المرور الجديدة *',
                        ),
                      ),
                      addVerticalSize(10),
                      TextFormField(
                        controller: _reNewPasswordTEC,
                        validator: (input) {
                          if (input != _newPasswordTEC.text) {
                            return 'كلمات المرور لا تتطابق';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'تأكيد كلمة المرور الجديدة *',
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSize(15),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      BlocProvider.of<ResetPasswordCubit>(context)
                          .resetPassword(
                        currentUserPassword: _currentPasswordTEC.text,
                        newUserPassword: _newPasswordTEC.text,
                      );
                    }
                  },
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: const Center(child: Text('تغيير كلمة المرور')),
                  ),
                ),
                BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                  builder: (context, state) {
                    if (state is ResetPasswordLoading) {
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
