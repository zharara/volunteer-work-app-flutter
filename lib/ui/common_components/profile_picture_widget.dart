import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/api_constants.dart';
import '../../domain/api_generated_code/api.models.swagger.dart';
import '../../main.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget(
      {Key? key,
      this.savedFileDto,
      this.imageRadius = 35,
      this.rectangleImageRatio = 3,
      this.iconRadius = 34,
      this.iconSize = 40,
      this.isRectangleImage = false})
      : super(key: key);

  final SavedFileDto? savedFileDto;
  final double imageRadius;
  final double rectangleImageRatio;
  final double iconRadius;
  final double iconSize;
  final bool isRectangleImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: savedFileDto == null
          ? CircleAvatar(
              backgroundColor: Colors.white,
        radius: iconRadius + 4,
              child: CircleAvatar(
                radius: iconRadius,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.person,
                  size: iconSize,
                  color: Colors.white,
                ),
              ),
            )
          : CachedNetworkImage(
              imageUrl: '$kDownloadFilesURL/${savedFileDto?.fileKey ?? ''}',
              httpHeaders: {
                'Authorization': 'Bearer ${globalAppStorage.getAccessToken()}'
              },
              imageBuilder: (ctx, image) {
                return isRectangleImage
                    ? Image(
                        image: image,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width /
                            rectangleImageRatio,
                      )
                    : CircleAvatar(
                        radius: imageRadius,
                        backgroundColor: Colors.blue,
                        backgroundImage: image,
                      );
              },
              progressIndicatorBuilder: (ctx, url, downloadProgress) {
                return CircularProgressIndicator(
                  value: downloadProgress.progress,
                );
              },
              errorWidget: (ctx, url, error) {
                return CircleAvatar(
                  radius: iconRadius,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.error_outline,
                    size: iconSize,
                    color: Colors.black,
                  ),
                );
              },
            ),
    );
  }
}
