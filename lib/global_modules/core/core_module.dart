import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<HttpAdapter>(HttpAdapterImpl.new);
    i.addSingleton<LocalSecureStorage>(LocalSecureStorageImpl.new);
  }
}
