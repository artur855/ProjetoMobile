import 'endereco.dart';
import 'especialidade.dart';
import 'plano.dart';

class Medico{
  int id;
  String nome;
  String crm;
  String tel;
  Especialidade especialidade;
  Endereco endereco;
  List<Plano> planos;

  Medico({this.id, this.nome, this.crm, this.tel, this.especialidade, this.endereco, this.planos});

  Medico.fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.nome = map['nome'];
    this.crm = map['crm'];
    this.tel = map['tel'];
    this.especialidade = map['especialidade'];
    this.endereco = map['endereco'];
    this.planos = map['planos'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id': this.id,
      'nome': this.nome,
      'crm': this.crm,
      'tel': this.tel,
      'especialidade': this.especialidade,
      'endereco': this.endereco,
      'planos': this.planos?.map((p) => p?.toMap())?.toList()
    };
  }
}