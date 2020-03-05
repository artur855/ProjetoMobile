import 'package:projetomobile/model/atendimento.dart';
import 'package:projetomobile/model/plano.dart';

class Consulta {
  int id;
  double valor;
  String formaPagamento;
  Plano plano;

  Consulta({this.id, this.valor, this.formaPagamento, this.plano});

  Consulta.fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.valor = map['valor'];
    this.formaPagamento = map['formaPagamento'];
    this.plano = map['plano'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id': this.id,
      'valor': this.valor,
      'formaPagamento': this.formaPagamento,
      'plano': this.plano?.toMap()
    };
  }


}