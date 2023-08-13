import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/announcements/get_organization_announcements/get_organization_announcements_cubit.dart';
import 'package:volunteer_work_app/ui/pages/organization/announcements/create_organization_announcement_page.dart';

import '../../../../blocs/announcements/delete_announcement/delete_announcement_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/snack_bars.dart';
import 'org_update_announcement_page.dart';

class OrgManageAnnouncementsPage extends StatefulWidget {
  const OrgManageAnnouncementsPage({Key? key}) : super(key: key);

  @override
  State<OrgManageAnnouncementsPage> createState() =>
      _OrgManageAnnouncementsPageState();
}

class _OrgManageAnnouncementsPageState extends State<OrgManageAnnouncementsPage> {
  @override
  void initState() {
    super.initState();

    if (context.read<GetOrganizationAnnouncementsCubit>().state
    is! GetOrganizationAnnouncementsSuccess) {
      context
          .read<GetOrganizationAnnouncementsCubit>()
          .getOrganizationAnnouncements(
          organizationId: globalAppStorage
              .getOrganizationAccount()
              ?.id ?? 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إدارة إعلانات المؤسسة'),
        actions: [
          IconButton(onPressed: (){
            context
                .read<GetOrganizationAnnouncementsCubit>()
                .getOrganizationAnnouncements(
                organizationId: globalAppStorage
                .getOrganizationAccount()
                ?.id ?? 0);
          }, icon: const Icon(Icons.refresh))
        ],
      ),
      body: BlocConsumer<GetOrganizationAnnouncementsCubit, GetOrganizationAnnouncementsState>(
        listener: (context, state) {
          if (state is GetOrganizationAnnouncementsError) {
            showNetworkException(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is GetOrganizationAnnouncementsLoading) {
            return const CenteredProgressIndicator(
              verticalPadding: 0,
            );
          }
          if (state is GetOrganizationAnnouncementsError) {
            return const CenteredErrorMessage(
              verticalPadding: 0,
            );
          }

          if (state is GetOrganizationAnnouncementsEmpty) {
            return const CenteredEmptyData();
          }
          if (state is GetOrganizationAnnouncementsSuccess) {
            return GridView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) =>
                  buildImageCard(index, state.data[index]),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const CreateOrganizationAnnouncementPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildImageCard(int index, AnnouncementDto item) =>
      Padding(
        padding: const EdgeInsets.all(8),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) =>
                OrgUpdateAnnouncementPage(announcementDto: item)),);
          },
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              '$kDownloadFilesURL/${item.image?.fileKey ?? ''}',
                              headers: {
                                'Authorization':
                                'Bearer ${globalAppStorage.getAccessToken()}'
                              },
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child:  Align(
                          alignment: Alignment.bottomRight,
                          child:  Container(

                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(100)),
                            child: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (dContext) => BlocListener<
                                      DeleteAnnouncementCubit, DeleteAnnouncementState>(
                                    listener: (context, state) {
                                      if (state is DeleteAnnouncementError) {
                                        showNetworkException(
                                            context: context, error: state.error);
                                      }

                                      if (state is DeleteAnnouncementSuccess) {
                                        context
                                            .read<GetOrganizationAnnouncementsCubit>()
                                            .deleteItemInternally(state.data.id!);

                                        Navigator.pop(context);

                                        showSuccessSnackBar(
                                          context: context,
                                          message: 'تم حذف الإعلان بنجاح',
                                        );
                                      }
                                    },
                                    child: AlertDialog(
                                      title: Row(
                                        children: const [
                                          Icon(
                                            Icons.delete_forever,
                                            color: Colors.red,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('حذف إعلان عام',
                                              style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                      content: const Text(
                                        'هل أنت متأكد من حذف هذا الإعلان بشكل نهائي؟',
                                      ),
                                      actionsAlignment: MainAxisAlignment.spaceEvenly,
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(dContext);
                                          },
                                          child: const Text('إغلاق'),
                                        ),
                                        BlocBuilder<DeleteAnnouncementCubit,
                                            DeleteAnnouncementState>(
                                          builder: (context, state) {
                                            if (state is DeleteAnnouncementLoading) {
                                              return Transform.scale(
                                                  scale: 0.7,
                                                  child: const CircularProgressIndicator());
                                            }

                                            return TextButton(
                                              onPressed: () {
                                                context
                                                    .read<DeleteAnnouncementCubit>()
                                                    .deleteAnnouncement(
                                                  item.id!,
                                                );
                                              },
                                              child: const Text(
                                                'تأكيد',
                                                style: TextStyle(color: Colors.red),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              splashRadius: 30,
                              icon: const Icon(
                                Icons.clear,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  addVerticalSize(10),
                  Text(item.title ?? '-')
                ],
              ),
            ),
          ),
        ),
      );

}
