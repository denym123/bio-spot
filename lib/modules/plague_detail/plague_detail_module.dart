import 'package:flutter_modular/flutter_modular.dart';
import 'plague_detail.dart';

class PlagueDetailModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(PlagueDetailController.new);
    i.add(PlagueDetailRepository.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (context) => PlagueDetailPage(
              plagueModel: r.args.data,
            ));
  }
}
