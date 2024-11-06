import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorHelper {
  static Future<Map<String, dynamic>?> checkLocationPermission() async {
    var status = await Geolocator.checkPermission();
    if (status != LocationPermission.denied ||
        status != LocationPermission.deniedForever ||
        status != LocationPermission.unableToDetermine) {
      status = await Geolocator.requestPermission();
    }
  }

  static Future<String?> getCurrentAddress(Position? position) async {
    // Usa a posição passada como parâmetro, se não for nula; caso contrário, obtém a posição atual
    Position currentPosition = position ??
        await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );

    // Obtém o endereço com base nas coordenadas da posição
    var address = await placemarkFromCoordinates(
      currentPosition.latitude,
      currentPosition.longitude,
    );

    // Obtém o nome do sublocalidade (bairro), se disponível
    String? neighborhoodLabel = address
        .firstWhere(
          (element) => element.subLocality != null,
          orElse: () => address.first,
        )
        .subLocality;

    // Usa o código postal se o bairro estiver vazio
    if (neighborhoodLabel == null || neighborhoodLabel.isEmpty) {
      neighborhoodLabel = address.first.postalCode;
    }

    // Retorna o endereço formatado
    return '${address.first.thoroughfare}, ${address.first.locality}, ${address.first.administrativeArea}, ${address.first.postalCode}';
  }
}
