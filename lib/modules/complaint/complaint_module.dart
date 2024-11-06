import 'package:flutter_modular/flutter_modular.dart';
import 'complaint.dart';

 class ComplaintModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(ComplaintController.new);
    i.add(ComplaintRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const ComplaintPage()
    );
  }
}
