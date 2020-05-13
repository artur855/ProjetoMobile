import 'package:mobx/mobx.dart';
import 'package:projetomobile/model/paciente.dart';

part 'paciente_store.g.dart';

class PacienteStore = _PacienteStore with _$PacienteStore;

abstract class _PacienteStore with Store {
  @observable
  ObservableList<Paciente> pacientes = ObservableList<Paciente>();

  @action
  void updatePacientes(List<Paciente> pacientes){
    this.pacientes = ObservableList.of(pacientes);
  }

}