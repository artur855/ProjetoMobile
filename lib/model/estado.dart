class Estado {
  int id;
  String sigla;
  String nome;

  Estado({this.id, this.sigla, this.nome});

  Estado.fromMap(Map<String, dynamic> map){
    this.id = map['ID'];
    this.sigla = map['SIGLA'];
    this.nome = map['NOME'];
  }

  Map<String, dynamic> toMap(){
    return {
      'ID': this.id,
      'SIGLA': this.sigla,
      'NOME': this.nome
    };
  }

  @override
  String toString() {
    return this.toMap().toString();
  }
}