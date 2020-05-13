import 'package:projetomobile/model/endereco.dart';
import 'package:projetomobile/model/usuario.dart';

class Paciente extends Usuario {
  int id;
  String nome;
  String datNascimento;
  int telefone;
  int cpf;
  int rg;
  Endereco endereco;
  int enderecoId;

  String get cpfFormated => cpf.toString().padLeft(11, '0');
  String get rgFormated => rg.toString().padRight(11, '0');

  Paciente({this.id, this.nome, this.datNascimento, this.telefone, this.cpf, this.rg, this.endereco, this.enderecoId, login, senha}) : super(id: id, login: login, senha: senha) {
    this.enderecoId = this.endereco?.id;
  }

  Paciente.fromMap(Map<String, dynamic> map, {bool includeEndereco: true}) {
    this.id = map['ID_PACIENTE'];
    this.nome = map['NOME_PACIENTE'];
    this.datNascimento = map['DAT_NASCIMENTO'];
    this.telefone = map['TELEFONE_PACIENTE'];
    this.cpf = map['CPF_PACIENTE'];
    this.rg = map['RG_PACIENTE'];
    if (includeEndereco){
      this.endereco = Endereco.fromMap(map);
      this.enderecoId = this.endereco.id;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'ID_USUARIO': this.id,
      'NOME_PACIENTE': this.nome,
      'DAT_NASCIMENTO': this.datNascimento,
      'TELEFONE_PACIENTE': this.telefone,
      'CPF_PACIENTE': this.cpf,
      'RG_PACIENTE': this.rg,
      'ID_ENDERECO': this.enderecoId,
    };
  }
}
