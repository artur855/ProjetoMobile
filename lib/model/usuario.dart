class Usuario {

  int id;
  String login;
  String senha;

  Usuario({this.id, this.login, this.senha});

  Usuario.fromMap(Map<String, dynamic> map) {
    this.id = map['ID_USUARIO'];
    this.login = map['LOGIN'];
    this.senha = map['SENHA'];
  }

  Map<String, dynamic> toMap(){
    return {
      'LOGIN': this.login,
      'SENHA': this.senha,
    };
  }

  @override
  String toString() {
    return this.toMap().toString();
  }
}