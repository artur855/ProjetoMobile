import 'package:mobx/mobx.dart';
import 'package:projetomobile/model/endereco.dart';

part 'medico_store.g.dart';

class MedicoStore = _MedicoStore with _$MedicoStore;

abstract class _MedicoStore with Store{
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


}