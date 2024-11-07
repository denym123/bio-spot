import 'package:biospot/core/routes/app_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core.dart';

part 'splash_controller.g.dart';

class SplashController = SplashControllerBase with _$SplashController;

abstract class SplashControllerBase with Store, ControllerLifeCycle {
  final LocalSecureStorage _localStorage = Modular.get<LocalSecureStorage>();

  @override
  void onInit([Map<String, dynamic>? params]) {
    Future.delayed(const Duration(seconds: 2), () {
      AppRoutes.goToLogin();
    });
  }
}
