import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../../blocs/student_applications/check_student_applied_to_opportunity/check_student_applied_to_opportunity_cubit.dart';
import '../../../../blocs/student_applications/create_volunteer_application/create_volunteer_application_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../../utils/form_validators.dart';
import '../../../../utils/pick_files.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/details_item.dart';
import '../../../common_components/input_page_title.dart';
import '../../../common_components/show_upload_files.dart';
import '../../../common_components/snack_bars.dart';

class ApplyForOpportunityPage extends StatefulWidget {
  const ApplyForOpportunityPage(
      {Key? key, required this.volunteerOpportunityDto})
      : super(key: key);

  final VolunteerOpportunityDto volunteerOpportunityDto;

  @override
  State<ApplyForOpportunityPage> createState() =>
      _ApplyForOpportunityPageState();
}

class _ApplyForOpportunityPageState extends State<ApplyForOpportunityPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _applicantInfoTextTEC = TextEditingController();

  TempFileDto? _uploadedTempFile;
  File? _selectedFile;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateVolunteerApplicationCubit,
        CreateVolunteerApplicationState>(
      listener: (context, state) {
        if (state is CreateVolunteerApplicationError) {
          showNetworkException(context: context, error: state.error);
        }

        if (state is CreateVolunteerApplicationSuccess) {

          BlocProvider.of<CheckStudentAppliedToOpportunityCubit>(context)
              .addItemInternally(state.data);

          Navigator.pop(context);

          showSuccessSnackBar(context: context, message: 'تم التقديم بنجاح');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تقديم طلب لفرصة التطوع'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSize(20),
                Row(
                  children: [
                    Container(
                      child: widget.volunteerOpportunityDto.logo == null
                          ? const Icon(
                              Icons.volunteer_activism_outlined,
                              size: 40,
                              color: Colors.indigoAccent,
                            )
                          : CachedNetworkImage(
                              imageUrl:
                                  '$kDownloadFilesURL/${widget.volunteerOpportunityDto.logo?.fileKey ?? ''}',
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
                                  Icons.broken_image_outlined,
                                  size: 40,
                                );
                              },
                            ),
                    ),
                    addHorizontalSize(20),
                    Text(
                      widget.volunteerOpportunityDto.title ?? '-',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(widget.volunteerOpportunityDto.category?.name ?? '-'),
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
                  title: 'اسم المؤسسة/الشركة:',
                  details:
                      widget.volunteerOpportunityDto.organization?.fullName ??
                          '-',
                ),
                DetailsItem(
                  title: 'تصنيف مجال الفرصة:',
                  details: widget.volunteerOpportunityDto.category?.name ?? '-',
                ),
                DetailsItem(
                  title: 'الوصف:',
                  details: widget.volunteerOpportunityDto.description ?? '-',
                ),
                DetailsItem(
                  title: 'طبيعة العمل والأنشطة:',
                  details:
                      widget.volunteerOpportunityDto.natureOfWorkOrActivities ??
                          '-',
                ),
                DetailsItem(
                  title: 'عدد المتطوعين المطلوب:',
                  details: widget.volunteerOpportunityDto
                          .requiredVolunteerStudentsNumber
                          ?.toString() ??
                      '-',
                ),
                DetailsItem(
                  title: 'تاريخ بدء البرنامج:',
                  details: widget.volunteerOpportunityDto.actualProgramStartDate
                          ?.getDateString() ??
                      '-',
                ),
                DetailsItem(
                  title: 'تاريخ انتهاء البرنامج:',
                  details: widget.volunteerOpportunityDto.actualProgramEndDate
                          ?.getDateString() ??
                      '-',
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Divider(
                    indent: 5,
                    endIndent: 5,
                  ),
                ),
                const SectionTitle(
                  title: 'إدخال البيانات المطلوبة للتقديم',
                ),
                if (widget.volunteerOpportunityDto
                    .isRequirementNeededAsFile ??
                    false) ...[
                  const Text('اختيار ملف مرفق'),
                  InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () async {
                      final image = await pickFile();
                      if (image != null) {
                        // if((widget.volunteerOpportunityDto.requirementFileMaxAllowedSize ?? 0))
                        // if(image.lengthSync() <= (widget.volunteerOpportunityDto.requirementFileMaxAllowedSize ?? 0))
                        if (mounted) {
                          final tempFile = await showUploadFile(context, image);
                          if (tempFile != null) {
                            setState(() {
                              _uploadedTempFile = tempFile;
                              _selectedFile = image;
                            });
                          }
                        }
                      }
                    },
                    child: _selectedFile != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      height:
                                          MediaQuery.of(context).size.width /
                                              4.5,
                                      child: const Icon(
                                        Icons.file_present,
                                        size: 50,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _selectedFile = null;
                                            _uploadedTempFile = null;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.clear,
                                          color: Colors.black,
                                          size: 28,
                                        )),
                                  ],
                                ),
                                addHorizontalSize(15),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                          'اسم الملف: ${_selectedFile!.path.split('/').last}'),
                                    ),
                                    Flexible(
                                      child: Text(
                                          'حجم الملف: ${(_selectedFile!.lengthSync() / 1024).toStringAsFixed(1)} كيلو بايت'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        : Card(
                            color: Colors.grey.shade100,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.width / 4.5,
                              child: const Center(
                                  child: Icon(Icons.add, size: 40)),
                            ),
                          ),
                  ),
                  addVerticalSize(15),
                ],
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _applicantInfoTextTEC,
                    validator: (widget.volunteerOpportunityDto
                                .isRequirementNeededAsText ??
                            false)
                        ? fieldRequiredValidator
                        : null,
                    maxLines: 10,
                    minLines: 5,
                    decoration: InputDecoration(
                      labelText: widget.volunteerOpportunityDto
                              .applicantQualifications ??
                          'اكتب لماذا تريد التقديم لهذه الفرصة؟ وما هي مؤهلاتك؟',
                    ),
                  ),
                ),
                addVerticalSize(20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        BlocProvider.of<CreateVolunteerApplicationCubit>(
                                context)
                            .applyFor(
                          volunteerOpportunityId:
                              widget.volunteerOpportunityDto.id ?? 0,
                          textInformation: _applicantInfoTextTEC.text,
                          saveTempFile: _uploadedTempFile != null
                              ? SaveTempFile(tempFileId: _uploadedTempFile!.id!)
                              : null,
                        );
                      }
                    },
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Center(child: Text('تقديم طلب تطوع')),
                    ),
                  ),
                ),
                BlocBuilder<CreateVolunteerApplicationCubit,
                    CreateVolunteerApplicationState>(
                  builder: (context, state) {
                    if (state is CreateVolunteerApplicationLoading) {
                      return const CenteredProgressIndicator(
                          verticalPadding: 20);
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
