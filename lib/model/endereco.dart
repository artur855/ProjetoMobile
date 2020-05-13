import 'estado.dart';

class Endereco {
  int id;
  String cidade;
  String logradouro;
  String cep;
  Estado estado;
  int estadoId;

  Endereco({this.id, this.cidade, this.logradouro, this.cep, this.estado}) {
    this.estadoId = this.estado.id;
  }

  Endereco.fromMap(Map<String, dynamic> map, {includeEstado: false}) {
    this.id = map['ID_ENDERECO'];
    this.estadoId = map['ID_ESTADO'];
    this.cidade = map['CIDADE'];
    this.logradouro = map['LOGRADOURO'];
    this.cep = map['CEP'];

    if (includeEstado) {
      this.estado = Estado.fromMap(map);
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'CIDADE': this.cidade,
      'LOGRADOURO': this.logradouro,
      'CEP': this.cep,
      'ID_ESTADO': this.estadoId,
    };
  }

  @override
  String toString() {
    return {
      'ID_ENDERECO': this.id,
      'CIDADE': this.cidade,
      'LOGRADOURO': this.logradouro,
      'CEP': this.cep,
      'ID_ESTADO': this.estadoId,
    }.toString();
  }
}
