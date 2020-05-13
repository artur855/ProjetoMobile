import 'package:mobx/mobx.dart';

part 'cobertura_form.g.dart';

class CoberturaForm = _CoberturaForm with _$CoberturaForm;

abstract class _CoberturaForm with Store {
  @observable
  String dsc = '';

  @observable
  String msgDsc;

  List<ReactionDisposer> _disposers;

  void criarValidacoes() {
    _disposers = [
      reaction((_) => dsc, validarDsc),
    ];
  }

  bool validarAll() {
    var isDscOK = validarDsc(dsc);
    return isDscOK;
  }

  @action
  bool validarDsc(String value) {
    msgDsc = isValido(value) ? null : 'Cobertura não pode ser vazia';
    return msgDsc == null;
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
