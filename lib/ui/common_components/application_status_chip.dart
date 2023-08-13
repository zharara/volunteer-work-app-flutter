import 'package:flutter/material.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.enums.swagger.dart';

class ApplicationStatusChip extends StatelessWidget {
  const ApplicationStatusChip({Key? key, required this.status})
      : super(key: key);

  final ApplicationStatus? status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case ApplicationStatus.pending:
        return Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: const Text(
            'معلق',
            style: TextStyle(color: Colors.white),
          ),
        );
      case ApplicationStatus.approved:
        return Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: const Text(
            'مقبول',
            style: TextStyle(color: Colors.white),
          ),
        );
      case ApplicationStatus.rejected:
        return Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: const Text(
            'مرفوض',
            style: TextStyle(color: Colors.white),
          ),
        );
      default:
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: const Text(
            'غير محدد',
            style: TextStyle(color: Colors.white),
          ),
        );
    }
  }
}
