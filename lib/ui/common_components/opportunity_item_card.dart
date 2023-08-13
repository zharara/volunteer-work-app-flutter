import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:volunteer_work_app/ui/common_components/add_size.dart';
import '../../constants/api_constants.dart';
import '../../domain/api_generated_code/api.models.swagger.dart';
import '../../main.dart';
import '../../utils/extensions/date_time_extensions.dart';
import '../pages/student/opportunities/student_opportunity_details_page.dart';

class OpportunityItemCard extends StatelessWidget {
  const OpportunityItemCard({Key? key, required this.item}) : super(key: key);

  final VolunteerOpportunityDto item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: item.logo == null
                      ? const Icon(Icons.volunteer_activism_outlined,
                    size: 35, color: Colors.indigoAccent,)
                      : CachedNetworkImage(
                    imageUrl: '$kDownloadFilesURL/${item.logo?.fileKey ?? ''}',
                    httpHeaders: {
                      'Authorization': 'Bearer ${globalAppStorage.getAccessToken()}'
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
               addHorizontalSize(20),
                Text(item.title ?? '-', style: TextStyle(fontSize: 20),),
                Expanded(child: SizedBox()),
                Text(item.category?.name ?? '-'),
              ],
            ),
           addVerticalSize(15),
            Row(
              children: [
                Text('اسم المؤسسة/الشركة: '),
                addHorizontalSize(10),
                Text(item.organization?.fullName ?? '-'),
              ],
            ),
           addVerticalSize(8),
           Row(
             children: [
               Text('طبيعة العمل والأنشطة: '),
               addHorizontalSize(10),
               Text(item.natureOfWorkOrActivities ?? '-'),
             ],
           ),
            addVerticalSize(8),

            Row(
              children: [
                Text('تاريخ بدء البرنامج: '),
                addHorizontalSize(10),
                Text(item.createdDate?.getDateString() ?? '-' ,
                  style: TextStyle(fontSize: 15),),
              ],
            ),
            addVerticalSize(8),

            Row(
              children: [
                Text('عدد المتطوعين المطلوب: '),
                addHorizontalSize(10),
                Text(item.requiredVolunteerStudentsNumber.toString()),
              ],
            ),

           Row(
             children: [
               Text('${item.createdDate?.getTimeString() ?? '-'}  ${item.createdDate?.getDateString() ?? '-'}' ,
                 style: TextStyle(fontSize: 13),),
               addHorizontalSize(5),
               Icon(Icons.access_time, size: 18,),
               Expanded(child: SizedBox()),
               IconButton(onPressed: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (ctx) => StudentOpportunityDetailsPage(
                         opportunity:
                         item),
                   ),
                 );
               }, icon: Icon(Icons.arrow_forward)),
             ],
           )
          ],
        ),
      ),
    );
  }
}
