import 'package:flutter/material.dart';

class CenteredProgressIndicator extends StatelessWidget {
  const CenteredProgressIndicator({Key? key, required this.verticalPadding}) : super(key: key);

  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
