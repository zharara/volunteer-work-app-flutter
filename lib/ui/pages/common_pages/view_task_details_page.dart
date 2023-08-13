import 'package:flutter/material.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../common_components/add_size.dart';
import '../../common_components/details_item.dart';

class ViewTaskDetailsPage extends StatefulWidget {
  const ViewTaskDetailsPage({Key? key, required this.taskDto})
      : super(key: key);

  final VolunteerProgramTaskDto taskDto;

  @override
  State<ViewTaskDetailsPage> createState() =>
      _ViewTaskDetailsPageState();
}

class _ViewTaskDetailsPageState
    extends State<ViewTaskDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل المهمة'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              addVerticalSize(15),
              DetailsItem(
                title: 'عنوان المهمة:',
                details: widget.taskDto.title ?? '-',
              ),
              DetailsItem(
                title: 'الوصف:',
                details: widget.taskDto.description ?? '-',
              ),
              DetailsItem(
                title: 'تاريخ بدء المهمة:',
                details: widget.taskDto.startDate?.getDateString() ?? '-',
              ),
              DetailsItem(
                title: 'تاريخ انتهاء المهمة:',
                details: widget.taskDto.endDate?.getDateString() ?? '-',
              ),
              addVerticalSize(10),
            ],
          ),
        ),
      ),
    );
  }

}
