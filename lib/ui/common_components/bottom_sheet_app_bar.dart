import 'package:flutter/material.dart';

class BottomSheetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BottomSheetAppBar({Key? key, this.title, this.actions}) : super(key: key);

  final String? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Text(
              title!,
              style: const TextStyle(color: Colors.black),
            )
          : null,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
