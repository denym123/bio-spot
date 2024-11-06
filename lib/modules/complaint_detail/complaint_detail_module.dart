import 'package:flutter_modular/flutter_modular.dart';
import 'complaint_detail.dart';

class ComplaintDetailModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(ComplaintDetailController.new);
    i.add(ComplaintDetailRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => ComplaintDetailPage(
        complaint: r.args.data,
      ),
    );
  }
}
