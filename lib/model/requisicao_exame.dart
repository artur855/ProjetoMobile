import 'atendimento.dart';
import 'exame.dart';

class RequisicaoExame {
  int id;
  DateTime dataRequisicao;
  DateTime dataAgendamento;
  int situacao;
  Exame exame;
  Atendimento atendimento;

  RequisicaoExame.fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.dataRequisicao = map['dataRequisicao'];
    this.dataAgendamento = map['dataAgendamento'];
    this.situacao = map['situacao'];
    this.exame = map['exame'];
    this.atendimento = map['atendimento'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id': this.id,
      'dataRequisicao': this.dataRequisicao,
      'dataAgendamento': this.dataAgendamento,
      'situacao': this.situacao,
      'exame': this.exame?.toMap(),
      'atendimento': this.atendimento?.toMap()
    };
  }


}