import 'package:projetomobile/model/especialidade.dart';
import 'package:projetomobile/repository/base_repository.dart';

class EspecialidadeRepository extends BaseRepository<Especialidade> {

  @override
  final String tableName = 'ESPECIALIDADE';

  @override
  Future<List<Especialidade>> getAll() async{
    var db = await super.db;
    var especialidades = await db.query(tableName, columns: ['ID_ESPECIALIDADE', 'DSC_ESPECIALIDADE']);
    return especialidades.map((map) => Especialidade.fromMap(map)).toList();
  }

  @override
  Future insert(Especialidade especialidade) async{
    var db = await super.db;
    await db.insert(tableName, especialidade.toMap());
  }

  @override
  Future update(Especialidade especialidade) async {
    var db = await super.db;
    await db.update(tableName, especialidade.toMap(), where: 'ID_ESPECIALIDADE = ?', whereArgs: [especialidade.id]);
  }

  Future delete(Especialidade especialidade) async {
    var db = await super.db;
    await db.delete(tableName, where: 'ID_ESPECIALIDADE = ?', whereArgs: [especialidade.id]);
  }


}
