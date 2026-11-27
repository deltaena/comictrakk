import 'package:flutter/material.dart';

class DialogManager {

  static Future<bool> showPropagationDialog(BuildContext context) async {
    return await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => PropagationDialog()
    ) ?? false;
  }
}

class PropagationDialog extends StatelessWidget {
  const PropagationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Warning, propagating"),
      content: Text("select status will be propagated to issues in this collection, any previous status will be override"),
      actions: <Widget>[
        KoButton(),
        OkButton()
      ],
    );
  }
}

class OkButton extends StatelessWidget {
  const OkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Approve'),
      onPressed: () {
        Navigator.of(context).pop(true);
      },
    );
  }
}

class KoButton extends StatelessWidget {
  const KoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Deny'),
      onPressed: () {
        Navigator.of(context).pop(false);
      },
    );
  }
}
