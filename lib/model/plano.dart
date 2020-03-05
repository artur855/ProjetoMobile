import 'exame.dart';

class Plano {
  int id;
  String nome;
  String sigla;
  List<Exame> exames;

  Plano({this.id, this.nome, this.sigla, this.exames});

  Plano.fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.nome = map['nome'];
    this.sigla = map['sigla'];
    this.exames = map['exames'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id': this.id,
      'nome': this.nome,
      'sigla': this.sigla,
      'exames': this.exames?.map((e) => e?.toMap())?.toList()
    };
  }

}