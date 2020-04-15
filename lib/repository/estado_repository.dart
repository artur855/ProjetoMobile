import 'package:projetomobile/model/estado.dart';
import 'package:projetomobile/repository/base_repository.dart';

class EstadoRepository extends BaseRepository<Estado> {

  @override
  final String tableName = 'ESTADO';

  @override
  Future<List<Estado>> getAll() async{
    var db = await super.db;
    var estados = await db.query(tableName, columns: ['ID_ESTADO', 'NOME_ESTADO', 'SIGLA']);
    return estados.map((map) => Estado.fromMap(map)).toList();
  }

  @override
  Future insert(Estado estado) async{
    var db = await super.db;
    await db.insert(tableName, estado.toMap());
  }

  @override
  Future update(Estado estado) async {
    var db = await super.db;
    await db.update(tableName, estado.toMap(), where: 'ID_ESTADO = ?', whereArgs: [estado.id]);
  }

  Future delete(Estado estado) async {
    var db = await super.db;
    await db.delete(tableName, where: 'ID_ESTADO = ?', whereArgs: [estado.id]);
  }


}
