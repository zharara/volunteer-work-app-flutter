import 'package:flutter/material.dart';

import 'add_size.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem({Key? key, required this.title, required this.details})
      : super(key: key);

  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
              fontSize: 17,
            )),
        Text(
          details,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        addVerticalSize(10),
      ],
    );
  }
}
