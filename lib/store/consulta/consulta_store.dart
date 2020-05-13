import 'package:mobx/mobx.dart';
import 'package:projetomobile/model/consulta.dart';
part 'consulta_store.g.dart';

class ConsultaStore = _ConsultaStore with _$ConsultaStore;


abstract class _ConsultaStore with Store {

  @observable
  ObservableList<Consulta> consultas = ObservableList<Consulta>();

  @action
  void atualizarConsultas(List<Consulta> consultas){
    this.consultas = ObservableList<Consulta>.of(consultas);
  }

}

