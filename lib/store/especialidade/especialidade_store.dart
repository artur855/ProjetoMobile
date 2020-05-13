import 'package:mobx/mobx.dart';
import 'package:projetomobile/model/especialidade.dart';

part 'especialidade_store.g.dart';

class EspecialidadeStore = _EspecialidadeStore with _$EspecialidadeStore;

abstract class _EspecialidadeStore with Store {

  @observable
  ObservableList<Especialidade> especialidades = ObservableList<Especialidade>();

  @action
  void atualizarEspecialidades(List<Especialidade> especialidades) {
    this.especialidades = ObservableList<Especialidade>.of(especialidades);
  }
}
