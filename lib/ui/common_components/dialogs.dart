import 'package:flutter/material.dart';

showErrorDialog(
    {required BuildContext context,
    required String title,
    required String message,
    String? details}) {
  showDialog(
    context: context,
    builder: (dContext) => AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.error_outline),
          const SizedBox(
            width: 10,
          ),
          Flexible(child: Text(title, style: const TextStyle(fontSize: 18))),
        ],
      ),
      content: Text(
        message + (details == null ? '' : '\n\n$details'),
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(dContext);
          },
          child: const Text('إغلاق'),
        ),
      ],
    ),
  );
}

showDeleteDialog({
  required BuildContext context,
  String title = 'حذف بشكل نهائي',
  required String itemName,
   String? moreInfo,
   String? altMessage,
  required Widget loadingOrDeleteButton,
}) {
  showDialog(
    context: context,
    builder: (dContext) => AlertDialog(
      title: Row(
        children:  [
          const Icon(
            Icons.delete_forever,
            color: Colors.red,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(title, style: const TextStyle(fontSize: 18)),
        ],
      ),
      content: Text(
        '\nهل أنت متأكد من ${altMessage ?? 'حذف'} ($itemName) بشكل نهائي؟ ${moreInfo ?? ''}',
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(dContext);
          },
          child: const Text('إغلاق'),
        ),
        loadingOrDeleteButton,
      ],
    ),
  );
}

Widget deleteButton(void Function() onConfirmDelete) => TextButton(
      onPressed: onConfirmDelete,
      child: const Text(
        'تأكيد',
        style: TextStyle(color: Colors.red),
      ),
    );

