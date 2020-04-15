// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endereco_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnderecoStore on _EnderecoStore, Store {
  final _$enderecosAtom = Atom(name: '_EnderecoStore.enderecos');

  @override
  ObservableList<Endereco> get enderecos {
    _$enderecosAtom.context.enforceReadPolicy(_$enderecosAtom);
    _$enderecosAtom.reportObserved();
    return super.enderecos;
  }

  @override
  set enderecos(ObservableList<Endereco> value) {
    _$enderecosAtom.context.conditionallyRunInAction(() {
      super.enderecos = value;
      _$enderecosAtom.reportChanged();
    }, _$enderecosAtom, name: '${_$enderecosAtom.name}_set');
  }

  final _$_EnderecoStoreActionController =
      ActionController(name: '_EnderecoStore');

  @override
  void updateEnderecos(List<Endereco> estados) {
    final _$actionInfo = _$_EnderecoStoreActionController.startAction();
    try {
      return super.updateEnderecos(estados);
    } finally {
      _$_EnderecoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'enderecos: ${enderecos.toString()}';
    return '{$string}';
  }
}
