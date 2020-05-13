// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PacienteForm on _PacienteForm, Store {
  Computed<String> _$datNascimentoStrComputed;

  @override
  String get datNascimentoStr => (_$datNascimentoStrComputed ??=
          Computed<String>(() => super.datNascimentoStr))
      .value;

  final _$nomeAtom = Atom(name: '_PacienteForm.nome');

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

  final _$datNascimentoAtom = Atom(name: '_PacienteForm.datNascimento');

  @override
  DateTime get datNascimento {
    _$datNascimentoAtom.context.enforceReadPolicy(_$datNascimentoAtom);
    _$datNascimentoAtom.reportObserved();
    return super.datNascimento;
  }

  @override
  set datNascimento(DateTime value) {
    _$datNascimentoAtom.context.conditionallyRunInAction(() {
      super.datNascimento = value;
      _$datNascimentoAtom.reportChanged();
    }, _$datNascimentoAtom, name: '${_$datNascimentoAtom.name}_set');
  }

  final _$cpfAtom = Atom(name: '_PacienteForm.cpf');

  @override
  int get cpf {
    _$cpfAtom.context.enforceReadPolicy(_$cpfAtom);
    _$cpfAtom.reportObserved();
    return super.cpf;
  }

  @override
  set cpf(int value) {
    _$cpfAtom.context.conditionallyRunInAction(() {
      super.cpf = value;
      _$cpfAtom.reportChanged();
    }, _$cpfAtom, name: '${_$cpfAtom.name}_set');
  }

  final _$rgAtom = Atom(name: '_PacienteForm.rg');

  @override
  int get rg {
    _$rgAtom.context.enforceReadPolicy(_$rgAtom);
    _$rgAtom.reportObserved();
    return super.rg;
  }

  @override
  set rg(int value) {
    _$rgAtom.context.conditionallyRunInAction(() {
      super.rg = value;
      _$rgAtom.reportChanged();
    }, _$rgAtom, name: '${_$rgAtom.name}_set');
  }

  final _$telefoneAtom = Atom(name: '_PacienteForm.telefone');

  @override
  int get telefone {
    _$telefoneAtom.context.enforceReadPolicy(_$telefoneAtom);
    _$telefoneAtom.reportObserved();
    return super.telefone;
  }

  @override
  set telefone(int value) {
    _$telefoneAtom.context.conditionallyRunInAction(() {
      super.telefone = value;
      _$telefoneAtom.reportChanged();
    }, _$telefoneAtom, name: '${_$telefoneAtom.name}_set');
  }

  final _$enderecoAtom = Atom(name: '_PacienteForm.endereco');

  @override
  Endereco get endereco {
    _$enderecoAtom.context.enforceReadPolicy(_$enderecoAtom);
    _$enderecoAtom.reportObserved();
    return super.endereco;
  }

  @override
  set endereco(Endereco value) {
    _$enderecoAtom.context.conditionallyRunInAction(() {
      super.endereco = value;
      _$enderecoAtom.reportChanged();
    }, _$enderecoAtom, name: '${_$enderecoAtom.name}_set');
  }

  final _$loginAtom = Atom(name: '_PacienteForm.login');

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

  final _$senhaAtom = Atom(name: '_PacienteForm.senha');

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

  final _$confSenhaAtom = Atom(name: '_PacienteForm.confSenha');

  @override
  String get confSenha {
    _$confSenhaAtom.context.enforceReadPolicy(_$confSenhaAtom);
    _$confSenhaAtom.reportObserved();
    return super.confSenha;
  }

  @override
  set confSenha(String value) {
    _$confSenhaAtom.context.conditionallyRunInAction(() {
      super.confSenha = value;
      _$confSenhaAtom.reportChanged();
    }, _$confSenhaAtom, name: '${_$confSenhaAtom.name}_set');
  }

  final _$msgNomeAtom = Atom(name: '_PacienteForm.msgNome');

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

  final _$msgCpfAtom = Atom(name: '_PacienteForm.msgCpf');

  @override
  String get msgCpf {
    _$msgCpfAtom.context.enforceReadPolicy(_$msgCpfAtom);
    _$msgCpfAtom.reportObserved();
    return super.msgCpf;
  }

  @override
  set msgCpf(String value) {
    _$msgCpfAtom.context.conditionallyRunInAction(() {
      super.msgCpf = value;
      _$msgCpfAtom.reportChanged();
    }, _$msgCpfAtom, name: '${_$msgCpfAtom.name}_set');
  }

  final _$msgDatNascimentoAtom = Atom(name: '_PacienteForm.msgDatNascimento');

  @override
  String get msgDatNascimento {
    _$msgDatNascimentoAtom.context.enforceReadPolicy(_$msgDatNascimentoAtom);
    _$msgDatNascimentoAtom.reportObserved();
    return super.msgDatNascimento;
  }

  @override
  set msgDatNascimento(String value) {
    _$msgDatNascimentoAtom.context.conditionallyRunInAction(() {
      super.msgDatNascimento = value;
      _$msgDatNascimentoAtom.reportChanged();
    }, _$msgDatNascimentoAtom, name: '${_$msgDatNascimentoAtom.name}_set');
  }

  final _$msgRgAtom = Atom(name: '_PacienteForm.msgRg');

  @override
  String get msgRg {
    _$msgRgAtom.context.enforceReadPolicy(_$msgRgAtom);
    _$msgRgAtom.reportObserved();
    return super.msgRg;
  }

  @override
  set msgRg(String value) {
    _$msgRgAtom.context.conditionallyRunInAction(() {
      super.msgRg = value;
      _$msgRgAtom.reportChanged();
    }, _$msgRgAtom, name: '${_$msgRgAtom.name}_set');
  }

  final _$msgTelefoneAtom = Atom(name: '_PacienteForm.msgTelefone');

  @override
  String get msgTelefone {
    _$msgTelefoneAtom.context.enforceReadPolicy(_$msgTelefoneAtom);
    _$msgTelefoneAtom.reportObserved();
    return super.msgTelefone;
  }

  @override
  set msgTelefone(String value) {
    _$msgTelefoneAtom.context.conditionallyRunInAction(() {
      super.msgTelefone = value;
      _$msgTelefoneAtom.reportChanged();
    }, _$msgTelefoneAtom, name: '${_$msgTelefoneAtom.name}_set');
  }

  final _$msgEnderecoAtom = Atom(name: '_PacienteForm.msgEndereco');

  @override
  String get msgEndereco {
    _$msgEnderecoAtom.context.enforceReadPolicy(_$msgEnderecoAtom);
    _$msgEnderecoAtom.reportObserved();
    return super.msgEndereco;
  }

  @override
  set msgEndereco(String value) {
    _$msgEnderecoAtom.context.conditionallyRunInAction(() {
      super.msgEndereco = value;
      _$msgEnderecoAtom.reportChanged();
    }, _$msgEnderecoAtom, name: '${_$msgEnderecoAtom.name}_set');
  }

  final _$msgLoginAtom = Atom(name: '_PacienteForm.msgLogin');

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

  final _$msgSenhaAtom = Atom(name: '_PacienteForm.msgSenha');

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

  final _$msgConfSenhaAtom = Atom(name: '_PacienteForm.msgConfSenha');

  @override
  String get msgConfSenha {
    _$msgConfSenhaAtom.context.enforceReadPolicy(_$msgConfSenhaAtom);
    _$msgConfSenhaAtom.reportObserved();
    return super.msgConfSenha;
  }

  @override
  set msgConfSenha(String value) {
    _$msgConfSenhaAtom.context.conditionallyRunInAction(() {
      super.msgConfSenha = value;
      _$msgConfSenhaAtom.reportChanged();
    }, _$msgConfSenhaAtom, name: '${_$msgConfSenhaAtom.name}_set');
  }

  final _$_PacienteFormActionController =
      ActionController(name: '_PacienteForm');

  @override
  bool validarNome(String value) {
    final _$actionInfo = _$_PacienteFormActionController.startAction();
    try {
      return super.validarNome(value);
    } finally {
      _$_PacienteFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarDatNascimento(DateTime value) {
    final _$actionInfo = _$_PacienteFormActionController.startAction();
    try {
      return super.validarDatNascimento(value);
    } finally {
      _$_PacienteFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarCpf(int value) {
    final _$actionInfo = _$_PacienteFormActionController.startAction();
    try {
      return super.validarCpf(value);
    } finally {
      _$_PacienteFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarRG(int value) {
    final _$actionInfo = _$_PacienteFormActionController.startAction();
    try {
      return super.validarRG(value);
    } finally {
      _$_PacienteFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarTelefone(int value) {
    final _$actionInfo = _$_PacienteFormActionController.startAction();
    try {
      return super.validarTelefone(value);
    } finally {
      _$_PacienteFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarEndereco(Endereco value) {
    final _$actionInfo = _$_PacienteFormActionController.startAction();
    try {
      return super.validarEndereco(value);
    } finally {
      _$_PacienteFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarLogin(String value) {
    final _$actionInfo = _$_PacienteFormActionController.startAction();
    try {
      return super.validarLogin(value);
    } finally {
      _$_PacienteFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarSenha(String value) {
    final _$actionInfo = _$_PacienteFormActionController.startAction();
    try {
      return super.validarSenha(value);
    } finally {
      _$_PacienteFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarConfSenha(String value) {
    final _$actionInfo = _$_PacienteFormActionController.startAction();
    try {
      return super.validarConfSenha(value);
    } finally {
      _$_PacienteFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool setMsgLogin(String msg) {
    final _$actionInfo = _$_PacienteFormActionController.startAction();
    try {
      return super.setMsgLogin(msg);
    } finally {
      _$_PacienteFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'nome: ${nome.toString()},datNascimento: ${datNascimento.toString()},cpf: ${cpf.toString()},rg: ${rg.toString()},telefone: ${telefone.toString()},endereco: ${endereco.toString()},login: ${login.toString()},senha: ${senha.toString()},confSenha: ${confSenha.toString()},msgNome: ${msgNome.toString()},msgCpf: ${msgCpf.toString()},msgDatNascimento: ${msgDatNascimento.toString()},msgRg: ${msgRg.toString()},msgTelefone: ${msgTelefone.toString()},msgEndereco: ${msgEndereco.toString()},msgLogin: ${msgLogin.toString()},msgSenha: ${msgSenha.toString()},msgConfSenha: ${msgConfSenha.toString()},datNascimentoStr: ${datNascimentoStr.toString()}';
    return '{$string}';
  }
}
