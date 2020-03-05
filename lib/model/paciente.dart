import 'atendimento.dart';
import 'plano.dart';

class Paciente {
  int id;
  String nome;
  int sexo;
  DateTime nascimento;
  Plano plano;
  List<Atendimento> atendimentos;

  Paciente({this.id, this.nome, this.sexo, this.nascimento, this.plano, this.atendimentos});

  Paciente.fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.nome = map['nome'];
    this.sexo = map['sexo'];
    this.nascimento = map['nascimento'];
    this.plano = map['plano'];
    this.atendimentos = map['atendimentos'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id': this.id,
      'nome': this.nome,
      'sexo': this.sexo,
      'nascimento': this.nascimento,
      'plano': this.plano?.toMap(),
      'atendimentos': this.atendimentos?.map((a) => a?.toMap())?.toList()
    };
  }
}