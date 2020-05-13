// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConsultaStore on _ConsultaStore, Store {
  final _$consultasAtom = Atom(name: '_ConsultaStore.consultas');

  @override
  ObservableList<Consulta> get consultas {
    _$consultasAtom.context.enforceReadPolicy(_$consultasAtom);
    _$consultasAtom.reportObserved();
    return super.consultas;
  }

  @override
  set consultas(ObservableList<Consulta> value) {
    _$consultasAtom.context.conditionallyRunInAction(() {
      super.consultas = value;
      _$consultasAtom.reportChanged();
    }, _$consultasAtom, name: '${_$consultasAtom.name}_set');
  }

  final _$_ConsultaStoreActionController =
      ActionController(name: '_ConsultaStore');

  @override
  void atualizarConsultas(List<Consulta> consultas) {
    final _$actionInfo = _$_ConsultaStoreActionController.startAction();
    try {
      return super.atualizarConsultas(consultas);
    } finally {
      _$_ConsultaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'consultas: ${consultas.toString()}';
    return '{$string}';
  }
}
