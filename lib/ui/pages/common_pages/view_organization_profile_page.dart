import 'package:flutter/material.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../common_components/add_size.dart';
import '../../common_components/details_item.dart';
import '../../common_components/profile_picture_widget.dart';
import 'conversation_messages_page.dart';

class ViewOrganizationProfilePage extends StatefulWidget {
  const ViewOrganizationProfilePage({Key? key, required this.organization})
      : super(key: key);

  final OrganizationDto organization;

  @override
  State<ViewOrganizationProfilePage> createState() =>
      _ViewOrganizationProfilePageState();
}

class _ViewOrganizationProfilePageState
    extends State<ViewOrganizationProfilePage> {
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
              ],
            )

          ),
        ));
  }
}
