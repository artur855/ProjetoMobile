// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cobertura_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoberturaStore on _CoberturaStore, Store {
  final _$coberturasAtom = Atom(name: '_CoberturaStore.coberturas');

  @override
  ObservableList<Cobertura> get coberturas {
    _$coberturasAtom.context.enforceReadPolicy(_$coberturasAtom);
    _$coberturasAtom.reportObserved();
    return super.coberturas;
  }

  @override
  set coberturas(ObservableList<Cobertura> value) {
    _$coberturasAtom.context.conditionallyRunInAction(() {
      super.coberturas = value;
      _$coberturasAtom.reportChanged();
    }, _$coberturasAtom, name: '${_$coberturasAtom.name}_set');
  }

  final _$_CoberturaStoreActionController =
      ActionController(name: '_CoberturaStore');

  @override
  void atualizarCoberturas(List<Cobertura> coberturas) {
    final _$actionInfo = _$_CoberturaStoreActionController.startAction();
    try {
      return super.atualizarCoberturas(coberturas);
    } finally {
      _$_CoberturaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'coberturas: ${coberturas.toString()}';
    return '{$string}';
  }
}
