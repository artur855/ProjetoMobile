// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConsultaForm on _ConsultaForm, Store {
  Computed<String> _$dataStrComputed;

  @override
  String get dataStr =>
      (_$dataStrComputed ??= Computed<String>(() => super.dataStr)).value;

  final _$dataAtom = Atom(name: '_ConsultaForm.data');

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

  final _$pacienteAtom = Atom(name: '_ConsultaForm.paciente');

  @override
  Paciente get paciente {
    _$pacienteAtom.context.enforceReadPolicy(_$pacienteAtom);
    _$pacienteAtom.reportObserved();
    return super.paciente;
  }

  @override
  set paciente(Paciente value) {
    _$pacienteAtom.context.conditionallyRunInAction(() {
      super.paciente = value;
      _$pacienteAtom.reportChanged();
    }, _$pacienteAtom, name: '${_$pacienteAtom.name}_set');
  }

  final _$medicoAtom = Atom(name: '_ConsultaForm.medico');

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

  final _$coberturaAtom = Atom(name: '_ConsultaForm.cobertura');

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

  final _$msgDataAtom = Atom(name: '_ConsultaForm.msgData');

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

  final _$msgPacienteAtom = Atom(name: '_ConsultaForm.msgPaciente');

  @override
  String get msgPaciente {
    _$msgPacienteAtom.context.enforceReadPolicy(_$msgPacienteAtom);
    _$msgPacienteAtom.reportObserved();
    return super.msgPaciente;
  }

  @override
  set msgPaciente(String value) {
    _$msgPacienteAtom.context.conditionallyRunInAction(() {
      super.msgPaciente = value;
      _$msgPacienteAtom.reportChanged();
    }, _$msgPacienteAtom, name: '${_$msgPacienteAtom.name}_set');
  }

  final _$msgMedicoAtom = Atom(name: '_ConsultaForm.msgMedico');

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

  final _$msgCoberturaAtom = Atom(name: '_ConsultaForm.msgCobertura');

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

  final _$_ConsultaFormActionController =
      ActionController(name: '_ConsultaForm');

  @override
  bool validarData(DateTime value) {
    final _$actionInfo = _$_ConsultaFormActionController.startAction();
    try {
      return super.validarData(value);
    } finally {
      _$_ConsultaFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarPaciente(Paciente value) {
    final _$actionInfo = _$_ConsultaFormActionController.startAction();
    try {
      return super.validarPaciente(value);
    } finally {
      _$_ConsultaFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarMedico(Medico value) {
    final _$actionInfo = _$_ConsultaFormActionController.startAction();
    try {
      return super.validarMedico(value);
    } finally {
      _$_ConsultaFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarCobertura(Cobertura value) {
    final _$actionInfo = _$_ConsultaFormActionController.startAction();
    try {
      return super.validarCobertura(value);
    } finally {
      _$_ConsultaFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'data: ${data.toString()},paciente: ${paciente.toString()},medico: ${medico.toString()},cobertura: ${cobertura.toString()},msgData: ${msgData.toString()},msgPaciente: ${msgPaciente.toString()},msgMedico: ${msgMedico.toString()},msgCobertura: ${msgCobertura.toString()},dataStr: ${dataStr.toString()}';
    return '{$string}';
  }
}
