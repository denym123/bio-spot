import 'package:flutter_modular/flutter_modular.dart';
import 'suspect.dart';

 class SuspectModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(SuspectController.new);
    i.add(SuspectRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const SuspectPage()
    );
  }
}
