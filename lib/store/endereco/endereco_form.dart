import 'package:mobx/mobx.dart';
import 'package:projetomobile/model/estado.dart';

part 'endereco_form.g.dart';

class EnderecoForm = _EnderecoForm with _$EnderecoForm;

abstract class _EnderecoForm with Store {
  List<ReactionDisposer> _disposers;

  @observable
  String cidade;

  @observable
  String logradouro;

  @observable
  String cep;

  @observable
  Estado estado;

  @observable
  String msgCidade;

  @observable
  String msgLogradouro;

  @observable
  String msgCep;

  @observable
  String msgEstado;

  void criarValidacoes() {
    _disposers = [
      reaction((_) => cidade, validarCidade),
      reaction((_) => logradouro, validarLogradouro),
      reaction((_) => cep, validarCep),
      reaction((_) => estado, validarEstado),
    ];
  }

  bool validarAll() {
    var isCidadeOK = validarCidade(cidade);
    var isLogradouroOk = validarLogradouro(logradouro);
    var isCepOK =  validarCep(cep);
    var isEstadoOK = validarEstado(estado);
    return isCidadeOK && isLogradouroOk && isCepOK && isEstadoOK;
  }

  @action
  bool validarCidade(String value) {
    msgCidade = value == null || value.isEmpty ? 'Cidade não pode estar em branco' : null;
    return msgCidade == null;
  }

  @action
  bool validarLogradouro(String value) {
    msgLogradouro = value == null || value.isEmpty ? 'Logradouro não pode estar em branco' : null;
    return msgLogradouro == null;
  }

  @action
  bool validarCep(String value) {
    if (value == null || value.isEmpty) {
      msgCep = 'CEP não pode estar em branco';
    } else if (value.length != 8) {
      msgCep = 'CEP precisa ter 8 números';
    } else {
      msgCep = null;
    }
    return msgCep == null;

  }

  @action
  bool validarEstado(Estado value) {
    msgEstado = value == null ? 'Escolha um estado' : null;
    return msgEstado == null;
  }

  void dispose(){
    for(var disposer in _disposers){
      disposer();
    }
  }


}
