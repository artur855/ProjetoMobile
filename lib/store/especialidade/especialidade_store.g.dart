// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'especialidade_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EspecialidadeStore on _EspecialidadeStore, Store {
  final _$especialidadesAtom = Atom(name: '_EspecialidadeStore.especialidades');

  @override
  ObservableList<Especialidade> get especialidades {
    _$especialidadesAtom.context.enforceReadPolicy(_$especialidadesAtom);
    _$especialidadesAtom.reportObserved();
    return super.especialidades;
  }

  @override
  set especialidades(ObservableList<Especialidade> value) {
    _$especialidadesAtom.context.conditionallyRunInAction(() {
      super.especialidades = value;
      _$especialidadesAtom.reportChanged();
    }, _$especialidadesAtom, name: '${_$especialidadesAtom.name}_set');
  }

  final _$_EspecialidadeStoreActionController =
      ActionController(name: '_EspecialidadeStore');

  @override
  void atualizarEspecialidades(List<Especialidade> especialidades) {
    final _$actionInfo = _$_EspecialidadeStoreActionController.startAction();
    try {
      return super.atualizarEspecialidades(especialidades);
    } finally {
      _$_EspecialidadeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'especialidades: ${especialidades.toString()}';
    return '{$string}';
  }
}
