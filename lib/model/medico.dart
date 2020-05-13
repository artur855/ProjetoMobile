import 'package:projetomobile/model/especialidade.dart';
import 'package:projetomobile/model/usuario.dart';

class Medico extends Usuario {
  int id;
  String nome;
  int crm;
  Especialidade especialidade;
  int especialidadeId;

  Medico({this.id, this.nome, this.crm,  this.especialidade, this.especialidadeId, login, senha}) : super(id: id, login: login, senha: senha) {
    this.especialidadeId = this.especialidade.id;
  }

  Medico.fromMap(Map<String, dynamic> map, {includeEspecialidade: true}) {
    this.id = map['ID_MEDICO'];
    this.nome = map['NOME_MEDICO'];
    this.crm = map['CRM'];
    if (includeEspecialidade) {
      this.especialidade = Especialidade.fromMap(map);
      this.especialidadeId = this.especialidade.id;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'ID_MEDICO': this.id,
      'NOME_MEDICO': this.nome,
      'CRM': this.crm,
      'ID_ESPECIALIDADE': this.especialidadeId,
    };
  }

  @override
  String toString() {
    return this.toMap().toString();
  }
}
