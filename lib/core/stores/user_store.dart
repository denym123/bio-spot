import 'package:biospot/core/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../adapters/adapters.dart';
import '../routes/app_routes.dart';

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  @readonly
  UserModel? _userModel;

  @action
  void setUserModel(UserModel? userModel) {
    _userModel = userModel;
  }

  @action
  void logout() {
    setUserModel(null);
    Modular.get<LocalSecureStorage>().clear();
    AppRoutes.goToLogin();
  }
}
