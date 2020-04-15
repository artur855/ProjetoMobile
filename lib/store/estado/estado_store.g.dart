// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estado_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EstadoStore on _EstadoStore, Store {
  final _$estadosAtom = Atom(name: '_EstadoStore.estados');

  @override
  ObservableList<Estado> get estados {
    _$estadosAtom.context.enforceReadPolicy(_$estadosAtom);
    _$estadosAtom.reportObserved();
    return super.estados;
  }

  @override
  set estados(ObservableList<Estado> value) {
    _$estadosAtom.context.conditionallyRunInAction(() {
      super.estados = value;
      _$estadosAtom.reportChanged();
    }, _$estadosAtom, name: '${_$estadosAtom.name}_set');
  }

  final _$_EstadoStoreActionController = ActionController(name: '_EstadoStore');

  @override
  void updateEstados(List<Estado> estados) {
    final _$actionInfo = _$_EstadoStoreActionController.startAction();
    try {
      return super.updateEstados(estados);
    } finally {
      _$_EstadoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'estados: ${estados.toString()}';
    return '{$string}';
  }
}
