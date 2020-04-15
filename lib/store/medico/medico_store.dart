import 'package:mobx/mobx.dart';
import 'package:projetomobile/model/medico.dart';

part 'medico_store.g.dart';

class MedicoStore = _MedicoStore with _$MedicoStore;

abstract class _MedicoStore with Store {
  @observable
  ObservableList<Medico> medicos = ObservableList<Medico>();

  @action
  void updateMedicos(List<Medico> medicos){
    this.medicos = ObservableList.of(medicos);
  }

}