import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_form.g.dart';

class LoginForm = _LoginForm with _$LoginForm;

abstract class _LoginForm with Store {
  @observable
  String login;

  @observable
  String senha;


  @observable
  int radioSelected = 1;

  @observable
  String msgLogin;

  @observable
  String msgSenha;

  @observable
  String msgRadio;

  List<ReactionDisposer> _disposers;

  void criarValidacoes() {
    _disposers = [
      reaction((_) => login, validarLogin),
      reaction((_) => senha, validarSenha),
      reaction((_) => radioSelected, validarRadio),
    ];

  }

  bool validarAll() {
    bool isLoginOk = validarLogin(login);
    bool isSenhaOk = validarSenha(senha);
    bool isRadioOk = validarRadio(radioSelected);
    return isLoginOk && isSenhaOk && isRadioOk;
  }

  @action
  bool validarLogin(String value) {
    msgLogin = value == null || value.isEmpty ? 'Login não pode ser vazio' : null;
    return msgLogin == null;
  }

  @action
  bool validarSenha(String value) {
    msgSenha = value == null || value.isEmpty ? 'Senha não pode ser vazia' : null;
    return msgSenha == null;
  }

  @action
  bool validarRadio(int value) {
    msgRadio = radioSelected == null ? 'Senha não pode ser vazia' : null;
    return msgRadio == null;
  }

  @action
  void setRadio(int value) {
    this.radioSelected = value;
  }


  void dispose() {
    for (var disposer in _disposers) {
      disposer();
    }
  }
}
