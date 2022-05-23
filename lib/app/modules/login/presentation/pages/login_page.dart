import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../../../../../i18n/constants_i18n.dart';
import '../../../../routes/routes.dart';
import '../../../../shared/presentation/components/components.dart';
import '../../../../shared/utils/utils.dart';
import '../blocs/blocs.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginBloc _loginBloc;
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _loginBloc,
      listener: (listenerContext, state) async {
        if (state is LoginError) {
          showAlertDialogError(
            context: context,
            messageError: state.message,
          );
        }
        if (state is LoginSuccess) {
          await Modular.to.pushNamed(Routes.home, arguments: state.user);
        }
      },
      child: LayoutBuilder(
        builder: (builderContext, constraints) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                height: constraints.maxHeight * 0.80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Image.asset(
                        ImageAsset.logoLeuFinances,
                        width: constraints.maxWidth * 0.80,
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.80,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  ConstantI18n.signInWithGoogle.i18n(),
                                ),
                              ),
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                        onPressed: () {
                          _loginBloc.add(LoginSignInWithGoogleEvent());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    _loginBloc = Modular.get<LoginBloc>();
    super.initState();
  }
}
