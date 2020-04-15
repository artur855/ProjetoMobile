import 'package:mobx/mobx.dart';
part 'estado_form.g.dart';

class EstadoForm = _EstadoForm with _$EstadoForm;

abstract class _EstadoForm with Store {
  @observable
  String nome = '';

  @observable
  String sigla = '';

  @observable
  String msgNome;

  @observable
  String msgSigla;

  List<ReactionDisposer> _disposers;

  EstadoForm(){
    _disposers = [
      reaction((_) => nome, validarNome),
      reaction((_) => sigla, validarSigla),
    ];
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
    return msgNome == null;
  }

  bool isValido(String value) {
    return value != null && value.isNotEmpty;
  }

  void dispose() {
    for (final disposer in _disposers) {
      disposer();
    }
  }
}