// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ComplaintDetailController on ComplaintDetailControllerBase, Store {
  late final _$notesControllerAtom = Atom(
      name: 'ComplaintDetailControllerBase.notesController', context: context);

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

  late final _$complaintAtom =
      Atom(name: 'ComplaintDetailControllerBase.complaint', context: context);

  @override
  ComplaintModel? get complaint {
    _$complaintAtom.reportRead();
    return super.complaint;
  }

  @override
  set complaint(ComplaintModel? value) {
    _$complaintAtom.reportWrite(value, super.complaint, () {
      super.complaint = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'ComplaintDetailControllerBase.isLoading', context: context);

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

  late final _$confirmComplaintAsyncAction = AsyncAction(
      'ComplaintDetailControllerBase.confirmComplaint',
      context: context);

  @override
  Future<void> confirmComplaint(int id) {
    return _$confirmComplaintAsyncAction.run(() => super.confirmComplaint(id));
  }

  late final _$deleteComplaintAsyncAction = AsyncAction(
      'ComplaintDetailControllerBase.deleteComplaint',
      context: context);

  @override
  Future<void> deleteComplaint(int id) {
    return _$deleteComplaintAsyncAction.run(() => super.deleteComplaint(id));
  }

  late final _$getComplaintAsyncAction = AsyncAction(
      'ComplaintDetailControllerBase.getComplaint',
      context: context);

  @override
  Future<void> getComplaint(int id) {
    return _$getComplaintAsyncAction.run(() => super.getComplaint(id));
  }

  @override
  String toString() {
    return '''
notesController: ${notesController},
complaint: ${complaint},
isLoading: ${isLoading}
    ''';
  }
}
