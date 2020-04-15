import 'package:projetomobile/model/endereco.dart';
import 'package:projetomobile/repository/base_repository.dart';
import 'package:projetomobile/repository/sql/endereco_sql.dart';
import 'package:sqflite_common/sqlite_api.dart';

class EnderecoRepository extends BaseRepository<Endereco> {
  @override
  String tableName = 'ENDERECO';

  @override
  Future<List<Endereco>> getAll({bool includeEstado: false}) async {
    var db = await super.db;
    var enderecos = List<Map>();
    if (includeEstado) {
      enderecos = await db.rawQuery(SELECT_ENDERECO_INCLUDE_ESTADO.trim());
    } else {
      enderecos = await db.query(tableName, columns: ['ID_ENDERECO', 'CIDADE', 'LOGRADOURO', 'CEP', 'ID_ESTADO']);
    }
    return enderecos.map((e) => Endereco.fromMap(e, includeEstado: includeEstado)).toList();
  }

  @override
  Future insert(Endereco endereco) async {
    var db = await super.db;
    await db.insert(tableName, endereco.toMap());
  }

  @override
  Future update(Endereco endereco) async {
    var db = await super.db;
    await db.update(tableName, endereco.toMap(), where: 'ID_ENDERECO = ?', whereArgs: [endereco.id]);
  }

  @override
  Future delete(Endereco endereco) async {
    var db = await super.db;
    await db.delete(tableName, where: 'ID_ENDERECO = ?', whereArgs: [endereco.id]);
  }
}
