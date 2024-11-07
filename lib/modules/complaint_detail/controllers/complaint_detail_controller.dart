import 'package:biospot/modules/complaint_detail/complaint_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core.dart';
import '../../complaint/controllers/complaint_controller.dart';
import '../../complaint/models/complaint_model.dart';

part 'complaint_detail_controller.g.dart';

class ComplaintDetailController = ComplaintDetailControllerBase
    with _$ComplaintDetailController;

abstract class ComplaintDetailControllerBase with Store, ControllerLifeCycle {
  final ComplaintDetailRepository _complaintDetailRepository;

  ComplaintDetailControllerBase(
      {required ComplaintDetailRepository complaintDetailRepository})
      : _complaintDetailRepository = complaintDetailRepository;

  @override
  void onInit([Map<String, dynamic>? params]) {
    complaint = params?['complaint'];
    super.onInit(params);
  }

  @observable
  TextEditingController notesController = TextEditingController();

  @observable
  ComplaintModel? complaint;

  @observable
  bool isLoading = false;

  @action
  Future<void> confirmComplaint(int id) async {
    isLoading = true;
    _complaintDetailRepository.confirmComplaint(id, notesController.text).then(
      (value) async {
        await Modular.get<ComplaintController>().fetchComplaints();
        await getComplaint(id);
      },
    ).whenComplete(
      () {
        isLoading = false;
      },
    );
  }

  @action
  Future<void> deleteComplaint(int id) async {
    isLoading = true;
    Modular.to.pop();
    _complaintDetailRepository.discardComplaint(id).then(
      (value) async {
        Modular.get<ComplaintController>().fetchComplaints();
        await getComplaint(id);
      },
    ).whenComplete(
      () {
        isLoading = false;
      },
    );
  }

  @action
  Future<void> getComplaint(int id) async {
    isLoading = true;
    _complaintDetailRepository.getComplaint(id).then(
      (value) {
        complaint = value;
      },
    ).whenComplete(
      () {
        isLoading = false;
      },
    );
  }
}
