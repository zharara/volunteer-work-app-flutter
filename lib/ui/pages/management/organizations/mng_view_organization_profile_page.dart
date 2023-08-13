import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/volunteer_opportunities/get_organization_opportunities/get_organization_opportunities_cubit.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/ui/common_components/mng_opportunity_item_card.dart';

import '../../../../blocs/volunteer_programs/get_organization_programs/get_organization_programs_cubit.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/details_item.dart';
import '../../../common_components/mng_program_item_card.dart';
import '../../../common_components/profile_picture_widget.dart';
import '../../../common_components/title_with_action.dart';
import '../../common_pages/conversation_messages_page.dart';

class MngViewOrganizationProfilePage extends StatefulWidget {
  const MngViewOrganizationProfilePage({Key? key, required this.organization}) : super(key: key);

  final OrganizationDto organization;

  @override
  State<MngViewOrganizationProfilePage> createState() => _MngViewOrganizationProfilePageState();
}

class _MngViewOrganizationProfilePageState extends State<MngViewOrganizationProfilePage> {

  @override
  void initState() {
    super.initState();

    context.read<GetOrganizationProgramsCubit>().getOrganizationPrograms(  organizationId: widget.organization.id ?? 0,);

    BlocProvider.of<GetOrganizationOpportunitiesCubit>(context)
        .getOrganizationOpportunities(
      widget.organization.id ?? 0,);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('الملف التعريفي'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            ConversationMessagesPage(
                              peerUserId: widget.organization.id,
                              peerUserName: widget.organization.fullName,
                              peerUserImage:
                              widget.organization.profilePicture?.fileKey,
                            )));
              },
              icon: const Icon(Icons.chat_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ProfilePictureWidget(
                          imageRadius: 55,
                          iconRadius: 50,
                          iconSize: 50,
                          savedFileDto: widget.organization.profilePicture),
                      addHorizontalSize(15),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                widget.organization.fullName ?? '-',
                                style: const TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                widget.organization.email ?? '-',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  const Divider(),
                  DetailsItem(
                    title: 'مجال العمل:',
                    details: widget.organization.fieldOfWork ?? '-',
                  ),
                  DetailsItem(
                    title: 'نبذة عن الشركة:',
                    details: widget.organization.about ?? '-',
                  ),
                  DetailsItem(
                    title: 'العنوان:',
                    details: widget.organization.address ?? '-',
                  ),
                  DetailsItem(
                    title: 'رقم الهاتف:',
                    details: widget.organization.phoneNumber ?? '-',
                  ),
                  DetailsItem(
                    title: 'الرؤية:',
                    details: widget.organization.vision ?? '-',
                  ),
                  DetailsItem(
                    title: 'الرسالة:',
                    details: widget.organization.mission ?? '-',
                  ),
                  const Divider(),
                  addVerticalSize(20),
                  TitleWithAction(
                    title: 'برامج المؤسسة',
                    action: '',
                    icon: Icons.refresh,
                    onIconPressed: () {
                      BlocProvider.of<GetOrganizationProgramsCubit>(context)
                          .getOrganizationPrograms(organizationId: widget.organization.id ?? 0,);
                    },
                  ),
                  addVerticalSize(10),
                  BlocConsumer<GetOrganizationProgramsCubit,
                      GetOrganizationProgramsState>(
                    listener: (context, state) {
                      if (state is GetOrganizationProgramsError) {
                        showNetworkException(
                            context: context, error: state.error);
                      }
                    },
                    builder: (context, state) {
                      if (state is GetOrganizationProgramsLoading) {
                        return const CenteredProgressIndicator(
                            verticalPadding: 30);
                      }
                      if (state is GetOrganizationProgramsError) {
                        return const CenteredErrorMessage(
                          verticalPadding: 30,
                        );
                      }
                      if (state is GetOrganizationProgramsSuccess) {
                        return ListView.builder(
                            itemCount: state.data.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: MngProgramItemCard(
                                    item: state.data[index]),
                              );
                            });
                      }

                      return const SizedBox.shrink();
                    },
                  ),

                  addVerticalSize(20),
                  TitleWithAction(
                    title: 'فرص التطوع المعلنة',
                    action: '',
                    icon: Icons.refresh,
                    onIconPressed: () {
                      BlocProvider.of<GetOrganizationOpportunitiesCubit>(context)
                          .getOrganizationOpportunities(
                        widget.organization.id ?? 0,);
                    },
                  ),
                  addVerticalSize(10),
                  BlocConsumer<GetOrganizationOpportunitiesCubit,
                      GetOrganizationOpportunitiesState>(
                    listener: (context, state) {
                      if (state is GetOrganizationOpportunitiesError) {
                        showNetworkException(
                            context: context, error: state.error);
                      }
                    },
                    builder: (context, state) {
                      if (state is GetOrganizationOpportunitiesLoading) {
                        return const CenteredProgressIndicator(
                            verticalPadding: 30);
                      }
                      if (state is GetOrganizationOpportunitiesError) {
                        return const CenteredErrorMessage(
                          verticalPadding: 30,
                        );
                      }
                      if (state is GetOrganizationOpportunitiesSuccess) {
                        return ListView.builder(
                            itemCount: state.data.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: MngOpportunityItemCard(
                                    item: state.data[index]),
                              );
                            });
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ],
              )

          ),
        ));
  }
}
