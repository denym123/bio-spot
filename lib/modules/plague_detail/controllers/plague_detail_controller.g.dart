// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plague_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlagueDetailController on PlagueDetailControllerBase, Store {
  late final _$plagueModelAtom =
      Atom(name: 'PlagueDetailControllerBase.plagueModel', context: context);

  @override
  PlagueModel? get plagueModel {
    _$plagueModelAtom.reportRead();
    return super.plagueModel;
  }

  @override
  set plagueModel(PlagueModel? value) {
    _$plagueModelAtom.reportWrite(value, super.plagueModel, () {
      super.plagueModel = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'PlagueDetailControllerBase.isLoading', context: context);

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

  late final _$confirmPlagueAsyncAction =
      AsyncAction('PlagueDetailControllerBase.confirmPlague', context: context);

  @override
  Future<void> confirmPlague(int id) {
    return _$confirmPlagueAsyncAction.run(() => super.confirmPlague(id));
  }

  late final _$getPlagueAsyncAction =
      AsyncAction('PlagueDetailControllerBase.getPlague', context: context);

  @override
  Future<void> getPlague(int id) {
    return _$getPlagueAsyncAction.run(() => super.getPlague(id));
  }

  @override
  String toString() {
    return '''
plagueModel: ${plagueModel},
isLoading: ${isLoading}
    ''';
  }
}
