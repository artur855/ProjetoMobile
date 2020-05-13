import 'package:mobx/mobx.dart';
import 'package:projetomobile/model/cobertura.dart';

part 'cobertura_store.g.dart';

class CoberturaStore = _CoberturaStore with _$CoberturaStore;

abstract class _CoberturaStore with Store {

  @observable
  ObservableList<Cobertura> coberturas = ObservableList<Cobertura>();

  @action
  void atualizarCoberturas(List<Cobertura> coberturas) {
    this.coberturas = ObservableList<Cobertura>.of(coberturas);
  }
}