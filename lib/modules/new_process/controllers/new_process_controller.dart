import 'package:biospot/core/helpers/geolocator.dart';
import 'package:biospot/modules/complaint/complaint.dart';
import 'package:biospot/modules/new_process/new_process.dart';
import 'package:biospot/modules/suspect/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core.dart';
import '../dtos/new_process_request_dto.dart';

part 'new_process_controller.g.dart';

class NewProcessController = NewProcessControllerBase
    with _$NewProcessController;

abstract class NewProcessControllerBase with Store, ControllerLifeCycle {
  final NewProcessRepository _newProcessRepository;

  NewProcessControllerBase({required NewProcessRepository newProcessRepository})
      : _newProcessRepository = newProcessRepository;
  @override
  void onInit([Map<String, dynamic>? params]) {
    super.onInit(params);
  }

  @observable
  TextEditingController addressController = TextEditingController();

  @observable
  TextEditingController descriptionController = TextEditingController();

  @observable
  MapController mapController = MapController();

  @observable
  LatLng? currentPointer;

  @observable
  bool isLoading = false;

  Future<void> getCurrentPosition(LatLng? parPosition) async {
    isLoading = true;

    LatLng? latLong;

    // Verifica se `parPosition` é nulo; caso seja, busca a posição atual
    if (parPosition != null) {
      latLong = parPosition;
    } else {
      Position position = await Geolocator.getCurrentPosition();
      latLong = LatLng(position.latitude, position.longitude);
    }

    currentPointer = LatLng(latLong.latitude, latLong.longitude);
    mapController.move(currentPointer!, 12);

    String? position =
        await GeolocatorHelper.getCurrentAddress(Position.fromMap({
      "latitude": latLong.latitude,
      "longitude": latLong.longitude,
    }));
    addressController.text = position ?? "";
    isLoading = false;
  }

  @action
  Future<void> sendNewComplaintProcess() async {
    isLoading = true;
    NewProcessRequestDto request = NewProcessRequestDto(
      latLng:
          "${currentPointer!.latitude.toString()},${currentPointer!.longitude.toString()}",
      address: addressController.text,
      description: descriptionController.text,
    );
    await _newProcessRepository.sendNewComplaintProcess(request).then(
      (_) {
        // Modular.get<SuspectController>().fetchSuspects();
        Modular.to.pop();
      },
    );
    isLoading = false;
  }

  @action
  Future<void> sendNewSuspectProcess() async {
    isLoading = true;
    NewProcessRequestDto request = NewProcessRequestDto(
      latLng:
          "${currentPointer!.latitude.toString()},${currentPointer!.longitude.toString()}",
      address: addressController.text,
      description: descriptionController.text,
    );
    await _newProcessRepository.sendNewSuspectProcess(request).then(
      (_) {
        Modular.get<SuspectController>().fetchSuspects();
        Modular.to.pop();
      },
    );
    isLoading = false;
  }
}
