import 'package:projetomobile/model/medico.dart';
import 'package:projetomobile/repository/base_repository.dart';
import 'package:projetomobile/repository/sql/medico_sql.dart';


class MedicoRepository extends BaseRepository<Medico>{

  @override
  String tableName = 'MEDICO';

  @override
  Future<List<Medico>> getAll({bool includeEspecialidade: true}) async {
    var db = await super.db;
    var medicos = List<Map>();
    if (includeEspecialidade){
      medicos = await db.rawQuery(SELECT_MEDICO_INCLUDE_ESPECIALIDADE);
    } else{
      medicos = await db.query(tableName, columns: ['ID_MEDICO', 'NOME_MEDICO', 'CRM', 'ID_ESPECIALIDADE']);
    }
    return medicos.map((m)=> Medico.fromMap(m, includeEspecialidade: includeEspecialidade)).toList();
  }

  @override
  Future insert(Medico medico) async {
    var db = await super.db;
    await db.insert(tableName, medico.toMap());
  }

  @override
  Future update(Medico medico) async {
    var db = await super.db;
    await db.update(tableName, medico.toMap(), where: 'ID_MEDICO = ?', whereArgs: [medico.id]);
  }

  @override
  Future delete(Medico medico) async {
    var db = await super.db;
    await db.delete(tableName, where: 'ID_MEDICO = ?', whereArgs: [medico.id]);
  }
}