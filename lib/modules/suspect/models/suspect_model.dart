import '../../../core/core.dart';
import '../../complaint/models/complaint_model.dart';

class SuspectModel {
  int? id;
  String? notes;
  StatusModel? status;
  ProcessInfo? processInfo;
  String? actions;

  SuspectModel(
      {required this.id,
      required this.status,
      this.processInfo,
      required this.notes,
      required this.actions});

  factory SuspectModel.fromJson(Map<String, dynamic> json) {
    return SuspectModel(
        id: json['id'],
        status: json['status'] != null
            ? StatusModel.fromJson(json['status'])
            : null,
        processInfo: json['process_info'] != null
            ? ProcessInfo.fromJson(json['process_info'])
            : null,
        actions: json['actions'],
        notes: json['notes']);
  }
}
