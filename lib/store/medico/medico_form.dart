import 'package:mobx/mobx.dart';
import 'package:projetomobile/model/endereco.dart';
import 'package:projetomobile/model/medico.dart';

part 'medico_form.g.dart';

class MedicoForm = _MedicoForm with _$MedicoForm;

abstract class _MedicoForm with Store {
  @observable
  String nome;

  @observable
  int crm;

  @observable
  int telefone;

  @observable
  Endereco endereco;

  @observable
  String msgNome;

  @observable
  String msgCrm;

  @observable
  String msgTelefone;

  @observable
  String msgEndereco;

  List<ReactionDisposer> _disposers;

  MedicoForm() {
    _disposers = [
      reaction((_) => nome, validarNome),
      reaction((_) => crm, validarCrm),
      reaction((_) => telefone, validarTelefone),
      reaction((_) => endereco, validarEndereco),
    ];
  }

  bool validarAll(){
    bool isNomeOk = validarNome(nome);
    bool isCrmOk = validarCrm(crm);
    bool isTelefoneOk = validarTelefone(telefone);
    bool isEnderecoOk = validarEndereco(endereco);
    return isNomeOk && isCrmOk && isTelefoneOk &&  isEnderecoOk;
  }

  @action
  bool validarNome(String value) {
    return msgNome == null;
  }

  @action
  bool validarCrm(int value) {
    return msgCrm == null;
  }

  @action
  bool validarTelefone(int value) {
    return msgTelefone == null;
  }

  @action
  bool validarEndereco(Endereco value) {
    return msgEndereco == null;
  }

  void dispose() {
    for (var disposer in _disposers) {
      disposer();
    }
  }
}
