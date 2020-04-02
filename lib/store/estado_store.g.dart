// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estado_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EstadoStore on _EstadoBase, Store {
  final _$estadosAtom = Atom(name: '_EstadoBase.estados');

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

  final _$_EstadoBaseActionController = ActionController(name: '_EstadoBase');

  @override
  void updateEstados(List<Estado> estados) {
    final _$actionInfo = _$_EstadoBaseActionController.startAction();
    try {
      return super.updateEstados(estados);
    } finally {
      _$_EstadoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'estados: ${estados.toString()}';
    return '{$string}';
  }
}

mixin _$EstadoForm on _EstadoForm, Store {
  Computed<dynamic> _$isFormValidoComputed;

  @override
  dynamic get isFormValido =>
      (_$isFormValidoComputed ??= Computed<dynamic>(() => super.isFormValido))
          .value;

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

  final _$_EstadoFormActionController = ActionController(name: '_EstadoForm');

  @override
  void validarNome(String value) {
    final _$actionInfo = _$_EstadoFormActionController.startAction();
    try {
      return super.validarNome(value);
    } finally {
      _$_EstadoFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validarSigla(String value) {
    final _$actionInfo = _$_EstadoFormActionController.startAction();
    try {
      return super.validarSigla(value);
    } finally {
      _$_EstadoFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'nome: ${nome.toString()},sigla: ${sigla.toString()},msgNome: ${msgNome.toString()},msgSigla: ${msgSigla.toString()},isFormValido: ${isFormValido.toString()}';
    return '{$string}';
  }
}
