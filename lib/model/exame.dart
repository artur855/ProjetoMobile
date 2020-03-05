import 'plano.dart';

class Exame {
  int id;
  String nome;
  String descricao;
  double valor;
  List<Plano> planos;

  Exame({this.id, this.nome, this.descricao, this.valor, this.planos});

  Exame.fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.nome = map['nome'];
    this.descricao = map['descricao'];
    this.valor = map['valor'];
    this.planos = map['planos'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id': this.id,
      'nome': this.nome,
      'descricao': this.descricao,
      'valor': this.valor,
      'planos': this.planos?.map((p) => p?.toMap()).toList()
    };
  }

}