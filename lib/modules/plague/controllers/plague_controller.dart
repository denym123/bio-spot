import 'package:biospot/modules/plague/models/plague_model.dart';
import 'package:biospot/modules/suspect/models/suspect_model.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core.dart';
import '../repositories/repositories.dart';

part 'plague_controller.g.dart';

class PlagueController = PlagueControllerBase with _$PlagueController;

abstract class PlagueControllerBase with Store, ControllerLifeCycle {
  final PlagueRepository _plagueRepository;

  PlagueControllerBase({required PlagueRepository plagueRepository})
      : _plagueRepository = plagueRepository;

  ObservableList<PlagueModel> plagues = ObservableList<PlagueModel>();
  @override
  void onInit([Map<String, dynamic>? params]) {
    fetchPlagues();
  }

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchPlagues() async {
    isLoading = true;
    _plagueRepository.fetchPlagues().then(
      (value) {
        plagues.clear();
        plagues.addAll(value);
      },
    ).whenComplete(() => isLoading = false);
  }
}
