import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/students/update_student_skills/update_student_skills_cubit.dart';
import 'package:volunteer_work_app/main.dart';
import 'package:volunteer_work_app/ui/pages/student/program/student_view_enrolled_program_page.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../../blocs/students/update_student_account/update_student_account_cubit.dart';
import '../../../../blocs/volunteer_students/get_volunteer_by_student_id/get_volunteer_by_student_id_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../../utils/form_validators.dart';
import '../../../../utils/pick_images.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/details_item.dart';
import '../../../common_components/input_page_title.dart';
import '../../../common_components/profile_picture_widget.dart';
import '../../../common_components/select_skills_input.dart';
import '../../../common_components/show_upload_files.dart';
import '../../../common_components/snack_bars.dart';

class StudentPersonalProfilePage extends StatefulWidget {
  const StudentPersonalProfilePage({Key? key}) : super(key: key);

  @override
  State<StudentPersonalProfilePage> createState() =>
      _StudentPersonalProfilePageState();
}

class _StudentPersonalProfilePageState
    extends State<StudentPersonalProfilePage> {
  bool _editing = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameTEC = TextEditingController();
  final TextEditingController _lastNameTEC = TextEditingController();
  final TextEditingController _addressTEC = TextEditingController();
  final TextEditingController _birthDateTEC = TextEditingController();
  final TextEditingController _middleNameTEC = TextEditingController();
  final TextEditingController _specializationTEC = TextEditingController();
  final TextEditingController _bioTEC = TextEditingController();
  final TextEditingController _skillsListTEC = TextEditingController();

  DateTime? _selectedBirthDate;
  TempFileDto? _uploadedImageTempFile;
  File? _selectedImage;

  SavedFileDto? _currentPicture;

  List<ExistingOrCreateNewSkillDto> _skills = [];

  @override
  void initState() {
    super.initState();

    final studentDto = globalAppStorage.getStudentAccount();
    if (studentDto?.isEnrolledInProgram ?? false) {
      context
          .read<GetVolunteerByStudentIdCubit>()
          .getVolunteer(studentDto?.id ?? 0);
    }
  }

  void setForEditing() {
    final studentDto = globalAppStorage.getStudentAccount();
    _currentPicture = studentDto?.profilePicture;

    _firstNameTEC.text = studentDto?.firstName ?? '';
    _middleNameTEC.text = studentDto?.middleName ?? '';
    _lastNameTEC.text = studentDto?.lastName ?? '';
    _specializationTEC.text = studentDto?.specialization ?? '';
    _addressTEC.text = studentDto?.address ?? '';
    _bioTEC.text = studentDto?.biography ?? '';
    _birthDateTEC.text = studentDto?.dateOfBirth?.getDateString() ?? '';

    _skillsListTEC.clear();
    for (final skill in studentDto?.skills ?? []) {
      _skillsListTEC.text =
          '${_skillsListTEC.text.trim()} ${_skillsListTEC.text.trim().isEmpty ? '' : '-'} ${skill.name}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final studentDto = globalAppStorage.getStudentAccount();

    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _editing = !_editing;
                if (_editing) {
                  setForEditing();
                }
              });
            },
            icon: Icon(_editing ? Icons.edit_off : Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: !_editing
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ProfilePictureWidget(
                            imageRadius: 70,
                            iconRadius: 60,
                            iconSize: 55,
                            savedFileDto: studentDto?.profilePicture),
                        addHorizontalSize(20),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                studentDto?.fullName ?? '-',
                                style: const TextStyle(
                                  fontSize: 26,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                studentDto?.email ?? '-',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Divider(),
                    DetailsItem(
                      title: 'الرقم الجامعي:',
                      details: studentDto?.universityIdNumber.toString() ?? '-',
                    ),
                    DetailsItem(
                      title: 'التخصص:',
                      details: studentDto?.specialization ?? '-',
                    ),
                    DetailsItem(
                      title: 'تاريخ الميلاد:',
                      details: studentDto?.dateOfBirth?.getDateString() ?? '-',
                    ),
                    DetailsItem(
                      title: 'العنوان:',
                      details: studentDto?.address ?? '-',
                    ),
                    DetailsItem(
                      title: 'رقم الهاتف:',
                      details: studentDto?.phoneNumber ?? '-',
                    ),
                    DetailsItem(
                      title: 'نبذة عني:',
                      details: studentDto?.biography ?? '-',
                    ),
                    const Text('المهارات:',
                        style: TextStyle(
                          fontSize: 17,
                        )),
                    if (studentDto?.skills?.isEmpty ?? true)
                      const Text('لم يتم اختيار مهارات بعد',
                          style: const TextStyle(
                            fontSize: 16,
                          ))
                    else
                      Wrap(
                        runSpacing: 8,
                        spacing: 8,
                        children: [
                          for (final SkillDto skill in studentDto?.skills ?? [])
                            ActionChip(
                                onPressed: () {
                                  // showModalBottomSheet(context: context, builder: (ctx) => Column(
                                  //   children: [
                                  //     Text(skill.category?.name ?? '-'),
                                  //   ],
                                  // ));
                                },
                                backgroundColor: Colors.teal,
                                label: Text(
                                  skill.name ?? '-',
                                  style: const TextStyle(color: Colors.white),
                                )),
                        ],
                      ),
                    const Divider(),
                    addVerticalSize(20),
                    if (studentDto?.isEnrolledInProgram ?? false) ...[
                      const SectionTitle(title: 'البرنامج الملتحق به الطالب'),
                      addVerticalSize(10),
                      BlocConsumer<GetVolunteerByStudentIdCubit,
                          GetVolunteerByStudentIdState>(
                        listener: (context, state) {
                          if (state is GetVolunteerByStudentIdError) {
                            showNetworkException(
                                context: context, error: state.error);
                          }
                        },
                        builder: (context, state) {
                          if (state is GetVolunteerByStudentIdLoading) {
                            return const CenteredProgressIndicator(
                                verticalPadding: 0);
                          }
                          if (state is GetVolunteerByStudentIdError) {
                            return const CenteredErrorMessage(
                                verticalPadding: 0);
                          }

                          if (state is GetVolunteerByStudentIdSuccess) {
                            return Card(
                              child: ListTile(
                                leading: Container(
                                  child: state.data.volunteerProgram?.logo ==
                                          null
                                      ? const Icon(
                                          Icons.workspace_premium,
                                          size: 35,
                                          color: Colors.indigoAccent,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl:
                                              '$kDownloadFilesURL/${state.data.volunteerProgram?.logo?.fileKey ?? ''}',
                                          httpHeaders: {
                                            'Authorization':
                                                'Bearer ${globalAppStorage.getAccessToken()}'
                                          },
                                          imageBuilder: (ctx, image) {
                                            return CircleAvatar(
                                                backgroundImage: image);
                                          },
                                          progressIndicatorBuilder:
                                              (ctx, url, downloadProgress) {
                                            return CircularProgressIndicator(
                                              value: downloadProgress.progress,
                                            );
                                          },
                                          errorWidget: (ctx, url, error) {
                                            return const Icon(
                                              Icons.error_outline,
                                              size: 32,
                                            );
                                          },
                                        ),
                                ),
                                title: Text(
                                    state.data.volunteerProgram?.title ?? '-'),
                                isThreeLine: true,
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.data.volunteerProgram
                                              ?.description ??
                                          '-',
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Text(state.data.volunteerProgram?.category
                                            ?.name ??
                                        '-'),
                                  ],
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (ctx) =>
                                              const StudentViewEnrolledProgramPage(),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.arrow_forward)),
                              ),
                            );
                          }

                          return const SizedBox.shrink();
                        },
                      ),
                    ] else ...[
                      const Center(
                          child: Text('لم يتم الالتحاق ببرنامج تطوع بعد'))
                    ]
                  ],
                )
              : BlocListener<UpdateStudentAccountCubit,
                  UpdateStudentAccountState>(
                  listener: (context, state) {
                    if (state is UpdateStudentAccountError) {
                      showNetworkException(
                          context: context, error: state.error);
                    }

                    if (state is UpdateStudentAccountSuccess) {
                      globalAppStorage.setStudentAccount(state.data);
                      setState(() {
                        _editing = false;
                      });

                      showSuccessSnackBar(
                          context: context,
                          message: 'تم تعديل البيانات الشخصية بنجاح');
                    }
                  },
                  child: Column(
                    children: [
                      addVerticalSize(10),
                      InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () async {
                          final image = await pickImage();
                          if (image != null) {
                            if (mounted) {
                              final tempFile =
                                  await showUploadFile(context, image);
                              if (tempFile != null) {
                                setState(() {
                                  _uploadedImageTempFile = tempFile;
                                  _selectedImage = image;
                                });
                              }
                            }
                          }
                        },
                        child: _selectedImage != null
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Image.file(_selectedImage!,
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _selectedImage = null;
                                            _uploadedImageTempFile = null;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.clear,
                                          color: Colors.white,
                                          size: 28,
                                        )),
                                  ],
                                ),
                              )
                            : _currentPicture != null
                                ? Stack(
                                    children: [
                                      ProfilePictureWidget(
                                        savedFileDto: _currentPicture,
                                        isRectangleImage: true,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _currentPicture = null;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.clear,
                                            color: Colors.white,
                                            size: 28,
                                          )),
                                    ],
                                  )
                                : Card(
                                    color: Colors.grey.shade100,
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height:
                                          MediaQuery.of(context).size.width / 3,
                                      child: const Center(
                                          child: Icon(Icons.add, size: 40)),
                                    ),
                                  ),
                      ),
                      addVerticalSize(10),
                      if (_selectedImage == null && _currentPicture == null)
                        const Text('اختيار صورة شخصية'),
                      addVerticalSize(15),
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
                              decoration: const InputDecoration(
                                labelText: 'اسم العائلة *',
                              ),
                            ),
                            addVerticalSize(10),
                            TextFormField(
                              controller: _birthDateTEC,
                              readOnly: true,
                              onTap: () async {
                                final now = DateTime.now();
                                _selectedBirthDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime(2003),
                                  firstDate: DateTime(1900),
                                  lastDate: now,
                                );

                                if (_selectedBirthDate != null) {
                                  _birthDateTEC.text =
                                      _selectedBirthDate!.getDateString();
                                }
                              },
                              decoration: const InputDecoration(
                                labelText: 'تاريخ الميلاد',
                              ),
                            ),
                            addVerticalSize(10),
                            TextFormField(
                              controller: _specializationTEC,
                              decoration: const InputDecoration(
                                labelText: 'التخصص',
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
                              controller: _bioTEC,
                              minLines: 4,
                              maxLines: 6,
                              decoration: const InputDecoration(
                                labelText: 'نبذة عني',
                              ),
                            ),
                          ],
                        ),
                      ),
                      addVerticalSize(10),
                      BlocConsumer<UpdateStudentSkillsCubit,
                          UpdateStudentSkillsState>(
                        listener: (context, state) {
                          if (state is UpdateStudentSkillsError) {
                            showNetworkException(
                                context: context, error: state.error);
                          }

                          if (state is UpdateStudentSkillsSuccess) {
                            globalAppStorage.setStudentAccount(state.data);
                            setState(() {
                              _skills = [];
                            });

                            showSuccessSnackBar(
                                context: context,
                                message: 'تم تعديل المهارات بنجاح');
                          }
                        },
                        builder: (context, state) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: SelectSkillsInput(
                                  isRequired: false,
                                  disabled: state is UpdateStudentSkillsLoading,
                                  label: 'المهارات',
                                  textEditingController: _skillsListTEC,
                                  onSelect: (selectedSkills) {
                                    setState(() {
                                      _skills = selectedSkills;
                                    });
                                  },
                                ),
                              ),
                              if (_skills.isNotEmpty) ...[
                                addHorizontalSize(8),
                                if (state is UpdateStudentSkillsLoading)
                                  const CircularProgressIndicator()
                                else
                                  IconButton(
                                      onPressed: () {
                                        context
                                            .read<UpdateStudentSkillsCubit>()
                                            .updateSkills(UpdateStudentSkills(
                                                studentId: studentDto?.id ?? 0,
                                                skills: _skills));
                                      },
                                      icon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children:  [
                                          const Text(
                                            'حفظ',
                                            style: TextStyle(
                                              color: Colors.green,
                                            ),
                                          ),
                                          addHorizontalSize(2),
                                          const Icon(
                                            Icons.check,
                                            size: 30,
                                            color: Colors.green,
                                          ),
                                        ],
                                      ))
                              ]
                            ],
                          );
                        },
                      ),
                      addVerticalSize(15),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            BlocProvider.of<UpdateStudentAccountCubit>(context)
                                .createAccount(UpdateStudentDto(
                              id: studentDto?.id ?? 0,
                              firstName: _firstNameTEC.text,
                              middleName: _middleNameTEC.text,
                              lastName: _lastNameTEC.text,
                              specialization: _specializationTEC.text,
                              biography: _bioTEC.text,
                              address: _addressTEC.text,
                              dateOfBirth: _selectedBirthDate,
                              saveTempFile: _uploadedImageTempFile != null
                                  ? SaveTempFile(
                                      tempFileId: _uploadedImageTempFile!.id!)
                                  : null,
                            ));
                          }
                        },
                        child: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: const Center(child: Text('حفظ المعلومات')),
                        ),
                      ),
                      BlocBuilder<UpdateStudentAccountCubit,
                          UpdateStudentAccountState>(
                        builder: (context, state) {
                          if (state is UpdateStudentAccountLoading) {
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
