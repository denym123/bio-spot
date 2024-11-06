import 'package:flutter_modular/flutter_modular.dart';

import '../core/routes/routes.dart';
import '../global_modules/core/core_module.dart';
import '../modules/login/login.dart';
import '../modules/splash/splash.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module(Routes.login,
        module: LoginModule(), transition: TransitionType.rightToLeft);
  }
}
