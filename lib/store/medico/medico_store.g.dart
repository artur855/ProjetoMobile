// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medico_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MedicoStore on _MedicoStore, Store {
  final _$medicosAtom = Atom(name: '_MedicoStore.medicos');

  @override
  ObservableList<Medico> get medicos {
    _$medicosAtom.context.enforceReadPolicy(_$medicosAtom);
    _$medicosAtom.reportObserved();
    return super.medicos;
  }

  @override
  set medicos(ObservableList<Medico> value) {
    _$medicosAtom.context.conditionallyRunInAction(() {
      super.medicos = value;
      _$medicosAtom.reportChanged();
    }, _$medicosAtom, name: '${_$medicosAtom.name}_set');
  }

  final _$_MedicoStoreActionController = ActionController(name: '_MedicoStore');

  @override
  void updateMedicos(List<Medico> medicos) {
    final _$actionInfo = _$_MedicoStoreActionController.startAction();
    try {
      return super.updateMedicos(medicos);
    } finally {
      _$_MedicoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'medicos: ${medicos.toString()}';
    return '{$string}';
  }
}
