class Cobertura {
  int id;
  String dsc;

  Cobertura({this.id, this.dsc});

  Cobertura.fromMap(Map<String, dynamic> map) {
    this.id = map['ID_COBERTURA'];
    this.dsc = map['DSC_COBERTURA'];
  }

  Map<String, dynamic> toMap() {
    return {
      'ID_COBERTURA': this.id,
      'DSC_COBERTURA': this.dsc,
    };
  }

  @override
  String toString() {
    return {
      'ID_COBERTURA': this.id,
      'DSC_COBERTURA': this.dsc,
    }.toString();
  }
}
