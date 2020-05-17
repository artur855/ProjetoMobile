import 'package:projetomobile/model/consulta.dart';
import 'package:projetomobile/repository/base_repository.dart';
import 'package:projetomobile/repository/sql/consulta_sql.dart';

class ConsultaRepository extends BaseRepository<Consulta> {
  @override
  final String tableName = 'CONSULTA';

  @override
  Future<List<Consulta>> getAll({includePacienteMedicoCobertura: true, idPaciente, idMedico}) async {
    var db = await super.db;
    var consultas = List<Map>();
    if (includePacienteMedicoCobertura) {
      consultas = await db.rawQuery(SELECT_CONSULTA_INCLUDE_PACIENTE_MEDICO_COBERTURA);
    } else {
      consultas = await db.query(tableName, columns: ['ID_CONSULTA', 'DATA_CONSULTA', 'ID_PACIENTE', 'ID_MEDICO', 'ID_COBERTURA']);
    }
    var consultasObjs = consultas.map((c) => Consulta.fromMap(c, includePacienteMedicoCobertura: includePacienteMedicoCobertura)).toList();
    if (idPaciente != null) {
      consultasObjs = consultasObjs.where((c) => c.idPaciente == idPaciente).toList();
    }
    if (idMedico != null) {
      consultasObjs = consultasObjs.where((c) => c.idMedico == idMedico).toList();
    }
    consultasObjs.sort((c1, c2) => c1.dataParsed.compareTo(c2.dataParsed));
    return consultasObjs;
  }

  @override
  Future insert(Consulta consulta) async {
    var db = await super.db;
    if (!await existeChoqueHorario(consulta)) {
      await db.insert(tableName, consulta.toMap());
    } else {
      throw Exception();
    }
  }

  @override
  Future update(Consulta consulta) async {
    var db = await super.db;
    if (!await existeChoqueHorario(consulta)) {
      await db.update(tableName, consulta.toMap(), where: 'ID_CONSULTA = ?', whereArgs: [consulta.id]);
    } else {
      throw Exception();
    }
  }

  @override
  Future delete(Consulta consulta) async {
    var db = await super.db;
    await db.delete(tableName, where: 'ID_CONSULTA = ?', whereArgs: [consulta.id]);
  }

  Future<bool> existeChoqueHorario(Consulta consulta) async {
    var db = await super.db;
    var results = await db.rawQuery(SELECT_EXISTE_CHOQUE_HORARIO, [consulta.data, consulta.idPaciente, consulta.idMedico]);
    return results.length > 0;
  }
}
