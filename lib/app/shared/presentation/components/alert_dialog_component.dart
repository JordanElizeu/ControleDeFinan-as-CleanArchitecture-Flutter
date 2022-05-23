import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../../../../i18n/constants_i18n.dart';
import '../../../routes/routes.dart';

void showAlertDialogError({
  required BuildContext context,
  required String messageError,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialogWidget(messageError: messageError);
    },
  );
}

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    Key? key,
    required this.messageError,
  }) : super(key: key);

  final String messageError;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Ocorreu um erro!"),
      content: SingleChildScrollView(
        child: Container(
          key: const ValueKey('background'),
          width: 200,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 0,
                child: Icon(
                  Icons.error,
                  size: 50,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(messageError),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          child: Text(ConstantI18n.buttonConfirmDialogText.i18n()),
          onPressed: () {
            Modular.to.popUntil(ModalRoute.withName(Routes.login));
          },
        ),
      ],
    );
  }
}
