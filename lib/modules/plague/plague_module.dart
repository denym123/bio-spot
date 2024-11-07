import 'package:flutter_modular/flutter_modular.dart';
import 'plague.dart';

 class PlagueModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(PlagueController.new);
    i.add(PlagueRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const PlaguePage()
    );
  }
}
