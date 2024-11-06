// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ComplaintController on ComplaintControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'ComplaintControllerBase.isLoading', context: context);

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

  late final _$fetchComplaintsAsyncAction =
      AsyncAction('ComplaintControllerBase.fetchComplaints', context: context);

  @override
  Future<void> fetchComplaints() {
    return _$fetchComplaintsAsyncAction.run(() => super.fetchComplaints());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
