import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
