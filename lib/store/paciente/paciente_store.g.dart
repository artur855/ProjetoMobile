// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PacienteStore on _PacienteStore, Store {
  final _$pacientesAtom = Atom(name: '_PacienteStore.pacientes');

  @override
  ObservableList<Paciente> get pacientes {
    _$pacientesAtom.context.enforceReadPolicy(_$pacientesAtom);
    _$pacientesAtom.reportObserved();
    return super.pacientes;
  }

  @override
  set pacientes(ObservableList<Paciente> value) {
    _$pacientesAtom.context.conditionallyRunInAction(() {
      super.pacientes = value;
      _$pacientesAtom.reportChanged();
    }, _$pacientesAtom, name: '${_$pacientesAtom.name}_set');
  }

  final _$_PacienteStoreActionController =
      ActionController(name: '_PacienteStore');

  @override
  void updatePacientes(List<Paciente> pacientes) {
    final _$actionInfo = _$_PacienteStoreActionController.startAction();
    try {
      return super.updatePacientes(pacientes);
    } finally {
      _$_PacienteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'pacientes: ${pacientes.toString()}';
    return '{$string}';
  }
}
