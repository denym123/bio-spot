import 'package:biospot/modules/suspect/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core.dart';
import '../../suspect/models/suspect_model.dart';
import '../repositories/repositories.dart';

part 'suspect_detail_controller.g.dart';

class SuspectDetailController = SuspectDetailControllerBase
    with _$SuspectDetailController;

abstract class SuspectDetailControllerBase with Store, ControllerLifeCycle {
  final SuspectDetailRepository _suspectDetailRepository;

  SuspectDetailControllerBase(
      {required SuspectDetailRepository suspectDetailRepository})
      : _suspectDetailRepository = suspectDetailRepository;

  @override
  void onInit([Map<String, dynamic>? params]) {
    suspectModel = params?['suspect'];
    super.onInit(params);
  }

  @observable
  TextEditingController notesController = TextEditingController();

  @observable
  SuspectModel? suspectModel;

  @observable
  bool isLoading = false;

  @action
  Future<void> confirmSuspect(int id) async {
    isLoading = true;
    _suspectDetailRepository.confirmSuspect(notesController.text, id).then(
      (value) {
        Modular.get<SuspectController>().fetchSuspects();
      },
    ).whenComplete(
      () {
        isLoading = false;
      },
    );
  }

  @action
  Future<void> deleteSuspect(int id) async {
    isLoading = true;
    Modular.to.pop();
    _suspectDetailRepository.discardSuspect(id).then(
      (value) async {
        await getSuspect(id);
        Modular.get<SuspectController>().fetchSuspects();
      },
    ).whenComplete(
      () {
        isLoading = false;
      },
    );
  }

  @action
  Future<void> getSuspect(int id) async {
    isLoading = true;
    _suspectDetailRepository.getSuspect(id).then(
      (value) {
        suspectModel = value;
      },
    ).whenComplete(
      () {
        isLoading = false;
      },
    );
  }
}
