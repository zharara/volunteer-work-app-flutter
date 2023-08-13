
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/organizations/create_organization_account/create_organization_account_cubit.dart';
import 'package:volunteer_work_app/ui/common_components/add_size.dart';

import '../../../../utils/exception_handlers.dart';
import '../../../../utils/form_validators.dart';
import '../../../common_components/snack_bars.dart';
import '../main/organization_main_page.dart';

class CreateOrganizationAccountPage extends StatefulWidget {
  const CreateOrganizationAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateOrganizationAccountPage> createState() =>
      _CreateOrganizationAccountPageState();
}

class _CreateOrganizationAccountPageState
    extends State<CreateOrganizationAccountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _localNameTEC = TextEditingController();
  final TextEditingController _foreignNameTEC = TextEditingController();
  final TextEditingController _usernameTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  final TextEditingController _rePasswordTEC = TextEditingController();
  final TextEditingController _addressTEC = TextEditingController();
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _aboutTEC = TextEditingController();
  final TextEditingController _fieldOfWorkTEC = TextEditingController();
  final TextEditingController _visionTEC = TextEditingController();
  final TextEditingController _missionTEC = TextEditingController();
  final TextEditingController _phoneTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateOrganizationAccountCubit,
        CreateOrganizationAccountState>(
      listener: (context, state) {
        if (state is CreateOrganizationAccountError) {
          showNetworkException(context: context, error: state.error);
        }
        if (state is CreateOrganizationAccountSuccess) {
          showSuccessSnackBar(
            context: context,
            message: 'تم إنشاء حساب المؤسسة بنجاح',
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => OrganizationMainPage(
                organizationDto: state.data.organizationDto!,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إنشاء حساب مؤسسة/شركة'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addVerticalSize(8),
                      const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'معلومات المؤسسة/الشركة',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      TextFormField(
                        controller: _localNameTEC,
                        validator: fieldRequiredValidator,
                        decoration: const InputDecoration(
                          labelText: 'اسم المؤسسة/الشركة باللغة العربية *',
                        ),
                      ),
                      addVerticalSize(10),
                      TextFormField(
                        controller: _foreignNameTEC,
                        decoration: const InputDecoration(
                          labelText: 'اسم المؤسسة/الشركة باللغة الإنجليزية',
                        ),
                      ),
                      addVerticalSize(10),
                      TextFormField(
                        controller: _fieldOfWorkTEC,
                        validator: fieldRequiredValidator,
                        decoration: const InputDecoration(
                          labelText: 'مجال العمل *',
                        ),
                      ),
                      addVerticalSize(10),
                      TextFormField(
                        controller: _aboutTEC,
                        validator: fieldRequiredValidator,
                        maxLines: 5,
                        minLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'نبذة عن الشركة/المؤسسة *',
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
                      addVerticalSize(10),
                      TextFormField(
                        controller: _visionTEC,
                        decoration: const InputDecoration(
                          labelText: 'الرؤية',
                        ),
                      ),
                      addVerticalSize(10),
                      TextFormField(
                        controller: _missionTEC,
                        decoration: const InputDecoration(
                          labelText: 'الرسالة',
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
              ),
              addVerticalSize(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      BlocProvider.of<CreateOrganizationAccountCubit>(context)
                          .createAccount(
                        username: _usernameTEC.text,
                        password: _passwordTEC.text,
                        orgNameLocal: _localNameTEC.text,
                        fieldOfWork: _fieldOfWorkTEC.text,
                        about: _aboutTEC.text,
                        email: _emailTEC.text,
                        phoneNumber: _phoneTEC.text,
                        orgNameForeign: _foreignNameTEC.text,
                        vision: _visionTEC.text,
                        mission: _missionTEC.text,
                        address: _addressTEC.text,
                      );
                    }
                  },
                  child:
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: const Center(child: Text('إنشاء حساب مؤسسة')),
                  ),

                ),
              ),
              BlocBuilder<CreateOrganizationAccountCubit,
                  CreateOrganizationAccountState>(
                builder: (context, state) {
                  if (state is CreateOrganizationAccountLoading) {
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
    );
  }
}
