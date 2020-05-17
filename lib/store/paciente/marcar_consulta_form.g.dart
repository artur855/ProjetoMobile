// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marcar_consulta_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarcarConsultaForm on _MarcarConsultaForm, Store {
  Computed<String> _$dataStrComputed;

  @override
  String get dataStr =>
      (_$dataStrComputed ??= Computed<String>(() => super.dataStr)).value;

  final _$dataAtom = Atom(name: '_MarcarConsultaForm.data');

  @override
  DateTime get data {
    _$dataAtom.context.enforceReadPolicy(_$dataAtom);
    _$dataAtom.reportObserved();
    return super.data;
  }

  @override
  set data(DateTime value) {
    _$dataAtom.context.conditionallyRunInAction(() {
      super.data = value;
      _$dataAtom.reportChanged();
    }, _$dataAtom, name: '${_$dataAtom.name}_set');
  }

  final _$medicoAtom = Atom(name: '_MarcarConsultaForm.medico');

  @override
  Medico get medico {
    _$medicoAtom.context.enforceReadPolicy(_$medicoAtom);
    _$medicoAtom.reportObserved();
    return super.medico;
  }

  @override
  set medico(Medico value) {
    _$medicoAtom.context.conditionallyRunInAction(() {
      super.medico = value;
      _$medicoAtom.reportChanged();
    }, _$medicoAtom, name: '${_$medicoAtom.name}_set');
  }

  final _$coberturaAtom = Atom(name: '_MarcarConsultaForm.cobertura');

  @override
  Cobertura get cobertura {
    _$coberturaAtom.context.enforceReadPolicy(_$coberturaAtom);
    _$coberturaAtom.reportObserved();
    return super.cobertura;
  }

  @override
  set cobertura(Cobertura value) {
    _$coberturaAtom.context.conditionallyRunInAction(() {
      super.cobertura = value;
      _$coberturaAtom.reportChanged();
    }, _$coberturaAtom, name: '${_$coberturaAtom.name}_set');
  }

  final _$msgDataAtom = Atom(name: '_MarcarConsultaForm.msgData');

  @override
  String get msgData {
    _$msgDataAtom.context.enforceReadPolicy(_$msgDataAtom);
    _$msgDataAtom.reportObserved();
    return super.msgData;
  }

  @override
  set msgData(String value) {
    _$msgDataAtom.context.conditionallyRunInAction(() {
      super.msgData = value;
      _$msgDataAtom.reportChanged();
    }, _$msgDataAtom, name: '${_$msgDataAtom.name}_set');
  }

  final _$msgEspecialidadeAtom =
      Atom(name: '_MarcarConsultaForm.msgEspecialidade');

  @override
  String get msgEspecialidade {
    _$msgEspecialidadeAtom.context.enforceReadPolicy(_$msgEspecialidadeAtom);
    _$msgEspecialidadeAtom.reportObserved();
    return super.msgEspecialidade;
  }

  @override
  set msgEspecialidade(String value) {
    _$msgEspecialidadeAtom.context.conditionallyRunInAction(() {
      super.msgEspecialidade = value;
      _$msgEspecialidadeAtom.reportChanged();
    }, _$msgEspecialidadeAtom, name: '${_$msgEspecialidadeAtom.name}_set');
  }

  final _$msgMedicoAtom = Atom(name: '_MarcarConsultaForm.msgMedico');

  @override
  String get msgMedico {
    _$msgMedicoAtom.context.enforceReadPolicy(_$msgMedicoAtom);
    _$msgMedicoAtom.reportObserved();
    return super.msgMedico;
  }

  @override
  set msgMedico(String value) {
    _$msgMedicoAtom.context.conditionallyRunInAction(() {
      super.msgMedico = value;
      _$msgMedicoAtom.reportChanged();
    }, _$msgMedicoAtom, name: '${_$msgMedicoAtom.name}_set');
  }

  final _$msgCoberturaAtom = Atom(name: '_MarcarConsultaForm.msgCobertura');

  @override
  String get msgCobertura {
    _$msgCoberturaAtom.context.enforceReadPolicy(_$msgCoberturaAtom);
    _$msgCoberturaAtom.reportObserved();
    return super.msgCobertura;
  }

  @override
  set msgCobertura(String value) {
    _$msgCoberturaAtom.context.conditionallyRunInAction(() {
      super.msgCobertura = value;
      _$msgCoberturaAtom.reportChanged();
    }, _$msgCoberturaAtom, name: '${_$msgCoberturaAtom.name}_set');
  }

  final _$_MarcarConsultaFormActionController =
      ActionController(name: '_MarcarConsultaForm');

  @override
  bool validarData(DateTime value) {
    final _$actionInfo = _$_MarcarConsultaFormActionController.startAction();
    try {
      return super.validarData(value);
    } finally {
      _$_MarcarConsultaFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarMedico(Medico value) {
    final _$actionInfo = _$_MarcarConsultaFormActionController.startAction();
    try {
      return super.validarMedico(value);
    } finally {
      _$_MarcarConsultaFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarCobertura(Cobertura value) {
    final _$actionInfo = _$_MarcarConsultaFormActionController.startAction();
    try {
      return super.validarCobertura(value);
    } finally {
      _$_MarcarConsultaFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'data: ${data.toString()},medico: ${medico.toString()},cobertura: ${cobertura.toString()},msgData: ${msgData.toString()},msgEspecialidade: ${msgEspecialidade.toString()},msgMedico: ${msgMedico.toString()},msgCobertura: ${msgCobertura.toString()},dataStr: ${dataStr.toString()}';
    return '{$string}';
  }
}
