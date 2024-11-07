// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plague_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlagueController on PlagueControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'PlagueControllerBase.isLoading', context: context);

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

  late final _$fetchPlaguesAsyncAction =
      AsyncAction('PlagueControllerBase.fetchPlagues', context: context);

  @override
  Future<void> fetchPlagues() {
    return _$fetchPlaguesAsyncAction.run(() => super.fetchPlagues());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
