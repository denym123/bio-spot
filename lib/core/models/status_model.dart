class StatusModel {
  String name;
  String color;

  StatusModel({required this.name, required this.color});

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
        name: json['name'],
        color: json['color'].toString().replaceAll('"', ''));
  }
}
