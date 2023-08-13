import 'package:flutter/material.dart';
import 'package:volunteer_work_app/ui/common_components/add_size.dart';

class CenteredEmptyData extends StatelessWidget {
  const CenteredEmptyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.not_interested, size: 30,),
          addVerticalSize(20),
          const Text('لا يوجد بيانات')
        ],
      ),
    );
  }
}
