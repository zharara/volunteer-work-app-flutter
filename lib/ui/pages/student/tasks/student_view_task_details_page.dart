import 'package:flutter/material.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../common_components/add_size.dart';
import '../../../common_components/details_item.dart';

class StudentViewTaskDetailsPage extends StatefulWidget {
  const StudentViewTaskDetailsPage(
      {Key? key, required this.taskDto, this.taskAccomplishDto})
      : super(key: key);

  final VolunteerProgramTaskDto taskDto;
  final VolunteerStudentTaskAccomplishDto? taskAccomplishDto;

  @override
  State<StudentViewTaskDetailsPage> createState() =>
      _StudentViewTaskDetailsPageState();
}

class _StudentViewTaskDetailsPageState
    extends State<StudentViewTaskDetailsPage> {
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
              const Divider(),
              addVerticalSize(10),
              if (widget.taskAccomplishDto?.isAccomplished ?? false) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('تم إنجاز المهمة'),
                    addHorizontalSize(15),
                    const Icon(
                      Icons.task_alt,
                      color: Colors.green,
                    )
                  ],
                ),
                DetailsItem(
                  title: 'تقييم المؤسسة:',
                  details:
                      widget.taskAccomplishDto?.rate?.toStringAsFixed(1) ?? '-',
                ),
              ] else
                const Center(child: Text('لم يتم تسجيل إنجاز المهمة بعد'))
            ],
          ),
        ),
      ),
    );
  }
}
