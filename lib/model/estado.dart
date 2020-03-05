class Estado {
  int id;
  String sigla;
  String nome;

  Estado({this.id, this.sigla, this.nome});

  Estado.fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.sigla = map['sigla'];
    this.nome = map['nome'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id': this.id,
      'sigla': this.sigla,
      'nome': this.nome
    };
  }
}