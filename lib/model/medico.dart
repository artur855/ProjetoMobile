import 'package:projetomobile/model/endereco.dart';

class Medico {
  int id;
  String nome;
  int crm;
  int telefone;
  Endereco endereco;
  int enderecoId;

  Medico.fromMap(Map<String, dynamic> map, {includeEndereco: true}){
    this.id = map['ID_MEDICO'];
    this.nome = map['NOME_MEDICO'];
    this.crm = map['CRM'];
    this.telefone = map['TELEFONE'];
    if (includeEndereco){
      this.endereco = Endereco.fromMap(map);
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'NOME_MEDICO': this.nome,
      'CRM': this.crm,
      'TELEFONE': this.telefone,
      'ID_ENDERECO': this.enderecoId,
    };
  }

  @override
  String toString() {
    return {
      'ID_MEDICO': this.id,
      'NOME_MEDICO': this.nome,
      'CRM': this.crm,
      'TELEFONE': this.telefone,
      'ID_ENDERECO': this.enderecoId,
    }.toString();
  }
}
