import 'package:flutter_modular/flutter_modular.dart';
import 'suspect_detail.dart';

class SuspectDetailModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(SuspectDetailController.new);
    i.add(SuspectDetailRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => SuspectDetailPage(
        suspectModel: r.args.data,
      ),
    );
  }
}
