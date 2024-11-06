import 'package:biospot/core/helpers/geolocator.dart';
import 'package:biospot/core/widgets/default_input_field.dart';
import 'package:biospot/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/core.dart';
import 'new_process.dart';

class NewProcessPage extends StatefulWidget {
  const NewProcessPage({super.key});

  @override
  State<NewProcessPage> createState() => _NewProcessPageState();
}

class _NewProcessPageState
    extends PageLifeCycleState<NewProcessController, NewProcessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalhamento da denúncia',
          style: context.textStyles.semiBold16.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Localização',
                style: context.textStyles.semiBold16.copyWith(),
              ),
              SizedBox(height: 16.w),
              Observer(builder: (context) {
                controller.currentPointer;
                return SizedBox(
                  height: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: FlutterMap(
                      options: MapOptions(
                        onTap: (tapPosition, point) {
                          controller.currentPointer = point;
                          controller.getCurrentPosition(point);
                        },
                        initialZoom: 6.2,
                        initialCenter: const LatLng(2.8195874, -60.6757031),
                      ),
                      mapController: controller.mapController,
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        ),
                        MarkerLayer(markers: [
                          if (controller.currentPointer != null) ...{
                            Marker(
                              point: controller.currentPointer ??
                                  const LatLng(2.8195874, -60.6757031),
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
                            )
                          }
                        ]),
                      ],
                    ),
                  ),
                );
              }),
              Observer(builder: (context) {
                return Text(
                    "${controller.currentPointer?.latitude ?? ""} ${controller.currentPointer?.longitude ?? ""}");
              }),
              SizedBox(height: 16.w),
              DefaultInputField(
                label: "Endereço",
                controller: controller.addressController,
                prefixIcon: IconButton(
                    onPressed: () async {
                      await GeolocatorHelper.checkLocationPermission();
                      controller.getCurrentPosition(null);
                    },
                    icon: const Icon(Icons.location_searching_rounded)),
              ),
              SizedBox(height: 16.w),
              DefaultInputField(
                label: "Descrição",
                controller: controller.descriptionController,
                multiArea: true,
              ),
              SizedBox(height: 32.w),
              PrimaryButton(
                  label: "Confirmar",
                  isLoading: controller.isLoading,
                  onPressed: () {
                    if (Modular.to.navigateHistory.any(
                      (element) {
                        return element.name.contains(Routes.complaint);
                      },
                    )) {
                      controller.sendNewComplaintProcess();
                    }

                    if (Modular.to.navigateHistory.any(
                      (element) {
                        return element.name.contains(Routes.suspect);
                      },
                    )) {
                      controller.sendNewSuspectProcess();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
