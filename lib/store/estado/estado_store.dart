import 'package:mobx/mobx.dart';
import 'package:projetomobile/model/estado.dart';
part 'estado_store.g.dart';

class EstadoStore = _EstadoStore with _$EstadoStore;


abstract class _EstadoStore with Store {

  @observable
  ObservableList<Estado> estados = ObservableList<Estado>();

  @action
  void updateEstados(List<Estado> estados){
    this.estados = ObservableList<Estado>.of(estados);
  }

}

