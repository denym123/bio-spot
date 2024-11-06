import '../../../core/core.dart';

class SuspectModel {
  int id;
  String startedAt;
  String finishedAt;
  StatusModel? status;
  ProcessInfo? processInfo;
  String actions;

  SuspectModel(
      {required this.id,
      required this.startedAt,
      required this.finishedAt,
      required this.status,
      this.processInfo,
      required this.actions});

  factory SuspectModel.fromJson(Map<String, dynamic> json) {
    return SuspectModel(
        id: json['id'],
        startedAt: json['started_at'],
        finishedAt: json['finished_at'],
        status: json['status'] != null
            ? StatusModel.fromJson(json['status'])
            : null,
        processInfo: json['process_info'] != null
            ? ProcessInfo.fromJson(json['process_info'])
            : null,
        actions: json['actions']);
  }
}
