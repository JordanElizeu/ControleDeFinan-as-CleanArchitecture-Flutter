import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'domain/usecases/usecases.dart';
import 'external/external.dart';
import 'infrastructure/repositories/repositories.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/blocs/blocs.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => GoogleSignIn()),
        Bind.singleton((i) => FirebaseAuth.instance),
        Bind.singleton((i) => SignInGoogleDatasourceImplementation(i(), i())),
        Bind.singleton((i) => LoginRepositoryImplementation(i())),
        Bind.singleton((i) => SignInGoogleUseCaseImplementation(i())),
        Bind.singleton((i) => LoginBloc(i()), onDispose: (bloc) async {
          bloc as LoginBloc;
          await bloc.close();
        })
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, arguments) => const LoginPage(),
        ),
      ];
}
