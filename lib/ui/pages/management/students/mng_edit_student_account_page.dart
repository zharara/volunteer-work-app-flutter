import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/students/update_student_by_management/update_student_by_management_cubit.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../../utils/exception_handlers.dart';
import '../../../../utils/form_validators.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/snack_bars.dart';

class MngEditStudentAccountPage extends StatefulWidget {
  const MngEditStudentAccountPage({Key? key, required this.studentDto})
      : super(key: key);

  final StudentDto studentDto;

  @override
  State<MngEditStudentAccountPage> createState() => _MngEditStudentAccountPageState();
}

class _MngEditStudentAccountPageState extends State<MngEditStudentAccountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _universityIdNumberTEC = TextEditingController();
  final TextEditingController _firstNameTEC = TextEditingController();
  final TextEditingController _middleNameTEC = TextEditingController();
  final TextEditingController _lastNameTEC = TextEditingController();
  final TextEditingController _addressTEC = TextEditingController();
  final TextEditingController _specializationTEC = TextEditingController();
  final TextEditingController _dateOfBirthTEC = TextEditingController();

  DateTime? _selectedDateOfBirth;

  @override
  void initState() {
    super.initState();

    _universityIdNumberTEC.text =
        widget.studentDto.universityIdNumber?.toString() ?? '';
    _firstNameTEC.text = widget.studentDto.firstName ?? '';
    _middleNameTEC.text = widget.studentDto.middleName ?? '';
    _lastNameTEC.text = widget.studentDto.lastName ?? '';

    _specializationTEC.text = widget.studentDto.specialization ?? '';
    _addressTEC.text = widget.studentDto.specialization ?? '';
    _dateOfBirthTEC.text = widget.studentDto.dateOfBirth?.getDateString() ?? '';

    _selectedDateOfBirth = widget.studentDto.dateOfBirth;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateStudentByManagementCubit,
        UpdateStudentByManagementState>(
      listener: (context, state) {
        if (state is UpdateStudentByManagementError) {
          showNetworkException(context: context, error: state.error);
        }
        if (state is UpdateStudentByManagementSuccess) {
          showSuccessSnackBar(
            context: context,
            message: 'تم تعديل حساب الطالب بنجاح',
          );
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تعديل حساب الطالب'),
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
                      addVerticalSize(10),
                      TextFormField(
                        controller: _universityIdNumberTEC,
                        keyboardType: TextInputType.number,
                        validator: fieldRequiredValidator,
                        decoration: const InputDecoration(
                          labelText: 'الرقم الجامعي *',
                        ),
                      ),
                      addVerticalSize(10),
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
                        controller: _dateOfBirthTEC,
                        readOnly: true,
                        onTap: () async {
                          final now = DateTime.now();
                          _selectedDateOfBirth = await showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate: DateTime(now.year),
                            lastDate: now.add(const Duration(days: 500)),
                          );

                          if (_selectedDateOfBirth != null) {
                            _dateOfBirthTEC.text =
                                _selectedDateOfBirth!.getDateString();
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'تاريخ الميلاد',
                        ),
                      ),
                      addVerticalSize(10),
                    ],
                  ),
                ),
                addVerticalSize(15),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      BlocProvider.of<UpdateStudentByManagementCubit>(context)
                          .updateStudentInfo(UpdateStudentByManagementDto(
                        id: widget.studentDto.id ?? 0,
                        universityIdNumber:
                            int.parse(_universityIdNumberTEC.text),
                        firstName: _firstNameTEC.text,
                        middleName: _middleNameTEC.text,
                        lastName: _lastNameTEC.text,
                        specialization: _specializationTEC.text,
                        address: _addressTEC.text,
                        dateOfBirth: _selectedDateOfBirth,
                      ));
                    }
                  },
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: const Center(child: Text('تعديل حساب الطالب')),
                  ),
                ),
                BlocBuilder<UpdateStudentByManagementCubit,
                    UpdateStudentByManagementState>(
                  builder: (context, state) {
                    if (state is UpdateStudentByManagementLoading) {
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
