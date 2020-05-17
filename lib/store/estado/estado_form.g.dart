// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estado_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EstadoForm on _EstadoForm, Store {
  final _$nomeAtom = Atom(name: '_EstadoForm.nome');

  @override
  String get nome {
    _$nomeAtom.context.enforceReadPolicy(_$nomeAtom);
    _$nomeAtom.reportObserved();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.context.conditionallyRunInAction(() {
      super.nome = value;
      _$nomeAtom.reportChanged();
    }, _$nomeAtom, name: '${_$nomeAtom.name}_set');
  }

  final _$siglaAtom = Atom(name: '_EstadoForm.sigla');

  @override
  String get sigla {
    _$siglaAtom.context.enforceReadPolicy(_$siglaAtom);
    _$siglaAtom.reportObserved();
    return super.sigla;
  }

  @override
  set sigla(String value) {
    _$siglaAtom.context.conditionallyRunInAction(() {
      super.sigla = value;
      _$siglaAtom.reportChanged();
    }, _$siglaAtom, name: '${_$siglaAtom.name}_set');
  }

  final _$msgNomeAtom = Atom(name: '_EstadoForm.msgNome');

  @override
  String get msgNome {
    _$msgNomeAtom.context.enforceReadPolicy(_$msgNomeAtom);
    _$msgNomeAtom.reportObserved();
    return super.msgNome;
  }

  @override
  set msgNome(String value) {
    _$msgNomeAtom.context.conditionallyRunInAction(() {
      super.msgNome = value;
      _$msgNomeAtom.reportChanged();
    }, _$msgNomeAtom, name: '${_$msgNomeAtom.name}_set');
  }

  final _$msgSiglaAtom = Atom(name: '_EstadoForm.msgSigla');

  @override
  String get msgSigla {
    _$msgSiglaAtom.context.enforceReadPolicy(_$msgSiglaAtom);
    _$msgSiglaAtom.reportObserved();
    return super.msgSigla;
  }

  @override
  set msgSigla(String value) {
    _$msgSiglaAtom.context.conditionallyRunInAction(() {
      super.msgSigla = value;
      _$msgSiglaAtom.reportChanged();
    }, _$msgSiglaAtom, name: '${_$msgSiglaAtom.name}_set');
  }

  final _$nomeControllerAtom = Atom(name: '_EstadoForm.nomeController');

  @override
  TextEditingController get nomeController {
    _$nomeControllerAtom.context.enforceReadPolicy(_$nomeControllerAtom);
    _$nomeControllerAtom.reportObserved();
    return super.nomeController;
  }

  @override
  set nomeController(TextEditingController value) {
    _$nomeControllerAtom.context.conditionallyRunInAction(() {
      super.nomeController = value;
      _$nomeControllerAtom.reportChanged();
    }, _$nomeControllerAtom, name: '${_$nomeControllerAtom.name}_set');
  }

  final _$siglaControllerAtom = Atom(name: '_EstadoForm.siglaController');

  @override
  TextEditingController get siglaController {
    _$siglaControllerAtom.context.enforceReadPolicy(_$siglaControllerAtom);
    _$siglaControllerAtom.reportObserved();
    return super.siglaController;
  }

  @override
  set siglaController(TextEditingController value) {
    _$siglaControllerAtom.context.conditionallyRunInAction(() {
      super.siglaController = value;
      _$siglaControllerAtom.reportChanged();
    }, _$siglaControllerAtom, name: '${_$siglaControllerAtom.name}_set');
  }

  final _$_EstadoFormActionController = ActionController(name: '_EstadoForm');

  @override
  bool validarNome(String value) {
    final _$actionInfo = _$_EstadoFormActionController.startAction();
    try {
      return super.validarNome(value);
    } finally {
      _$_EstadoFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarSigla(String value) {
    final _$actionInfo = _$_EstadoFormActionController.startAction();
    try {
      return super.validarSigla(value);
    } finally {
      _$_EstadoFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearControllers() {
    final _$actionInfo = _$_EstadoFormActionController.startAction();
    try {
      return super.clearControllers();
    } finally {
      _$_EstadoFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'nome: ${nome.toString()},sigla: ${sigla.toString()},msgNome: ${msgNome.toString()},msgSigla: ${msgSigla.toString()},nomeController: ${nomeController.toString()},siglaController: ${siglaController.toString()}';
    return '{$string}';
  }
}
