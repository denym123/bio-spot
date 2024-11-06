import 'package:biospot/modules/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core.dart';
import '../../../core/routes/app_routes.dart';
import '../dtos/login_request_dto.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store, ControllerLifeCycle {
  final LoginRepository _loginRepository;
  final LocalSecureStorage _localSecureStorage =
      Modular.get<LocalSecureStorage>();

  LoginControllerBase({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;

  @observable
  TextEditingController usernameController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  bool isLoading = false;

  @action
  Future<void> login() async {
    await _loginRepository
        .login(
      LoginRequestDto(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
      ),
    )
        .then(
      (value) async {
        await _localSecureStorage.write(
            LocalSecureStorageConstants.ACCESS_TOKEN, value.token);
        AppRoutes.goToSuspect();
      },
    ).catchError((e) {
      _localSecureStorage.clear();
    });
  }
}
