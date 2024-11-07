// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suspect_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SuspectDetailController on SuspectDetailControllerBase, Store {
  late final _$notesControllerAtom = Atom(
      name: 'SuspectDetailControllerBase.notesController', context: context);

  @override
  TextEditingController get notesController {
    _$notesControllerAtom.reportRead();
    return super.notesController;
  }

  @override
  set notesController(TextEditingController value) {
    _$notesControllerAtom.reportWrite(value, super.notesController, () {
      super.notesController = value;
    });
  }

  late final _$suspectModelAtom =
      Atom(name: 'SuspectDetailControllerBase.suspectModel', context: context);

  @override
  SuspectModel? get suspectModel {
    _$suspectModelAtom.reportRead();
    return super.suspectModel;
  }

  @override
  set suspectModel(SuspectModel? value) {
    _$suspectModelAtom.reportWrite(value, super.suspectModel, () {
      super.suspectModel = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'SuspectDetailControllerBase.isLoading', context: context);

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

  late final _$confirmSuspectAsyncAction = AsyncAction(
      'SuspectDetailControllerBase.confirmSuspect',
      context: context);

  @override
  Future<void> confirmSuspect(int id) {
    return _$confirmSuspectAsyncAction.run(() => super.confirmSuspect(id));
  }

  late final _$deleteSuspectAsyncAction = AsyncAction(
      'SuspectDetailControllerBase.deleteSuspect',
      context: context);

  @override
  Future<void> deleteSuspect(int id) {
    return _$deleteSuspectAsyncAction.run(() => super.deleteSuspect(id));
  }

  late final _$getSuspectAsyncAction =
      AsyncAction('SuspectDetailControllerBase.getSuspect', context: context);

  @override
  Future<void> getSuspect(int id) {
    return _$getSuspectAsyncAction.run(() => super.getSuspect(id));
  }

  @override
  String toString() {
    return '''
notesController: ${notesController},
suspectModel: ${suspectModel},
isLoading: ${isLoading}
    ''';
  }
}
