import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:volunteer_work_app/constants/api_constants.dart';

import '../../domain/api_generated_code/api.models.swagger.dart';
import '../../main.dart';
import '../pages/management/organizations/mng_view_organization_profile_page.dart';

class MngHomeOrganizationItemCard extends StatelessWidget {
  const MngHomeOrganizationItemCard({Key? key, required this.organizationDto})
      : super(key: key);

  final OrganizationDto organizationDto;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          child: organizationDto.profilePicture == null
              ? const Icon(
                  Icons.account_balance,
                  size: 35,
                  color: Colors.indigoAccent,
                )
              : CachedNetworkImage(
                  imageUrl:
                      '$kDownloadFilesURL/${organizationDto.profilePicture?.fileKey ?? ''}',
                  httpHeaders: {
                    'Authorization':
                        'Bearer ${globalAppStorage.getAccessToken()}'
                  },
                  imageBuilder: (ctx, image) {
                    return CircleAvatar(backgroundImage: image);
                  },
                  progressIndicatorBuilder: (ctx, url, downloadProgress) {
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
        title: Text(organizationDto.fullName ?? '-'),
        subtitle: Text(organizationDto.fieldOfWork ?? '-'),
        trailing:  IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => MngViewOrganizationProfilePage(
                      organization: organizationDto),
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward)),
      ),
    );
  }
}
