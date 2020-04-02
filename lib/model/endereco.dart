import 'estado.dart';

class Endereco {
  int id;
  String cidade;
  String logradouro;
  String cep;
  Estado estado;
  Endereco({this.id, this.cidade, this.logradouro, this.cep, this.estado});

  Endereco.fromMap(Map<String, dynamic> map){
    this.cidade = map['cidade'];
    this.logradouro = map['logradouro'];
    this.cep = map['cep'];
    this.estado = map['view.estado'];
  }

  Map<String, dynamic> toMap(){
    return {
      'cidade': this.cidade,
      'logradouro': this.logradouro,
      'cep': this.cep,
      'view.estado': this.estado
    };
  }
}