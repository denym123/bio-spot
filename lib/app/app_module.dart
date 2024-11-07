import 'package:biospot/modules/new_process/new_process.dart';
import 'package:biospot/modules/plague/plague.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/routes/routes.dart';
import '../global_modules/core/core_module.dart';
import '../modules/complaint/complaint.dart';
import '../modules/complaint_detail/complaint_detail_module.dart';
import '../modules/login/login.dart';
import '../modules/splash/splash.dart';
import '../modules/suspect/suspect.dart';
import '../modules/suspect_detail/suspect_detail.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module(Routes.login,
        module: LoginModule(), transition: TransitionType.rightToLeft);
    r.module(
      Routes.suspect,
      module: SuspectModule(),
    );
    r.module(Routes.complaint, module: ComplaintModule());
    r.module(Routes.complaintDetail, module: ComplaintDetailModule());
    r.module(Routes.suspectDetail, module: SuspectDetailModule());
    r.module(Routes.newResquest, module: NewProcessModule());
    r.module(Routes.plagues, module: PlagueModule());
  }
}
