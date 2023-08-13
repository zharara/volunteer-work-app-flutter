import 'package:flutter/material.dart';

showSuccessSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      content: Text(message),
    ),
  );
}

showErrorSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(message),
    ),
  );
}

showInnerNotification(
    {required BuildContext context,
    required String? title,
    required String message,
    IconData? icon,
    required int seconds,
    String? onPressText,
    void Function()? onPressed}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        action: onPressed == null
            ? null
            : SnackBarAction(
                label: onPressText ?? 'ذهاب',
                onPressed: onPressed,
              ),
        duration: Duration(seconds: seconds),
        content: Row(
          children: [
            Icon(
              icon ?? Icons.notifications_active,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            if (title != null)
              Flexible(
                child: RichText(
                  text: TextSpan(
                      text: title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '\n$message',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                          ),
                        )
                      ]),
                ),
              ),
            if (title == null)
              Flexible(
                child: Text(
                  message,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
}
