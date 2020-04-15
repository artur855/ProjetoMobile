// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endereco_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnderecoForm on _EnderecoForm, Store {
  final _$cidadeAtom = Atom(name: '_EnderecoForm.cidade');

  @override
  String get cidade {
    _$cidadeAtom.context.enforceReadPolicy(_$cidadeAtom);
    _$cidadeAtom.reportObserved();
    return super.cidade;
  }

  @override
  set cidade(String value) {
    _$cidadeAtom.context.conditionallyRunInAction(() {
      super.cidade = value;
      _$cidadeAtom.reportChanged();
    }, _$cidadeAtom, name: '${_$cidadeAtom.name}_set');
  }

  final _$logradouroAtom = Atom(name: '_EnderecoForm.logradouro');

  @override
  String get logradouro {
    _$logradouroAtom.context.enforceReadPolicy(_$logradouroAtom);
    _$logradouroAtom.reportObserved();
    return super.logradouro;
  }

  @override
  set logradouro(String value) {
    _$logradouroAtom.context.conditionallyRunInAction(() {
      super.logradouro = value;
      _$logradouroAtom.reportChanged();
    }, _$logradouroAtom, name: '${_$logradouroAtom.name}_set');
  }

  final _$cepAtom = Atom(name: '_EnderecoForm.cep');

  @override
  String get cep {
    _$cepAtom.context.enforceReadPolicy(_$cepAtom);
    _$cepAtom.reportObserved();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.context.conditionallyRunInAction(() {
      super.cep = value;
      _$cepAtom.reportChanged();
    }, _$cepAtom, name: '${_$cepAtom.name}_set');
  }

  final _$estadoAtom = Atom(name: '_EnderecoForm.estado');

  @override
  Estado get estado {
    _$estadoAtom.context.enforceReadPolicy(_$estadoAtom);
    _$estadoAtom.reportObserved();
    return super.estado;
  }

  @override
  set estado(Estado value) {
    _$estadoAtom.context.conditionallyRunInAction(() {
      super.estado = value;
      _$estadoAtom.reportChanged();
    }, _$estadoAtom, name: '${_$estadoAtom.name}_set');
  }

  final _$msgCidadeAtom = Atom(name: '_EnderecoForm.msgCidade');

  @override
  String get msgCidade {
    _$msgCidadeAtom.context.enforceReadPolicy(_$msgCidadeAtom);
    _$msgCidadeAtom.reportObserved();
    return super.msgCidade;
  }

  @override
  set msgCidade(String value) {
    _$msgCidadeAtom.context.conditionallyRunInAction(() {
      super.msgCidade = value;
      _$msgCidadeAtom.reportChanged();
    }, _$msgCidadeAtom, name: '${_$msgCidadeAtom.name}_set');
  }

  final _$msgLogradouroAtom = Atom(name: '_EnderecoForm.msgLogradouro');

  @override
  String get msgLogradouro {
    _$msgLogradouroAtom.context.enforceReadPolicy(_$msgLogradouroAtom);
    _$msgLogradouroAtom.reportObserved();
    return super.msgLogradouro;
  }

  @override
  set msgLogradouro(String value) {
    _$msgLogradouroAtom.context.conditionallyRunInAction(() {
      super.msgLogradouro = value;
      _$msgLogradouroAtom.reportChanged();
    }, _$msgLogradouroAtom, name: '${_$msgLogradouroAtom.name}_set');
  }

  final _$msgCepAtom = Atom(name: '_EnderecoForm.msgCep');

  @override
  String get msgCep {
    _$msgCepAtom.context.enforceReadPolicy(_$msgCepAtom);
    _$msgCepAtom.reportObserved();
    return super.msgCep;
  }

  @override
  set msgCep(String value) {
    _$msgCepAtom.context.conditionallyRunInAction(() {
      super.msgCep = value;
      _$msgCepAtom.reportChanged();
    }, _$msgCepAtom, name: '${_$msgCepAtom.name}_set');
  }

  final _$msgEstadoAtom = Atom(name: '_EnderecoForm.msgEstado');

  @override
  String get msgEstado {
    _$msgEstadoAtom.context.enforceReadPolicy(_$msgEstadoAtom);
    _$msgEstadoAtom.reportObserved();
    return super.msgEstado;
  }

  @override
  set msgEstado(String value) {
    _$msgEstadoAtom.context.conditionallyRunInAction(() {
      super.msgEstado = value;
      _$msgEstadoAtom.reportChanged();
    }, _$msgEstadoAtom, name: '${_$msgEstadoAtom.name}_set');
  }

  final _$_EnderecoFormActionController =
      ActionController(name: '_EnderecoForm');

  @override
  bool validarCidade(String value) {
    final _$actionInfo = _$_EnderecoFormActionController.startAction();
    try {
      return super.validarCidade(value);
    } finally {
      _$_EnderecoFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarLogradouro(String value) {
    final _$actionInfo = _$_EnderecoFormActionController.startAction();
    try {
      return super.validarLogradouro(value);
    } finally {
      _$_EnderecoFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarCep(String value) {
    final _$actionInfo = _$_EnderecoFormActionController.startAction();
    try {
      return super.validarCep(value);
    } finally {
      _$_EnderecoFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarEstado(Estado value) {
    final _$actionInfo = _$_EnderecoFormActionController.startAction();
    try {
      return super.validarEstado(value);
    } finally {
      _$_EnderecoFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'cidade: ${cidade.toString()},logradouro: ${logradouro.toString()},cep: ${cep.toString()},estado: ${estado.toString()},msgCidade: ${msgCidade.toString()},msgLogradouro: ${msgLogradouro.toString()},msgCep: ${msgCep.toString()},msgEstado: ${msgEstado.toString()}';
    return '{$string}';
  }
}
