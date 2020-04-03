import 'package:projetomobile/model/estado.dart';
import 'package:projetomobile/repository/base_repository.dart';

class EstadoRepository extends BaseRepository {

  final String tableName = 'ESTADO';

  Future<List<Estado>> getAllEstados() async{
    var db = await super.db;
    var estados = await db.query(tableName, columns: ['id', 'nome', 'sigla']);
    return estados.map((map) => Estado.fromMap(map)).toList();
  }

  Future addEstado(Estado estado) async{
    var db = await super.db;
    await db.insert(tableName, estado.toMap());
  }

  Future updateEstado(Estado estado) async {
    var db = await super.db;
    await db.update(tableName, estado.toMap(), where: 'id = ?', whereArgs: [estado.id]);
  }

  Future deletarEstado(Estado estado) async {
    var db = await super.db;
    await db.delete(tableName, where: 'id = ?', whereArgs: [estado.id]);
  }


}
