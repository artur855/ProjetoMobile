import 'package:mobx/mobx.dart';
import 'package:projetomobile/model/estado.dart';
import 'package:projetomobile/repository/estado_repository.dart';
part 'estado_store.g.dart';
// flutter packages pub run build_runner build

class EstadoStore = _EstadoBase with _$EstadoStore;

class EstadoForm = _EstadoForm with _$EstadoForm;

abstract class _EstadoBase with Store {

  @observable
  ObservableList<Estado> estados = ObservableList<Estado>();

  @action
  void updateEstados(List<Estado> estados){
    this.estados = ObservableList<Estado>.of(estados);
  }

}

abstract class _EstadoForm with Store {
  List<ReactionDisposer> disposers;

  @observable
  String nome = '';

  @observable
  String sigla = '';

  @observable
  String msgNome;

  @observable
  String msgSigla;

  void criarValidacoes() {
    disposers = [
      reaction((_) => nome, validarNome),
      reaction((_) => sigla, validarSigla),
    ];
  }

  @computed
  get isFormValido => nome != null && nome.isNotEmpty && sigla != null && sigla.isNotEmpty;

  void validarAll(){
    validarNome(nome);
    validarSigla(sigla);
  }

  @action
  void validarNome(String value) {
    msgNome = isValido(value) ? null : 'Nome não pode ser vazio';
  }

  @action
  void validarSigla(String value) {
    msgSigla = isValido(value) && value.length == 2 ? null : 'Sigla deve ter duas letras';
  }

  bool isValido(String value) {
    return value != null && value.isNotEmpty;
  }

  void dispose() {
    dispose();
  }
}
