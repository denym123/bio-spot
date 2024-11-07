import 'package:biospot/modules/complaint/models/complaint_model.dart';
import 'package:biospot/modules/plague/models/plague_model.dart';
import 'package:biospot/modules/suspect/models/suspect_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'routes.dart';

class AppRoutes {
  AppRoutes._();

  static goToLogin() {
    Modular.to.navigate(Routes.login);
  }

  static goToSuspect() {
    Modular.to.navigate(Routes.suspect);
  }

  static goToComplaint() {
    Modular.to.navigate(Routes.complaint);
  }

  static goToComplaintDetail(ComplaintModel complaint) {
    Modular.to.pushNamed(Routes.complaintDetail, arguments: complaint);
  }

  static goToSuspectDetail(SuspectModel suspect) {
    Modular.to.pushNamed(Routes.suspectDetail, arguments: suspect);
  }

  static goToNewProcess() {
    Modular.to.pushNamed(Routes.newResquest);
  }

  static goToPlagues() {
    Modular.to.navigate(Routes.plagues);
  }

  static goToPlagueDetail(PlagueModel plagueModel) {
    Modular.to.pushNamed(Routes.plagueDetail, arguments: plagueModel);
  }
}
