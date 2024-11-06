class NewProcessRequestDto {
  final String latLng;
  final String address;
  final String description;

  NewProcessRequestDto({
    required this.latLng,
    required this.address,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      "address": {
        "coordinates": latLng,
        "full_address": address,
      },
      "description": description,
    };
  }
}
