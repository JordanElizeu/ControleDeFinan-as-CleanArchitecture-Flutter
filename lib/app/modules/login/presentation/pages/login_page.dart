import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../../../i18n/constants_i18n.dart';
import '../../../../shared/utils/utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImageAsset.logoLeuFinances, height: 50),
          const SizedBox(height: 25),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            onPressed: () {},
            child: Text(ConstantI18n.signInWithGoogle.i18n()),
          ),
        ],
      ),
    );
  }
}
