import 'package:flutter/material.dart';
import 'package:volunteer_work_app/ui/common_components/add_size.dart';

class CenteredErrorMessage extends StatelessWidget {
  const CenteredErrorMessage(
      {Key? key, required this.verticalPadding})
      : super(key: key);

  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 30,
            ),
            addVerticalSize(20),
            Text('حدث خطأ'),
          ],
        ),
      ),
    );
  }
}
