import 'package:mobx/mobx.dart';
import 'package:projetomobile/model/endereco.dart';

part 'endereco_store.g.dart';

class EnderecoStore = _EnderecoStore with _$EnderecoStore;

abstract class _EnderecoStore with Store {

  @observable
  ObservableList<Endereco> enderecos = ObservableList();

  @action
  void updateEnderecos(List<Endereco> estados){
    this.enderecos = ObservableList<Endereco>.of(estados);
  }
}
