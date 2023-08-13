import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/volunteer_opportunities/delete_opportunity/delete_opportunity_cubit.dart';
import 'package:volunteer_work_app/ui/common_components/add_size.dart';
import 'package:volunteer_work_app/ui/common_components/snack_bars.dart';
import '../../blocs/volunteer_opportunities/get_organization_opportunities/get_organization_opportunities_cubit.dart';
import '../../constants/api_constants.dart';
import '../../domain/api_generated_code/api.models.swagger.dart';
import '../../main.dart';
import '../../utils/exception_handlers.dart';
import '../../utils/extensions/date_time_extensions.dart';
import '../pages/organization/opportunities/opportunity_edit_page.dart';
import 'dialogs.dart';

class OrgOpportunityItemCard extends StatelessWidget {
  const OrgOpportunityItemCard({Key? key, required this.item}) : super(key: key);

  final VolunteerOpportunityDto item;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.grey.shade50,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: item.logo == null
                      ? Icon(Icons.volunteer_activism_outlined,
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
                Text(item.actualProgramStartDate?.getDateString() ?? '-' ,
                  style: TextStyle(fontSize: 15),),
              ],
            ),
            addVerticalSize(8),
            Row(
              children: [
                Text('تاريخ انتهاء الإعلان: '),
                addHorizontalSize(10),
                Text(item.announcementEndDate?.getDateString() ?? '-' ,
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
               IconButton(
                   onPressed: () {
                     showDeleteDialog(
                         context: context,
                         title: 'حذف فرصة التطوع',
                         itemName: item.title ?? '-',
                         moreInfo:
                         'سيتم حذف فرصة التطوع وما يتعلق بها من نظام التطوع بشكل كامل.',
                         loadingOrDeleteButton: BlocConsumer<
                             DeleteOpportunityCubit,
                             DeleteOpportunityState>(
                             listener: (context, state) {
                               if (state
                               is DeleteOpportunityError) {
                                 showNetworkException(
                                     context: context,
                                     error: state.error);
                               }

                               if (state
                               is DeleteOpportunitySuccess) {
                                 context
                                     .read<
                                     GetOrganizationOpportunitiesCubit>()
                                     .deleteItemInternally(item.id!);

                                 context
                                     .read<
                                     DeleteOpportunityCubit>()
                                     .resetState();

                                 showSuccessSnackBar(
                                   context: context,
                                   message:
                                   'تم حذف فرصة التطوع بنجاح',
                                 );
                                 Navigator.pop(context);
                               }
                             }, builder: (context, state) {
                           if (state
                           is DeleteOpportunityLoading) {
                             return Transform.scale(
                                 scale: 0.7,
                                 child:
                                 const CircularProgressIndicator());
                           }

                           return deleteButton(() {
                             context
                                 .read<
                                 DeleteOpportunityCubit>()
                                 .deleteOpportunity(item.id ?? 0);
                           });
                         }));
                   },
                   icon: const Icon(
                     Icons.delete_forever,
                     color: Colors.red,
                   )),
               IconButton(onPressed: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (ctx) => OpportunityEditPage(
                         opportunity: item),
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
