class Estado {
  int id;
  String sigla;
  String nome;

  Estado({this.id, this.sigla, this.nome});

  Estado.fromMap(Map<String, dynamic> map){
    this.id = map['ID_ESTADO'];
    this.sigla = map['SIGLA'];
    this.nome = map['NOME_ESTADO'];
  }

  Map<String, dynamic> toMap(){
    return {
      'ID_ESTADO': this.id,
      'SIGLA': this.sigla,
      'NOME_ESTADO': this.nome
    };
  }

  @override
  String toString() {
    return this.toMap().toString();
  }
}