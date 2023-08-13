import 'package:flutter/material.dart';

class TitleWithAction extends StatelessWidget {
  const TitleWithAction(
      {Key? key,
      required this.title,
      required this.action,
      required this.icon,
      required this.onIconPressed})
      : super(key: key);

  final String title;
  final String action;
  final IconData icon;
  final void Function() onIconPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          TextButton(
            onPressed: onIconPressed,
            child: Row(
              children: [
                Text(action),
                SizedBox(width: 5,),
                Icon(icon),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
