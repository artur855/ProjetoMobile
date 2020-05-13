import 'package:projetomobile/model/usuario.dart';
import 'package:projetomobile/repository/base_repository.dart';
import 'package:projetomobile/repository/sql/usuario_sql.dart';

class UsuarioRepository extends BaseRepository<Usuario> {
  @override
  final String tableName = 'USUARIO';

  Usuario usuarioLogado;

  void logout() {
    usuarioLogado = null;
  }

  Future<bool> autenticar(String login, String senha) async {
    var db = await super.db;
    var usuarios = await db.query(this.tableName, where: 'login = ? and senha = ?', whereArgs: [login, senha], limit: 1);
    if (usuarios.length != 1) {
      return false;
    }
    var usuario = Usuario.fromMap(usuarios[0]);
    if (usuario != null) {
      usuarioLogado = usuario;
      return true;
    }
    return false;
  }

  Future<bool> isUsuarioPaciente(String login) async {
    var db = await super.db;
    var result = await db.rawQuery(SELECT_IS_USUARIO_PACIENTE, [login]);
    return result.length > 0;
  }

  Future<bool> isUsuarioMedico(String login) async {
    var db = await super.db;
    var result = await db.rawQuery(SELECT_IS_USUARIO_MEDICO, [login]);
    return result.length > 0;
  }

  @override
  Future<List<Usuario>> getAll() {
    // TODO: implement getAll
    return null;
  }

  @override
  Future<int> insert(Usuario usuario) async {
    var db = await super.db;
    var id = await db.insert(tableName, usuario.toMap());
    return id;
  }

  @override
  Future update(Usuario usuario) async {
    var db = await super.db;
    await db.update(tableName, usuario.toMap(), where: 'ID_USUARIO = ?', whereArgs: [usuario.id]);
  }

  @override
  Future delete(Usuario usuario) async {
    var db = await super.db;
    await db.delete(tableName, where: 'ID_USUARIO = ?', whereArgs: [usuario.id]);
  }
}
