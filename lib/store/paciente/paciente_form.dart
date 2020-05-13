import 'package:mobx/mobx.dart';
import 'package:projetomobile/model/endereco.dart';

part 'paciente_form.g.dart';

class PacienteForm extends _PacienteForm with _$PacienteForm {
  PacienteForm({isRegisterForm}) : super(isRegisterForm: isRegisterForm);
}

abstract class _PacienteForm with Store {
  final bool isRegisterForm;

  @observable
  String nome;

  @observable
  DateTime datNascimento;

  @observable
  int cpf;

  @observable
  int rg;

  @observable
  int telefone;

  @observable
  Endereco endereco;

  @observable
  String login;

  @observable
  String senha;

  @observable
  String confSenha;

  @observable
  String msgNome;

  @observable
  String msgCpf;

  @observable
  String msgDatNascimento;

  @observable
  String msgRg;

  @observable
  String msgTelefone;

  @observable
  String msgEndereco;

  @observable
  String msgLogin;

  @observable
  String msgSenha;

  @observable
  String msgConfSenha;

  @computed
  String get datNascimentoStr => datNascimento == null ? null : '${datNascimento.day}/${datNascimento.month}/${datNascimento.year}';

  List<ReactionDisposer> _disposers;

  _PacienteForm({this.isRegisterForm});

  void criarValidacoes() {
    _disposers = [
      reaction((_) => nome, validarNome),
      reaction((_) => datNascimento, validarDatNascimento),
      reaction((_) => cpf, validarCpf),
      reaction((_) => rg, validarRG),
      reaction((_) => telefone, validarTelefone),
      reaction((_) => endereco, validarEndereco),
    ];
    if (isRegisterForm) {
      _disposers.add(reaction((_) => login, validarLogin));
      _disposers.add(reaction((_) => senha, validarSenha));
      _disposers.add(reaction((_) => confSenha, validarConfSenha));
    }
  }

  bool validarAll() {
    bool isNomeOk = validarNome(nome);
    bool isCrmOk = validarCpf(cpf);
    bool isTelefoneOk = validarTelefone(telefone);
    bool isEspecialidadeOk = validarEndereco(endereco);
    if (isRegisterForm) {
      bool isLoginOk = validarLogin(login);
      bool isSenhaOk = validarSenha(senha);
      bool isConfSenhaOk = validarConfSenha(confSenha);
      return isNomeOk && isCrmOk && isTelefoneOk && isEspecialidadeOk && isLoginOk && isSenhaOk && isConfSenhaOk;
    }
    return isNomeOk && isCrmOk && isTelefoneOk && isEspecialidadeOk;
  }

  @action
  bool validarNome(String value) {
    msgNome = nome == null || nome.isEmpty ? 'Nome não pode ser vazio' : null;
    return msgNome == null;
  }

  @action
  bool validarDatNascimento(DateTime value) {
    msgDatNascimento = value == null ? 'Escolha uma data de nascimento' : null;
    msgDatNascimento = value.isAfter(DateTime.now()) ? 'Data de nascimento impossível' : null;
    return msgDatNascimento == null;
  }

  @action
  bool validarCpf(int value) {
    msgCpf = value == null ? 'CPF não pode ser vazio' : null;
    msgCpf = value.toString().padLeft(11, '0').length != 11 ? 'CPF precisa ter 11 números' : null;
    return msgCpf == null;
  }

  @action
  bool validarRG(int value) {
    msgRg = value == null ? 'RG não pode ser vazio' : null;
    msgRg = value.toString().length != 8 ? 'RG precisa ter 8 números' : null;
    return msgRg == null;
  }

  @action
  bool validarTelefone(int value) {
    msgTelefone = value == null ? 'Telefone não pode ser vazio' : null;
    return msgTelefone == null;
  }

  @action
  bool validarEndereco(Endereco value) {
    msgEndereco = value == null ? 'Escolha um endereço' : null;
    return msgEndereco == null;
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
  bool setMsgLogin(String msg){
    this.msgLogin = msg;
  }

  void dispose() {
    for (var disposer in _disposers) {
      disposer();
    }
  }
}
