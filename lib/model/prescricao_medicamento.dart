import 'atendimento.dart';

class PrescicaoMedicamento {
  int id;
  Atendimento atendimento;
  String medicamento;
  String formaUso;

  PrescicaoMedicamento.fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.medicamento = map['medicamento'];
    this.formaUso = map['formaUso'];
    this.atendimento = map['atendimento'];
  }

  Map<String, dynamic> toMap(){
    return {
    'id': this.id,
    'medicamento': this.medicamento,
    'formaUso': this.formaUso,
    'atendimento': this.atendimento?.toMap()
    };
  }

}