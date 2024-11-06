import 'package:flutter_modular/flutter_modular.dart';

import 'routes.dart';

class AppRoutes {
  AppRoutes._();

  static goToLogin() {
    Modular.to.navigate(Routes.login);
  }
}
