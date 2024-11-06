import 'package:flutter_modular/flutter_modular.dart';
import 'new_process.dart';

 class NewProcessModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(NewProcessController.new);
    i.add(NewProcessRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const NewProcessPage()
    );
  }
}
