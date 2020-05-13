import 'package:mobx/mobx.dart';
import 'package:projetomobile/model/especialidade.dart';

part 'medico_form.g.dart';

class MedicoForm extends _MedicoForm with _$MedicoForm {
  MedicoForm({isRegisterForm}) : super(isRegisterForm: isRegisterForm);
}

abstract class _MedicoForm with Store {
  final bool isRegisterForm;

  @observable
  String nome;

  @observable
  int crm;

  @observable
  Especialidade especialidade;

  @observable
  String login;

  @observable
  String senha;

  @observable
  String confSenha;
  @observable
  String msgNome;

  @observable
  String msgCrm;

  @observable
  String msgEspecialidade;
  @observable
  String msgLogin;

  @observable
  String msgSenha;

  @observable
  String msgConfSenha;
  List<ReactionDisposer> _disposers;

  _MedicoForm({this.isRegisterForm});

  void criarValidacoes() {
    _disposers = [
      reaction((_) => nome, validarNome),
      reaction((_) => crm, validarCrm),
      reaction((_) => especialidade, validarEspecialidade),
    ];
    if (isRegisterForm) {
      _disposers.add(reaction((_) => login, validarLogin));
      _disposers.add(reaction((_) => senha, validarSenha));
      _disposers.add(reaction((_) => confSenha, validarConfSenha));
    }
  }

  bool validarAll() {
    bool isNomeOk = validarNome(nome);
    bool isCrmOk = validarCrm(crm);
    bool isEspecialidadeOk = validarEspecialidade(especialidade);
    if (isRegisterForm) {
      bool isLoginOk = validarLogin(login);
      bool isSenhaOk = validarSenha(senha);
      bool isConfSenhaOk = validarConfSenha(confSenha);
      return isNomeOk && isCrmOk && isEspecialidadeOk && isLoginOk && isSenhaOk && isConfSenhaOk;
    }
    return isNomeOk && isCrmOk && isEspecialidadeOk;
  }

  @action
  bool validarNome(String value) {
    msgNome = nome == null || nome.isEmpty ? 'Nome não pode ser vazio' : null;
    return msgNome == null;
  }

  @action
  bool validarCrm(int value) {
    msgCrm = crm == null ? 'CRM não pode ser vazio' : null;
    return msgCrm == null;
  }

  @action
  bool validarEspecialidade(Especialidade value) {
    msgEspecialidade = especialidade == null ? 'Escolha uma especialidade' : null;
    return msgEspecialidade == null;
  }

  @action
  bool validarLogin(String value) {
    msgLogin = value == null ? 'Login não pode ser vazio' : null;
    return msgLogin == null;
  }

  @action
  bool validarSenha(String value) {
    msgSenha = value == null ? 'Senha não pode ser vazio' : null;
    msgSenha = value.length < 8 ? 'Senha precisa de no mínimo 8 caracteres' : null;
    return msgSenha == null;
  }

  @action
  bool validarConfSenha(String value) {
    msgConfSenha = value == null ? 'Senha não pode ser vazio' : null;
    msgConfSenha = value.length < 8 ? 'Senha precisa de no mínimo 8 caracteres' : null;
    msgConfSenha = value != this.senha ? 'Senhas diferentes' : null;
    return msgConfSenha == null;
  }

  @action
  void setLoginMsg(String msg){
    this.msgLogin = msg;
  }

  void dispose() {
    for (var disposer in _disposers) {
      disposer();
    }
  }
}
