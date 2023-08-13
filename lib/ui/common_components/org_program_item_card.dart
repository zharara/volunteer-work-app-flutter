import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/ui/common_components/add_size.dart';
import 'package:volunteer_work_app/ui/common_components/snack_bars.dart';
import 'package:volunteer_work_app/ui/pages/organization/programs/org_view_program_page.dart';
import '../../blocs/volunteer_programs/delete_program/delete_program_cubit.dart';
import '../../blocs/volunteer_programs/get_organization_programs/get_organization_programs_cubit.dart';
import '../../constants/api_constants.dart';
import '../../domain/api_generated_code/api.models.swagger.dart';
import '../../main.dart';
import '../../utils/exception_handlers.dart';
import '../../utils/extensions/date_time_extensions.dart';
import 'dialogs.dart';

class OrgProgramItemCard extends StatelessWidget {
  const OrgProgramItemCard({Key? key, required this.item}) : super(key: key);

  final VolunteerProgramDto item;

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
                      ? const Icon(Icons.workspace_premium,
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
                Text(item.title ?? '-', style: const TextStyle(fontSize: 20),),
                const Expanded(child: SizedBox()),
                Text(item.category?.name ?? '-'),
              ],
            ),
           addVerticalSize(15),

            Row(
              children: [
                const Text('تاريخ بدء البرنامج: '),
                addHorizontalSize(10),
                Text(item.startDate?.getDateString() ?? '-' ,
                  style: const TextStyle(fontSize: 15),),
              ],
            ),
            addVerticalSize(8),
            Row(
              children: [
                const Text('تاريخ انتهاء البرنامج: '),
                addHorizontalSize(10),
                Text(item.endDate?.getDateString() ?? '-' ,
                  style: const TextStyle(fontSize: 15),),
              ],
            ),


           Row(
             children: [
               Text('${item.createdDate?.getTimeString() ?? '-'}  ${item.createdDate?.getDateString() ?? '-'}' ,
                 style: const TextStyle(fontSize: 13),),
               addHorizontalSize(5),
               const Icon(Icons.access_time, size: 18,),
               const Expanded(child: SizedBox()),
               IconButton(
                   onPressed: () {
                     showDeleteDialog(
                         context: context,
                         title: 'حذف برنامج التطوع',
                         itemName: item.title ?? '-',
                         moreInfo:
                         'سيتم حذف برنامج التطوع وما يتعلق به من نظام التطوع بشكل كامل.',
                         loadingOrDeleteButton: BlocConsumer<
                             DeleteProgramCubit,
                             DeleteProgramState>(
                             listener: (context, state) {
                               if (state
                               is DeleteProgramError) {
                                 showNetworkException(
                                     context: context,
                                     error: state.error);
                               }

                               if (state
                               is DeleteProgramSuccess) {
                                 context
                                     .read<
                                     GetOrganizationProgramsCubit>()
                                     .deleteItemInternally(item.id!);

                                 context
                                     .read<
                                     DeleteProgramCubit>()
                                     .resetState();

                                 showSuccessSnackBar(
                                   context: context,
                                   message:
                                   'تم حذف برنامج التطوع بنجاح',
                                 );
                                 Navigator.pop(context);
                               }
                             }, builder: (context, state) {
                           if (state
                           is DeleteProgramLoading) {
                             return Transform.scale(
                                 scale: 0.7,
                                 child:
                                 const CircularProgressIndicator());
                           }

                           return deleteButton(() {
                             context
                                 .read<
                                 DeleteProgramCubit>()
                                 .deleteProgram(item.id ?? 0);
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
                     builder: (ctx) => OrgViewProgramPage(
                         programDto: item),
                   ),
                 );
               }, icon: const Icon(Icons.arrow_forward)),
             ],
           )
          ],
        ),
      ),
    );
  }
}
