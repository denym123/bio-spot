import '../../../core/core.dart';

class ComplaintModel {
  int id;
  String startedAt;
  String finishedAt;
  StatusModel? status;
  ProcessInfo? processInfo;
  String actions;

  ComplaintModel(
      {required this.id,
      required this.startedAt,
      required this.finishedAt,
      required this.status,
      this.processInfo,
      required this.actions});

  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel(
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
//{
//    "id": 1,
//    "started_at": "06-11-2024",
//    "finished_at": "06-11-2024",
//    "status": {
//        "name": "Em andamento",
//        "color": "#6b7280"
//    },
//    "process_info": {
//        "id": 1,
//        "description": "Processo de teste"
//    },
//    "actions": "observer"
//}
