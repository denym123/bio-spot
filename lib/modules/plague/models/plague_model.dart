import '../../../core/core.dart';
import '../../complaint/models/complaint_model.dart';

class PlagueModel {
  int? id;
  String? name;
  String? description;
  StatusModel? status;
  String? actions;
  bool? isPublic;

  //"id" -> 2
  //"name" -> "Cancro Cítrico"
  //"description" -> "b"
  //"status" -> [_Map]
  //"is_public" -> true
  //"actions" -> "executor"

  PlagueModel(
      {required this.id,
      required this.status,
      required this.name,
      required this.description,
      required this.isPublic,
      required this.actions});

  factory PlagueModel.fromJson(Map<String, dynamic> json) {
    return PlagueModel(
        id: json['id'],
        status: json['status'] != null
            ? StatusModel.fromJson(json['status'])
            : null,
        name: json['name'],
        description: json['description'],
        actions: json['actions'],
        isPublic: json['is_public']);
  }
}
