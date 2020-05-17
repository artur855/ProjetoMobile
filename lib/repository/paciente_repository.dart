import 'package:projetomobile/model/paciente.dart';
import 'package:projetomobile/repository/base_repository.dart';
import 'package:projetomobile/repository/sql/paciente_sql.dart';

class PacienteRepository extends BaseRepository<Paciente> {
  @override
  final String tableName = 'PACIENTE';

  @override
  Future<List<Paciente>> getAll({bool includeEndereco: true}) async{
    var db = await super.db;
    var pacientes = List<Map>();
    if (includeEndereco){
      pacientes = await db.rawQuery(SELECT_PACIENTE_INCLUDE_ENDERECO);
    } else{
      pacientes = await db.query(tableName, columns: ['ID_PACIENTE', 'NOME_PACIENTE', 'DAT_NASCIMENTO', 'TELEFONE_PACIENTE', 'CPF_PACIENTE', 'RG_PACIENTE', 'ID_ENDERECO']);
    }
    return pacientes.map((m)=> Paciente.fromMap(m, includeEndereco: includeEndereco)).toList();
  }

  @override
  Future insert(Paciente paciente) async{
    var db = await super.db;
    db.insert(tableName, paciente.toMap());
  }

  @override
  Future update(Paciente paciente) async{
    var db = await super.db;
    await db.update(tableName, paciente.toMap(), where: 'ID_PACIENTE = ?', whereArgs: [paciente.id]);
    return null;
  }

  @override
  Future delete(Paciente paciente) async{
    var db = await super.db;
    await db.delete(tableName, where: 'ID_PACIENTE = ?', whereArgs: [paciente.id]);
  }

  Future<Paciente> getByLogin(String login) async {
    var db = await super.db;
    var results = await db.rawQuery(SELECT_PACIENTE_BY_LOGIN, [login]);
    var paciente = Paciente.fromMap(results[0], includeEndereco: false);
    return paciente;
  }

}
