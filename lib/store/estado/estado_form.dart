import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'estado_form.g.dart';

class EstadoForm = _EstadoForm with _$EstadoForm;

abstract class _EstadoForm with Store {
  @observable
  String nome;

  @observable
  String sigla;

  @observable
  String msgNome;

  @observable
  String msgSigla;

  @observable
  TextEditingController nomeController;
  @observable
  TextEditingController siglaController;

  List<ReactionDisposer> _disposers;

  void criarValidacoes({nome, sigla}) {
    _disposers = [
      reaction((_) => this.nome, validarNome),
      reaction((_) => this.sigla, validarSigla),
    ];
    nomeController = TextEditingController(text: nome);
    siglaController = TextEditingController(text: sigla);
    this.nome = nome;
    this.sigla = sigla;
  }


  bool validarAll(){
    var isNomeOK = validarNome(nome);
    var isSiglaOK = validarSigla(sigla);
    return isNomeOK && isSiglaOK;
  }

  @action
  bool validarNome(String value) {
    msgNome = isValido(value) ? null : 'Nome não pode ser vazio';
    return msgNome == null;
  }

  @action
  bool validarSigla(String value) {
    msgSigla = isValido(value) && value.length == 2 ? null : 'Sigla deve ter duas letras';
    return msgSigla == null;
  }

  bool isValido(String value) {
    return value != null && value.isNotEmpty;
  }

  @action
  void clearControllers(){
    nomeController.clear();
    siglaController.clear();
  }

  void dispose() {
    for (final disposer in _disposers) {
      disposer();
    }
    nomeController.dispose();
    siglaController.dispose();
  }
}