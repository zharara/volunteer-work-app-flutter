import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/ui/common_components/snack_bars.dart';

import '../../blocs/student_applications/organization_accept_application/organization_accept_application_cubit.dart';
import '../../blocs/student_applications/organization_reject_application/organization_reject_application_cubit.dart';
import '../../constants/api_constants.dart';
import '../../domain/api_generated_code/api.enums.swagger.dart';
import '../../main.dart';
import '../../utils/exception_handlers.dart';
import '../pages/organization/applications/organization_view_application_details_page.dart';
import 'add_size.dart';
import 'application_status_chip.dart';
import 'bottom_sheet_app_bar.dart';
import 'centered_progress_indicator.dart';
import 'details_item.dart';

class OrgApplicationItemCard extends StatelessWidget {
  const OrgApplicationItemCard({Key? key, required this.item}) : super(key: key);

  final StudentApplicationDto item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: item.student?.profilePicture == null
            ? null
            : CircleAvatar(
          backgroundImage: NetworkImage(
              '$kDownloadFilesURL/${item.student?.profilePicture?.fileKey ?? ''}',
              headers: {
                'Authorization':
                globalAppStorage.getAccessToken()
              }),
        ),
        title: Text(item.student?.fullName ?? '-'),
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.volunteerOpportunity?.title ?? '-'),
            addVerticalSize(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('الإدارة: '),
                    ApplicationStatusChip(status: item.statusForManagement)
                  ],
                ),
                addHorizontalSize(4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('المؤسسة: '),
                    ApplicationStatusChip(status: item.statusForOrganization)
                  ],
                ),
              ],
            ),

          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (item.statusForManagement ==
                ApplicationStatus.pending &&
                item.statusForOrganization !=
                    ApplicationStatus.approved)
              IconButton(
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
                              'هل أنت متأكد من قبول طلب الطالب (${item.student?.fullName}) في فرصة التطوع (${item.volunteerOpportunity?.title}) ؟'),
                          actionsAlignment:
                          MainAxisAlignment.spaceEvenly,
                          actions: [
                            BlocConsumer<
                                OrganizationAcceptApplicationCubit,
                                OrganizationAcceptApplicationState>(
                              listener: (context, state) {
                                if (state
                                is OrganizationAcceptApplicationSuccess) {
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
                                          id: item.id!);
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
                  icon: const Icon(Icons.check,
                      color: Colors.green)),
            if (item.statusForManagement ==
                ApplicationStatus.pending &&
                item.statusForOrganization !=
                    ApplicationStatus.rejected)
              IconButton(
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
                                      item.student?.fullName ??
                                          '-',
                                    ),
                                    DetailsItem(
                                      title: 'عنوان فرصة التطوع:',
                                      details: item
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
                                                item.id!,
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
                  icon: const Icon(Icons.clear, color: Colors.red)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            OrganizationViewApplicationDetailsPage(
                              applicationDto: item,
                            )),
                  );
                },
                icon: const Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}
