class Especialidade {
  int id;
  String descricao;

  Especialidade.fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.descricao = map['descricao'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id': this.id,
      'descricao': this.descricao
    };
  }
}