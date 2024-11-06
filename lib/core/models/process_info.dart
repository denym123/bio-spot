class ProcessInfo {
  int id;
  String description;

  ProcessInfo({required this.id, required this.description});

  factory ProcessInfo.fromJson(Map<String, dynamic> json) {
    return ProcessInfo(id: json['id'], description: json['description']);
  }
}
