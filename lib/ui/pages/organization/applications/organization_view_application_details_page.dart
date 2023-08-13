import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.enums.swagger.dart';
import 'package:volunteer_work_app/ui/common_components/input_page_title.dart';

import '../../../../blocs/student_applications/organization_accept_application/organization_accept_application_cubit.dart';
import '../../../../blocs/student_applications/organization_reject_application/organization_reject_application_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../../utils/extensions/date_time_extensions.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/application_status_chip.dart';
import '../../../common_components/bottom_sheet_app_bar.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/details_item.dart';
import '../../../common_components/download_and_open_file_dialog.dart';
import '../../../common_components/snack_bars.dart';
import '../../common_pages/view_student_profile_page.dart';
import '../opportunities/opportunity_edit_page.dart';

class OrganizationViewApplicationDetailsPage extends StatefulWidget {
  const OrganizationViewApplicationDetailsPage(
      {Key? key, required this.applicationDto})
      : super(key: key);

  final StudentApplicationDto applicationDto;

  @override
  State<OrganizationViewApplicationDetailsPage> createState() =>
      _OrganizationViewApplicationDetailsPageState();
}

class _OrganizationViewApplicationDetailsPageState
    extends State<OrganizationViewApplicationDetailsPage> {

  late StudentApplicationDto _applicationDto;

  @override
  void initState() {
    super.initState();

    _applicationDto = _applicationDto;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل طلب التطوع'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_applicationDto.statusForManagement ==
                  ApplicationStatus.pending)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (_applicationDto.statusForOrganization !=
                        ApplicationStatus.approved)
                      MaterialButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(10),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Row(
                                    children: [
                                      const Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.green,
                                      ),
                                      addHorizontalSize(10),
                                      const Text('تأكيد قبول الطلب')
                                    ],
                                  ),
                                  content: Text(
                                      'هل أنت متأكد من قبول طلب الطالب (${_applicationDto.student?.fullName}) في فرصة التطوع (${_applicationDto.volunteerOpportunity?.title}) ؟'),
                                  actionsAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  actions: [
                                    BlocConsumer<
                                        OrganizationAcceptApplicationCubit,
                                        OrganizationAcceptApplicationState>(
                                      listener: (context, state) {
                                        if (state
                                        is OrganizationAcceptApplicationSuccess) {
                                          setState(() {
                                            _applicationDto = state.data;
                                          });

                                          showSuccessSnackBar(
                                            context: context,
                                            message:
                                            'تم قبول الطلب بنجاح',
                                          );

                                          Navigator.pop(context);
                                        }
                                        if (state
                                        is OrganizationAcceptApplicationError) {
                                          showNetworkException(
                                              context: context,
                                              error: state.error);
                                        }
                                      },
                                      builder: (context, state) {
                                        if (state
                                        is OrganizationAcceptApplicationLoading) {
                                          return const CircularProgressIndicator();
                                        }
                                        if (state
                                        is OrganizationAcceptApplicationSuccess) {
                                          return const Icon(
                                            Icons.task_alt,
                                            color: Colors.green,
                                          );
                                        }
                                        return TextButton(
                                            onPressed: () {
                                              context
                                                  .read<
                                                  OrganizationAcceptApplicationCubit>()
                                                  .acceptApplication(
                                                  id: _applicationDto.id!);
                                            },
                                            child: const Text(
                                              'تأكيد',
                                              style: TextStyle(
                                                  color: Colors.blue),
                                            ));
                                      },
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('رجوع')),
                                  ],
                                ));
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('قبول الطلب'),
                              addHorizontalSize(10),
                              const Icon(Icons.check)
                            ],
                          )),
                    if (_applicationDto.statusForOrganization !=
                        ApplicationStatus.rejected)
                      MaterialButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(10),
                          onPressed: () {
                            final GlobalKey<FormState> formKey =
                            GlobalKey<FormState>();
                            final TextEditingController reasonTEC =
                            TextEditingController();
                            showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(12))),
                                builder: (ctx) {
                                  return BlocListener<
                                      OrganizationRejectApplicationCubit,
                                      OrganizationRejectApplicationState>(
                                    listener: (context, state) {
                                      if (state
                                      is OrganizationRejectApplicationSuccess) {
                                        formKey.currentState?.reset();
                                        reasonTEC.clear();

                                        setState(() {
                                          _applicationDto = state.data;
                                        });

                                        showSuccessSnackBar(
                                          context: context,
                                          message: 'تم رفض الطلب بنجاح',
                                        );

                                        Navigator.pop(context);
                                      }
                                      if (state
                                      is OrganizationRejectApplicationError) {
                                        showNetworkException(
                                            context: context,
                                            error: state.error);
                                      }
                                    },
                                    child: Scaffold(
                                      appBar: const BottomSheetAppBar(
                                        title: 'رفض طلب التطوع',
                                      ),
                                      backgroundColor: Colors.white,
                                      body: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            DetailsItem(
                                              title: 'اسم الطالب:',
                                              details:
                                              _applicationDto.student?.fullName ??
                                                  '-',
                                            ),
                                            DetailsItem(
                                              title: 'عنوان فرصة التطوع:',
                                              details: _applicationDto
                                                  .volunteerOpportunity
                                                  ?.title ??
                                                  '-',
                                            ),
                                            const Divider(),
                                            addVerticalSize(25),
                                            Form(
                                              key: formKey,
                                              child: TextFormField(
                                                controller: reasonTEC,
                                                decoration:
                                                const InputDecoration(
                                                    labelText:
                                                    'سبب رفض الطلب',
                                                    hintText:
                                                    'مثال: عدم استيفاء المؤهلات...'),
                                              ),
                                            ),
                                            addVerticalSize(30),
                                            ElevatedButton(
                                              onPressed: () {
                                                if (formKey.currentState
                                                    ?.validate() ??
                                                    false) {
                                                  context
                                                      .read<
                                                      OrganizationRejectApplicationCubit>()
                                                      .rejectApplication(
                                                      body:
                                                      RejectStudentApplication(
                                                        studentApplicationId:
                                                        _applicationDto.id!,
                                                        rejectionReason:
                                                        reasonTEC.text,
                                                      ));
                                                }
                                              },
                                              child: Container(
                                                  padding:
                                                  const EdgeInsets.all(
                                                      8),
                                                  width: double.maxFinite,
                                                  child: const Center(
                                                      child: Text(
                                                          'رفض الطلب'))),
                                            ),
                                            BlocBuilder<
                                                OrganizationRejectApplicationCubit,
                                                OrganizationRejectApplicationState>(
                                              builder: (context, state) {
                                                if (state
                                                is OrganizationRejectApplicationLoading) {
                                                  return const CenteredProgressIndicator(
                                                      verticalPadding: 15);
                                                }
                                                return const SizedBox
                                                    .shrink();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('رفض الطلب'),
                              addHorizontalSize(10),
                              const Icon(Icons.clear)
                            ],
                          )),
                  ],
                ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(
                  indent: 5,
                  endIndent: 5,
                ),
              ),
              const SectionTitle(title: 'معلومات طلب التطوع'),
              DetailsItem(
                title: 'تاريخ الطلب:',
                details:
                    _applicationDto.createdDate?.getDateString() ?? '-',
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('حالة قبول الإدارة: ',
                      style: TextStyle(
                        fontSize: 17,
                      )),
                  ApplicationStatusChip(
                      status: _applicationDto.statusForManagement),
                ],
              ),
              if (_applicationDto.statusForManagement ==
                  ApplicationStatus.rejected)
                DetailsItem(
                  title: 'سبب الرفض:',
                  details:
                      _applicationDto.managementRejectionReason ?? '-',
                ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('حالة قبول المؤسسة: ',
                      style: TextStyle(
                        fontSize: 17,
                      )),
                  ApplicationStatusChip(
                      status: _applicationDto.statusForOrganization),
                ],
              ),
              if (_applicationDto.statusForOrganization ==
                  ApplicationStatus.rejected)
                DetailsItem(
                  title: 'سبب الرفض:',
                  details:
                      _applicationDto.organizationRejectionReason ?? '-',
                ),
              if (_applicationDto.volunteerOpportunity
                      ?.isRequirementNeededAsText ??
                  false)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: DetailsItem(
                    title: 'مؤهلات الطالب (ما قام بكتابته):',
                    details: _applicationDto.textInformation ?? '-',
                  ),
                ),
              if (_applicationDto.volunteerOpportunity
                      ?.isRequirementNeededAsFile ??
                  false)
                DetailsItem(
                  title: 'الملف المرفق:',
                  details: _applicationDto.submittedFile?.fileKey ?? '-',
                ),
              if (_applicationDto.volunteerOpportunity
                      ?.isRequirementNeededAsFile ??
                  false) ...[
                const Text('الملف المرفق: ',
                    style: TextStyle(
                      fontSize: 17,
                    )),
                if (_applicationDto.submittedFile != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          downloadAndOpenFileDialog(
                              context: context,
                              fileKey: widget
                                  .applicationDto.submittedFile!.fileKey!);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        leading: const Icon(
                          Icons.file_copy,
                          color: Colors.blue,
                        ),
                        title: Text(_applicationDto.submittedFile
                                ?.originalFileName ??
                            '-'),
                        subtitle: Text(widget
                                .applicationDto.submittedFile?.fileExtension ??
                            '-'),
                        trailing: const Icon(Icons.download),
                      ),
                    ),
                  ),
                ] else ...[
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(child: Text('لم يقم الطالب برفع ملف')),
                  )
                ],
              ],
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(
                  indent: 5,
                  endIndent: 5,
                ),
              ),
              const SectionTitle(title: 'معلومات الطالب'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        child: _applicationDto.student?.profilePicture == null
                            ? const Icon(
                                Icons.person,
                                size: 35,
                                color: Colors.indigoAccent,
                              )
                            : CachedNetworkImage(
                                imageUrl:
                                    '$kDownloadFilesURL/${_applicationDto.student?.profilePicture?.fileKey ?? ''}',
                                httpHeaders: {
                                  'Authorization':
                                      'Bearer ${globalAppStorage.getAccessToken()}'
                                },
                                imageBuilder: (ctx, image) {
                                  return CircleAvatar(backgroundImage: image);
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
                      addHorizontalSize(20),
                      Text(
                        _applicationDto.student?.fullName ?? '-',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Expanded(child: SizedBox()),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ViewStudentProfilePage(
                                        studentDto: _applicationDto.student!,
                                      )),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward))
                    ],
                  ),
                ),
              ),
              addVerticalSize(10),
              DetailsItem(
                title: 'الرقم الجامعي للطالب:',
                details: _applicationDto.student?.universityIdNumber
                        .toString() ??
                    '-',
              ),
              DetailsItem(
                title: 'التخصص:',
                details: _applicationDto.student?.specialization ?? '-',
              ),
              DetailsItem(
                title: 'تاريخ الميلاد:',
                details: _applicationDto.student?.dateOfBirth
                        ?.getDateString() ??
                    '-',
              ),
              DetailsItem(
                title: 'العنوان:',
                details: _applicationDto.student?.address ?? '-',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(
                  indent: 5,
                  endIndent: 5,
                ),
              ),
              const SectionTitle(title: 'فرصة التطوع'),
              Card(
                child: ListTile(
                  leading: Container(
                    child:
                        _applicationDto.volunteerOpportunity?.logo == null
                            ? const Icon(
                                Icons.volunteer_activism,
                                size: 35,
                                color: Colors.indigoAccent,
                              )
                            : CachedNetworkImage(
                                imageUrl:
                                    '$kDownloadFilesURL/${_applicationDto.volunteerOpportunity?.logo?.fileKey ?? ''}',
                                httpHeaders: {
                                  'Authorization':
                                      'Bearer ${globalAppStorage.getAccessToken()}'
                                },
                                imageBuilder: (ctx, image) {
                                  return CircleAvatar(backgroundImage: image);
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
                      _applicationDto.volunteerOpportunity?.title ?? '-'),
                  isThreeLine: true,
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _applicationDto.volunteerOpportunity
                                ?.description ??
                            '-',
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                      Text(_applicationDto.volunteerOpportunity?.category
                              ?.name ??
                          '-'),
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => OpportunityEditPage(
                                opportunity: widget
                                    .applicationDto.volunteerOpportunity!),
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
