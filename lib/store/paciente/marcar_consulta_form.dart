import 'package:mobx/mobx.dart';
import 'package:projetomobile/model/cobertura.dart';
import 'package:projetomobile/model/medico.dart';

part 'marcar_consulta_form.g.dart';

class MarcarConsultaForm = _MarcarConsultaForm with _$MarcarConsultaForm;

abstract class _MarcarConsultaForm with Store {
  @observable
  DateTime data;
  @observable
  Medico medico;
  @observable
  Cobertura cobertura;

  @observable
  String msgData;
  @observable
  String msgEspecialidade;
  @observable
  String msgMedico;
  @observable
  String msgCobertura;

  @computed
  String get dataStr => data == null ? null : '${data.day}/${data.month}/${data.year}';

  List<ReactionDisposer> _disposers;

  void criarValidacoes() {
    _disposers =
    [
      reaction((_) => data, validarData),
      reaction((_) => medico, validarMedico),
      reaction((_) => cobertura, validarCobertura),
    ];
  }


  bool validarAll(){
    var isDataOk = validarData(data);
    var isMedicoOk = validarMedico(medico);
    var isCoberturaOk  = validarCobertura(cobertura);
    return isDataOk &&  isMedicoOk && isCoberturaOk;
  }

  @action
  bool validarData(DateTime value) {
    msgData = value == null ? 'Escolha uma data' : null;
    return msgData == null;
  }

  @action
  bool validarMedico(Medico value) {
    msgMedico = value == null ? 'Escolha um médico' : null;
    return msgMedico == null;
  }

  @action
  bool validarCobertura(Cobertura value) {
    msgCobertura = value == null ? 'Escolha uma cobertura' : null;
    return msgCobertura == null;
  }

  void dispose(){
    for (var disposer in _disposers){
      disposer();
    }
  }

}
