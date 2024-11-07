import '../../../core/core.dart';
import '../../complaint/models/complaint_model.dart';

class PlagueModel {
  int? id;
  StatusModel? status;
  ProcessInfo? processInfo;
  String? actions;
  bool? isPublic;

  PlagueModel(
      {required this.id,
      required this.status,
      this.processInfo,
      required this.isPublic,
      required this.actions});

  factory PlagueModel.fromJson(Map<String, dynamic> json) {
    return PlagueModel(
        id: json['id'],
        status: json['status'] != null
            ? StatusModel.fromJson(json['status'])
            : null,
        processInfo: json['process_info'] != null
            ? ProcessInfo.fromJson(json['process_info'])
            : null,
        actions: json['actions'],
        isPublic: json['is_public']);
  }
}
