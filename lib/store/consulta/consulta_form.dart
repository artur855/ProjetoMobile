import 'package:mobx/mobx.dart';
import 'package:projetomobile/model/cobertura.dart';
import 'package:projetomobile/model/medico.dart';
import 'package:projetomobile/model/paciente.dart';

part 'consulta_form.g.dart';

class ConsultaForm = _ConsultaForm with _$ConsultaForm;

abstract class _ConsultaForm with Store {
  @observable
  DateTime data;
  @observable
  Paciente paciente;
  @observable
  Medico medico;
  @observable
  Cobertura cobertura;

  @observable
  String msgData;
  @observable
  String msgPaciente;
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
    reaction((_) => paciente, validarPaciente),
    reaction((_) => medico, validarMedico),
    reaction((_) => cobertura, validarCobertura),
    ];
  }


  bool validarAll(){
    var isDataOk = validarData(data);
    var isPacienteOk = validarPaciente(paciente);
    var isMedicoOk = validarMedico(medico);
    var isCoberturaOk  = validarCobertura(cobertura);
    return isDataOk && isPacienteOk && isMedicoOk && isCoberturaOk;
  }

  @action
  bool validarData(DateTime value) {
    msgData = value == null ? 'Escolha uma data' : null;
    return msgData == null;
  }

  @action
  bool validarPaciente(Paciente value) {
    msgPaciente = value == null ? 'Escolha um paciente' : null;
    return msgPaciente == null;
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
