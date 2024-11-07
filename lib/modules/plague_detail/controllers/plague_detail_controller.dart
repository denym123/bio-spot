import 'package:biospot/modules/complaint_detail/complaint_detail.dart';
import 'package:biospot/modules/plague/controllers/controllers.dart';
import 'package:biospot/modules/plague/models/plague_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core.dart';
import '../../complaint/controllers/complaint_controller.dart';
import '../../complaint/models/complaint_model.dart';
import '../plague_detail.dart';

part 'plague_detail_controller.g.dart';

class PlagueDetailController = PlagueDetailControllerBase
    with _$PlagueDetailController;

abstract class PlagueDetailControllerBase with Store, ControllerLifeCycle {
  final PlagueDetailRepository _plagueDetailRepository;

  PlagueDetailControllerBase(
      {required PlagueDetailRepository complaintDetailRepository})
      : _plagueDetailRepository = complaintDetailRepository;

  @override
  void onInit([Map<String, dynamic>? params]) {
    plagueModel = params?['plague'];
    super.onInit(params);
  }

  @observable
  PlagueModel? plagueModel;

  @observable
  bool isLoading = false;

  @action
  Future<void> confirmPlague(int id) async {
    isLoading = true;
    await _plagueDetailRepository.confirmPlague(id).then(
      (_) async {
        Modular.get<PlagueController>().fetchPlagues();
        await getPlague(id);
      },
    ).whenComplete(
      () {
        isLoading = false;
      },
    );
  }

  @action
  Future<void> getPlague(int id) async {
    isLoading = true;
    _plagueDetailRepository.getPlague(id).then(
      (value) {
        plagueModel = value;
      },
    ).whenComplete(
      () {
        isLoading = false;
      },
    );
  }
}
