import 'dart:html';

import 'package:projetomobile/model/medico.dart';
import 'package:projetomobile/repository/base_repository.dart';
import 'package:projetomobile/repository/sql/medico_sql.dart';

class MedicoRepository extends BaseRepository<Medico>{

  @override
  String tableName = 'MEDICO';

  @override
  Future<List<Medico>> getAll({bool includeEndereco: false}) async {
    var db = await super.db;
    var medicos = List<Map>();
    if (includeEndereco){
      medicos = await db.rawQuery(SELECT_MEDICO_INCLUDE_ENDERECO);
    } else{
      medicos = await db.query(tableName, columns: ['ID_MEDICO', 'NOME_MEDICO', 'CRM', 'TELEFONE', 'ID_ENDERECO']);
    }
    return medicos.map((m)=> Medico.fromMap(m, includeEndereco: includeEndereco)).toList();
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