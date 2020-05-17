import 'package:projetomobile/model/cobertura.dart';
import 'package:projetomobile/model/medico.dart';
import 'package:projetomobile/model/paciente.dart';

class Consulta {
  int id;
  String data;
  Medico medico;
  int idMedico;
  Paciente paciente;
  int idPaciente;
  Cobertura cobertura;
  int idCobertura;

  DateTime get dataParsed {
    var partsOfDate = this.data.split('/');
    var day = num.parse(partsOfDate[0]);
    var month = num.parse(partsOfDate[1]);
    var year = num.parse(partsOfDate[2]);
    return DateTime(year, month, day);
  }

  Consulta({this.id, this.data, this.medico, this.idMedico, this.paciente, this.idPaciente, this.cobertura, this.idCobertura}) {
   this.idPaciente = this.paciente.id;
   this.idMedico = this.medico.id;
   this.idCobertura = this.cobertura.id;
  }

  Consulta.fromMap(Map<String, dynamic> map, {includePacienteMedicoCobertura: true}) {
    this.id = map['ID_CONSULTA'];
    this.data = map['DATA_CONSULTA'];
    this.idMedico = map['ID_MEDICO'];
    this.idPaciente = map['ID_PACIENTE'];
    this.idCobertura = map['ID_COBERTURA'];
    if (includePacienteMedicoCobertura) {
      this.paciente = Paciente.fromMap(map);
      this.medico = Medico.fromMap(map);
      this.cobertura = Cobertura.fromMap(map);
    }
  }

  Map<String, dynamic> toMap(){
    return {
      'ID_CONSULTA': this.id,
      'DATA_CONSULTA': this.data,
      'ID_PACIENTE': this.idPaciente ?? this.paciente?.id,
      'ID_MEDICO': this.idMedico ?? this.medico?.id,
      'ID_COBERTURA': this.idCobertura ?? this.cobertura?.id,
    };
  }
}
