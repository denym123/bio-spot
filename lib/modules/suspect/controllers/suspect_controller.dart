import 'package:biospot/modules/suspect/models/suspect_model.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core.dart';
import '../repositories/repositories.dart';

part 'suspect_controller.g.dart';

class SuspectController = SuspectControllerBase with _$SuspectController;

abstract class SuspectControllerBase with Store, ControllerLifeCycle {
  final SuspectRepository _suspectRepository;

  SuspectControllerBase({required SuspectRepository suspectRepository})
      : _suspectRepository = suspectRepository;

  ObservableList<SuspectModel> suspects = ObservableList<SuspectModel>();

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchSuspects() async {
    isLoading = true;
    _suspectRepository.fetchSuspects().then(
      (value) {
        suspects.clear();
        suspects.addAll(value);
      },
    ).whenComplete(() => isLoading = false);
  }
}
