import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/ui/common_components/details_item.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../constants/api_constants.dart';
import '../../../main.dart';
import '../../common_components/add_size.dart';

class ViewAnnouncementPage extends StatefulWidget {
  const ViewAnnouncementPage({Key? key, required this.announcementDto})
      : super(key: key);

  final AnnouncementDto announcementDto;

  @override
  State<ViewAnnouncementPage> createState() => _ViewAnnouncementPageState();
}

class _ViewAnnouncementPageState extends State<ViewAnnouncementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الإعلان'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSize(30),
              Center(
                child: CachedNetworkImage(
                  imageUrl: '$kDownloadFilesURL/${widget.announcementDto.image?.fileKey ?? ''}',
                  httpHeaders: {
                    'Authorization': 'Bearer ${globalAppStorage.getAccessToken()}'
                  },
                  imageBuilder: (ctx, image) {
                    return Image(
                      image: image,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width /
                          1.5,
                    )
                    ;
                  },
                  progressIndicatorBuilder: (ctx, url, downloadProgress) {
                    return CircularProgressIndicator(
                      value: downloadProgress.progress,
                    );
                  },
                  errorWidget: (ctx, url, error) {
                    return const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.error_outline,
                        size: 50,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              ),
              addVerticalSize(10),
              Divider(),
              addVerticalSize(30),
              DetailsItem(title: 'تاريخ الإعلان:',
                  details: widget.announcementDto.createdDate?.getDateString() ??
                      '-'),
              addVerticalSize(5),
              DetailsItem(title: 'جهة الإعلان:',
                  details: (widget.announcementDto.isManagementAnnouncement ?? false)
                      ? 'الإدارة':
                      'المؤسسة'),
              addVerticalSize(5),
              DetailsItem(
                  title: 'العنوان:', details: widget.announcementDto.title ?? '-'),
              addVerticalSize(5),
              DetailsItem(title: 'الوصف:',
                  details: widget.announcementDto.description ?? '-'),
              addVerticalSize(30),
            ],
          ),
        ),
      ),
    );
  }
}
