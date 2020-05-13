class Especialidade {
  int id;
  String dsc;

  Especialidade({this.id, this.dsc});

  Especialidade.fromMap(Map<String, dynamic> map) {
    this.id = map['ID_ESPECIALIDADE'];
    this.dsc = map['DSC_ESPECIALIDADE'];
  }

  Map<String, dynamic> toMap() {
    return {'ID_ESPECIALIDADE': this.id, 'DSC_ESPECIALIDADE': this.dsc};
  }

  @override
  String toString() {
    return {'ID_ESPECIALIDADE': this.id, 'DSC_ESPECIALIDADE': this.dsc}.toString();
  }
}
