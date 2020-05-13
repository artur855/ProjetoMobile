import 'package:projetomobile/model/cobertura.dart';
import 'package:projetomobile/repository/base_repository.dart';

class CoberturaRepository extends BaseRepository<Cobertura> {

  @override
  final String tableName = 'COBERTURA';

  @override
  Future<List<Cobertura>> getAll() async{
    var db = await super.db;
    var corberturas = await db.query(tableName, columns: ['ID_COBERTURA', 'DSC_COBERTURA']);
    return corberturas.map((map) => Cobertura.fromMap(map)).toList();
  }

  @override
  Future insert(Cobertura corbertura) async{
    var db = await super.db;
    await db.insert(tableName, corbertura.toMap());
  }

  @override
  Future update(Cobertura corbertura) async {
    var db = await super.db;
    await db.update(tableName, corbertura.toMap(), where: 'ID_COBERTURA = ?', whereArgs: [corbertura.id]);
  }

  Future delete(Cobertura corbertura) async {
    var db = await super.db;
    await db.delete(tableName, where: 'ID_COBERTURA = ?', whereArgs: [corbertura.id]);
  }


}
