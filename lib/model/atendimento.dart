import 'consulta.dart';
import 'medico.dart';
import 'paciente.dart';
import 'plano.dart';

class Atendimento {
  int id;
  DateTime horaInicio;
  DateTime horaFim;
  Paciente paciente;
  Medico medico;
  Consulta consulta;

  Atendimento({this.id, this.horaInicio, this.horaFim, this.paciente, this.medico, this.consulta});

  Atendimento.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.horaInicio = map['horaInicio'];
    this.horaFim = map['horaFim'];
    this.paciente = map['paciente'];
    this.medico = map['medico'];
    this.consulta = map['consulta'];
  }

  Map<String, dynamic> toMap() {
    return {
      'horaInicio': this.horaInicio,
      'horaFim': this.horaFim,
      'paciente': this.paciente?.toMap(),
      'medico': this.medico?.toMap(),
      'consulta': this.consulta?.toMap()
    };
  }
}