import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/ui/common_components/add_size.dart';
import 'package:volunteer_work_app/ui/pages/common_pages/reset_password_page.dart';
import 'package:volunteer_work_app/ui/pages/organization/account/create_organization_account_page.dart';
import 'package:volunteer_work_app/utils/exception_handlers.dart';

import '../../../blocs/auth/login/login_bloc.dart';
import '../../../utils/types.dart';
import '../management/main/management_main_page.dart';
import '../organization/main/organization_main_page.dart';
import '../student/main/student_main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameOrEmailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();

  AccountType accountType = AccountType.management;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          showNetworkException(context: context, error: state.error);
        }
        if (state is LoggedInManagement) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => ManagementMainPage(
                managementEmployeeDto: state.data.managementEmployeeDto!,
              ),
            ),
          );
        }

        if (state is LoggedInOrganization) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => OrganizationMainPage(
                organizationDto: state.data.organizationDto!,
              ),
            ),
          );
        }
        if (state is LoggedInStudent) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => StudentMainPage(
                studentDto: state.data.studentDto!,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تسجيل الدخول'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
                    child: Image.asset(
                      'assets/img/iug_logo.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  SegmentedButton<AccountType>(
                    segments: const [
                      ButtonSegment(
                        value: AccountType.management,
                        label: Text('حساب إدارة'),
                      ),
                      ButtonSegment(
                        value: AccountType.organization,
                        label: Text('حساب مؤسسة'),
                      ),
                      ButtonSegment(
                        value: AccountType.student,
                        label: Text('حساب طالب'),
                      ),
                    ],
                    selected: {accountType},
                    onSelectionChanged: (accounts) {
                      setState(() {
                        accountType = accounts.first;
                      });
                    },
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: TextFormField(
                            controller: _usernameOrEmailTEC,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                              labelText: 'اسم المستخدم',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextFormField(
                      controller: _passwordTEC,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                          labelText: 'كلمة المرور',
                          suffixIcon: IconButton(
                            splashRadius: 1,
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ))),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                  //   child: TextButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (ctx) => const ResetPasswordPage(),));
                  //     },
                  //     child: Text(
                  //       'نسيت كلمة المرور؟',
                  //       style: TextStyle(color: Colors.grey[600]),
                  //     ),
                  //   ),
                  // ),
                  addVerticalSize(30),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                     child: ElevatedButton(

                          child:  Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: const Center(child: Text('تسجيل الدخول')),
                          ),
                          onPressed: () {
                            if (accountType == AccountType.management) {
                              BlocProvider.of<LoginBloc>(context)
                                  .add(ManagementLoginRequested(
                                _usernameOrEmailTEC.text,
                                _passwordTEC.text,
                              ));
                            } else if (accountType == AccountType.organization) {
                              BlocProvider.of<LoginBloc>(context)
                                  .add(OrganizationLoginRequested(
                                _usernameOrEmailTEC.text,
                                _passwordTEC.text,
                              ));
                            } else if (accountType == AccountType.student) {
                              BlocProvider.of<LoginBloc>(context)
                                  .add(StudentLoginRequested(
                                _usernameOrEmailTEC.text,
                                _passwordTEC.text,
                              ));
                            }
                          },
                        ),
                   ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: CircularProgressIndicator(),
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                  addVerticalSize(20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const CreateOrganizationAccountPage()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.home_work_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'إنشاء حساب مؤسسة',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
