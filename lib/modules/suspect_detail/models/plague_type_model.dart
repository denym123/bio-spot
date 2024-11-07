class PlagueTypeModel {
  final int id;
  final String name;

  PlagueTypeModel({required this.id, required this.name});

  factory PlagueTypeModel.fromJson(Map<String, dynamic> json) {
    return PlagueTypeModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
