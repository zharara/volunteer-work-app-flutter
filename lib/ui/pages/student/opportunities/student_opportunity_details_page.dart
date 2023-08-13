import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/ui/pages/student/applications/student_edit_application_page.dart';
import 'package:volunteer_work_app/utils/exception_handlers.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../../blocs/student_applications/check_student_applied_to_opportunity/check_student_applied_to_opportunity_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../../main.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/details_item.dart';
import '../../common_pages/view_organization_profile_page.dart';
import '../applications/apply_for_opportunity_page.dart';

class StudentOpportunityDetailsPage extends StatefulWidget {
  const StudentOpportunityDetailsPage({Key? key, required this.opportunity})
      : super(key: key);

  final VolunteerOpportunityDto opportunity;

  @override
  State<StudentOpportunityDetailsPage> createState() =>
      _StudentOpportunityDetailsPageState();
}

class _StudentOpportunityDetailsPageState
    extends State<StudentOpportunityDetailsPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<CheckStudentAppliedToOpportunityCubit>(context)
        .checkStudentAppliedToOpportunity(widget.opportunity.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل فرصة التطوع'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocConsumer<CheckStudentAppliedToOpportunityCubit,
                  CheckStudentAppliedToOpportunityState>(
                listener: (context, state) {
                  if (state is CheckStudentAppliedToOpportunityError) {
                    showNetworkException(context: context, error: state.error);
                  }
                },
                builder: (context, state) {
                  return MaterialButton(
                      color: (state is CheckStudentAppliedToOpportunitySuccess)
                          ? Colors.green
                          : (state is CheckStudentAppliedToOpportunityError)
                              ? Colors.blueGrey
                              : Colors.blue,
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(10),
                      onPressed: (state
                              is CheckStudentAppliedToOpportunityLoading)
                          ? null
                          : () {
                              if (state
                                  is CheckStudentAppliedToOpportunityEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => ApplyForOpportunityPage(
                                        volunteerOpportunityDto:
                                            widget.opportunity),
                                  ),
                                );
                              }

                              if (state
                                  is CheckStudentAppliedToOpportunitySuccess) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) =>
                                        StudentEditApplicationPage(
                                            applicationDto: state.data.first),
                                  ),
                                );
                              }

                              if (state
                                  is CheckStudentAppliedToOpportunityError) {
                                BlocProvider.of<
                                            CheckStudentAppliedToOpportunityCubit>(
                                        context)
                                    .checkStudentAppliedToOpportunity(
                                        widget.opportunity.id ?? 0);
                              }
                            },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (state is CheckStudentAppliedToOpportunityLoading)
                            const CircularProgressIndicator(),
                          if (state
                              is CheckStudentAppliedToOpportunityEmpty) ...[
                            const Text(
                              'تقديم طلب',
                              style: TextStyle(fontSize: 18),
                            ),
                            addHorizontalSize(10),
                            const Icon(
                              Icons.arrow_circle_left_outlined,
                              size: 27,
                            )
                          ],
                          if (state
                              is CheckStudentAppliedToOpportunityError) ...[
                            const Text(
                              'إعادة المحاولة',
                              style: TextStyle(fontSize: 18),
                            ),
                            addHorizontalSize(10),
                            const Icon(
                              Icons.error_outline,
                              size: 27,
                            )
                          ],
                          if (state
                              is CheckStudentAppliedToOpportunitySuccess) ...[
                            const Text(
                              'تم تقديم طلب لهذه الفرصة بالفعل',
                              style: TextStyle(fontSize: 18),
                            ),
                            addHorizontalSize(10),
                            const Icon(
                              Icons.check,
                              size: 27,
                            )
                          ]
                        ],
                      ));
                },
              ),
              addVerticalSize(20),
              Row(
                children: [
                  Container(
                    child: widget.opportunity.logo == null
                        ? const Icon(
                            Icons.volunteer_activism_outlined,
                            size: 40,
                            color: Colors.indigoAccent,
                          )
                        : CachedNetworkImage(
                            imageUrl:
                                '$kDownloadFilesURL/${widget.opportunity.logo?.fileKey ?? ''}',
                            httpHeaders: {
                              'Authorization':
                                  'Bearer ${globalAppStorage.getAccessToken()}'
                            },
                            imageBuilder: (ctx, image) {
                              return CircleAvatar(
                                  radius: 55,
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
                                Icons.broken_image_outlined,
                                size: 40,
                              );
                            },
                          ),
                  ),
                  addHorizontalSize(15),
                  Flexible(
                    child: Text(
                      widget.opportunity.title ?? '-',
                      style: const TextStyle(fontSize: 21),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(
                  indent: 5,
                  endIndent: 5,
                ),
              ),
              addVerticalSize(10),
              DetailsItem(
                title: 'التصنيف/الفئة:',
                details: widget.opportunity.category?.name ?? '-',
              ),
              DetailsItem(
                title: 'الوصف:',
                details: widget.opportunity.description ?? '-',
              ),
              DetailsItem(
                title: 'طبيعة العمل والأنشطة:',
                details: widget.opportunity.natureOfWorkOrActivities ?? '-',
              ),
              DetailsItem(
                title: 'عدد المتطوعين المطلوب:',
                details: widget.opportunity.requiredVolunteerStudentsNumber
                        ?.toString() ??
                    '-',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(
                  indent: 5,
                  endIndent: 5,
                ),
              ),
              const Text('معلومات المؤسسة/الشركة:',
                  style: TextStyle(
                    fontSize: 17,
                  )),
              Card(
                child: ListTile(
                  leading: Container(
                    child:
                        widget.opportunity.organization?.profilePicture == null
                            ? const Icon(
                                Icons.account_balance,
                                size: 35,
                                color: Colors.indigoAccent,
                              )
                            : CachedNetworkImage(
                                imageUrl:
                                    '$kDownloadFilesURL/${widget.opportunity.organization?.profilePicture?.fileKey ?? ''}',
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
                  title: Text(widget.opportunity.organization?.fullName ?? '-'),
                  isThreeLine: true,
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.opportunity.organization?.fieldOfWork ?? '-'),
                      Text(widget.opportunity.organization?.address ?? '-'),
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => ViewOrganizationProfilePage(
                                organization: widget.opportunity.organization!),
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(
                  indent: 5,
                  endIndent: 5,
                ),
              ),
              DetailsItem(
                title: 'تاريخ انتهاء استقبال الطلبات:',
                details: widget.opportunity.receiveApplicationsEndDate
                        ?.getDateString() ??
                    '-',
              ),
              DetailsItem(
                title: 'تاريخ بدء البرنامج:',
                details: widget.opportunity.actualProgramStartDate
                        ?.getDateString() ??
                    '-',
              ),
              DetailsItem(
                title: 'تاريخ انتهاء البرنامج:',
                details:
                    widget.opportunity.actualProgramEndDate?.getDateString() ??
                        '-',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
