// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginForm on _LoginForm, Store {
  final _$loginAtom = Atom(name: '_LoginForm.login');

  @override
  String get login {
    _$loginAtom.context.enforceReadPolicy(_$loginAtom);
    _$loginAtom.reportObserved();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.context.conditionallyRunInAction(() {
      super.login = value;
      _$loginAtom.reportChanged();
    }, _$loginAtom, name: '${_$loginAtom.name}_set');
  }

  final _$senhaAtom = Atom(name: '_LoginForm.senha');

  @override
  String get senha {
    _$senhaAtom.context.enforceReadPolicy(_$senhaAtom);
    _$senhaAtom.reportObserved();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.context.conditionallyRunInAction(() {
      super.senha = value;
      _$senhaAtom.reportChanged();
    }, _$senhaAtom, name: '${_$senhaAtom.name}_set');
  }

  final _$radioSelectedAtom = Atom(name: '_LoginForm.radioSelected');

  @override
  int get radioSelected {
    _$radioSelectedAtom.context.enforceReadPolicy(_$radioSelectedAtom);
    _$radioSelectedAtom.reportObserved();
    return super.radioSelected;
  }

  @override
  set radioSelected(int value) {
    _$radioSelectedAtom.context.conditionallyRunInAction(() {
      super.radioSelected = value;
      _$radioSelectedAtom.reportChanged();
    }, _$radioSelectedAtom, name: '${_$radioSelectedAtom.name}_set');
  }

  final _$msgLoginAtom = Atom(name: '_LoginForm.msgLogin');

  @override
  String get msgLogin {
    _$msgLoginAtom.context.enforceReadPolicy(_$msgLoginAtom);
    _$msgLoginAtom.reportObserved();
    return super.msgLogin;
  }

  @override
  set msgLogin(String value) {
    _$msgLoginAtom.context.conditionallyRunInAction(() {
      super.msgLogin = value;
      _$msgLoginAtom.reportChanged();
    }, _$msgLoginAtom, name: '${_$msgLoginAtom.name}_set');
  }

  final _$msgSenhaAtom = Atom(name: '_LoginForm.msgSenha');

  @override
  String get msgSenha {
    _$msgSenhaAtom.context.enforceReadPolicy(_$msgSenhaAtom);
    _$msgSenhaAtom.reportObserved();
    return super.msgSenha;
  }

  @override
  set msgSenha(String value) {
    _$msgSenhaAtom.context.conditionallyRunInAction(() {
      super.msgSenha = value;
      _$msgSenhaAtom.reportChanged();
    }, _$msgSenhaAtom, name: '${_$msgSenhaAtom.name}_set');
  }

  final _$msgRadioAtom = Atom(name: '_LoginForm.msgRadio');

  @override
  String get msgRadio {
    _$msgRadioAtom.context.enforceReadPolicy(_$msgRadioAtom);
    _$msgRadioAtom.reportObserved();
    return super.msgRadio;
  }

  @override
  set msgRadio(String value) {
    _$msgRadioAtom.context.conditionallyRunInAction(() {
      super.msgRadio = value;
      _$msgRadioAtom.reportChanged();
    }, _$msgRadioAtom, name: '${_$msgRadioAtom.name}_set');
  }

  final _$_LoginFormActionController = ActionController(name: '_LoginForm');

  @override
  bool validarLogin(String value) {
    final _$actionInfo = _$_LoginFormActionController.startAction();
    try {
      return super.validarLogin(value);
    } finally {
      _$_LoginFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarSenha(String value) {
    final _$actionInfo = _$_LoginFormActionController.startAction();
    try {
      return super.validarSenha(value);
    } finally {
      _$_LoginFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarRadio(int value) {
    final _$actionInfo = _$_LoginFormActionController.startAction();
    try {
      return super.validarRadio(value);
    } finally {
      _$_LoginFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRadio(int value) {
    final _$actionInfo = _$_LoginFormActionController.startAction();
    try {
      return super.setRadio(value);
    } finally {
      _$_LoginFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'login: ${login.toString()},senha: ${senha.toString()},radioSelected: ${radioSelected.toString()},msgLogin: ${msgLogin.toString()},msgSenha: ${msgSenha.toString()},msgRadio: ${msgRadio.toString()}';
    return '{$string}';
  }
}
