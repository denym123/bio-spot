// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_process_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewProcessController on NewProcessControllerBase, Store {
  late final _$addressControllerAtom = Atom(
      name: 'NewProcessControllerBase.addressController', context: context);

  @override
  TextEditingController get addressController {
    _$addressControllerAtom.reportRead();
    return super.addressController;
  }

  @override
  set addressController(TextEditingController value) {
    _$addressControllerAtom.reportWrite(value, super.addressController, () {
      super.addressController = value;
    });
  }

  late final _$descriptionControllerAtom = Atom(
      name: 'NewProcessControllerBase.descriptionController', context: context);

  @override
  TextEditingController get descriptionController {
    _$descriptionControllerAtom.reportRead();
    return super.descriptionController;
  }

  @override
  set descriptionController(TextEditingController value) {
    _$descriptionControllerAtom.reportWrite(value, super.descriptionController,
        () {
      super.descriptionController = value;
    });
  }

  late final _$mapControllerAtom =
      Atom(name: 'NewProcessControllerBase.mapController', context: context);

  @override
  MapController get mapController {
    _$mapControllerAtom.reportRead();
    return super.mapController;
  }

  @override
  set mapController(MapController value) {
    _$mapControllerAtom.reportWrite(value, super.mapController, () {
      super.mapController = value;
    });
  }

  late final _$currentPointerAtom =
      Atom(name: 'NewProcessControllerBase.currentPointer', context: context);

  @override
  LatLng? get currentPointer {
    _$currentPointerAtom.reportRead();
    return super.currentPointer;
  }

  @override
  set currentPointer(LatLng? value) {
    _$currentPointerAtom.reportWrite(value, super.currentPointer, () {
      super.currentPointer = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'NewProcessControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$sendNewComplaintProcessAsyncAction = AsyncAction(
      'NewProcessControllerBase.sendNewComplaintProcess',
      context: context);

  @override
  Future<void> sendNewComplaintProcess() {
    return _$sendNewComplaintProcessAsyncAction
        .run(() => super.sendNewComplaintProcess());
  }

  late final _$sendNewSuspectProcessAsyncAction = AsyncAction(
      'NewProcessControllerBase.sendNewSuspectProcess',
      context: context);

  @override
  Future<void> sendNewSuspectProcess() {
    return _$sendNewSuspectProcessAsyncAction
        .run(() => super.sendNewSuspectProcess());
  }

  @override
  String toString() {
    return '''
addressController: ${addressController},
descriptionController: ${descriptionController},
mapController: ${mapController},
currentPointer: ${currentPointer},
isLoading: ${isLoading}
    ''';
  }
}
