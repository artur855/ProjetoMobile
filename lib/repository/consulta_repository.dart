import 'package:projetomobile/model/consulta.dart';
import 'package:projetomobile/repository/base_repository.dart';
import 'package:projetomobile/repository/sql/consulta_sql.dart';

class ConsultaRepository extends BaseRepository<Consulta>{

  @override
  final String tableName = 'CONSULTA';

  @override
  Future<List<Consulta>> getAll({includePacienteMedicoCobertura: true}) async {
    var db = await super.db;
    var consultas = List<Map>();
    if (includePacienteMedicoCobertura){
      consultas = await db.rawQuery(SELECT_CONSULTA_INCLUDE_PACIENTE_MEDICO_COBERTURA);
    } else{
      consultas = await db.query(tableName, columns: ['ID_CONSULTA', 'DATA_CONSULTA', 'ID_PACIENTE', 'ID_MEDICO', 'ID_COBERTURA']);
    }
    return consultas.map((c)=> Consulta.fromMap(c, includePacienteMedicoCobertura: includePacienteMedicoCobertura)).toList();
  }

  @override
  Future insert(Consulta consulta) async {
    var db = await super.db;
    await db.insert(tableName, consulta.toMap());
  }

  @override
  Future update(Consulta consulta) async{
    var db = await super.db;
    await db.update(tableName, consulta.toMap(), where: 'ID_CONSULTA = ?', whereArgs: [consulta.id]);
  }
  @override
  Future delete(Consulta consulta) async{
    var db = await super.db;
    await db.delete(tableName, where: 'ID_CONSULTA = ?', whereArgs: [consulta.id]);
  }
}