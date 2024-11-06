import 'package:biospot/modules/complaint/complaint.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core.dart';
import '../models/complaint_model.dart';

part 'complaint_controller.g.dart';

class ComplaintController = ComplaintControllerBase with _$ComplaintController;

abstract class ComplaintControllerBase with Store, ControllerLifeCycle {
  final ComplaintRepository _complaintRepository;

  ComplaintControllerBase({required ComplaintRepository complaintRepository})
      : _complaintRepository = complaintRepository;

  ObservableList<ComplaintModel> complaints = ObservableList<ComplaintModel>();

  @override
  void onInit([Map<String, dynamic>? params]) {
    fetchComplaints();
    super.onInit(params);
  }

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchComplaints() async {
    isLoading = true;
    _complaintRepository.getComplaints().then(
      (value) {
        complaints.clear();
        complaints.addAll(value);
      },
    ).whenComplete(() => isLoading = false);
  }
}
