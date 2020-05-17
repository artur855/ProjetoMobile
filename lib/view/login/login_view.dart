import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/repository/usuario_repository.dart';
import 'package:projetomobile/store/login/login_form.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  LoginForm loginForm = LoginForm();

  UsuarioRepository usuarioRepository;

  @override
  Widget build(BuildContext context) {
    loginForm.criarValidacoes();
    usuarioRepository = Provider.of<UsuarioRepository>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Hospital VivaSaude',
                    style: TextStyle(fontSize: 42),
                  ),
                  SizedBox(height: 35),
                  Observer(
                    builder: (_) => TextField(
                      onChanged: (value) => loginForm.login = value.trim(),
                      decoration: InputDecoration(labelText: 'Usuário:', errorText: loginForm.msgLogin),
                    ),
                  ),
                  SizedBox(height: 15),
                  Observer(
                    builder: (_) => TextField(
                      onChanged: (value) => loginForm.senha = value.trim(),
                      decoration: InputDecoration(labelText: 'Senha:', errorText: loginForm.msgSenha),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 25),
                  Observer(
                    builder: (_) => InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Tipo de login',
                        labelStyle: TextStyle(),
                        errorText: loginForm.msgRadio,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: loginForm.radioSelected,
                          items: _radioOptions(),
                          onChanged: (value) {
                            loginForm.setRadio(value);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  RaisedButton(
                    child: Text('Entrar'),
                    onPressed: () async {
                      if (loginForm.validarAll()) {
                        await _loginUser(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.lightGreenAccent, Colors.green], begin: Alignment.topCenter, tileMode: TileMode.clamp),
        ),
      ),
    );
  }

  List<DropdownMenuItem> _radioOptions() {
    var items = [
      {'id': 1, 'dsc': 'Paciente'},
      {'id': 2, 'dsc': 'Médico'},
      {'id': 3, 'dsc': 'Admin'},
    ];
    return items.map((i) => DropdownMenuItem(value: i['id'], child: Text(i['dsc']))).toList();
  }

  Future _loginUser(BuildContext context) async {
    bool authenticated = await usuarioRepository.autenticar(loginForm.login, loginForm.senha);
    if (authenticated) {
      switch (loginForm.radioSelected) {
        case 1:
          if (await usuarioRepository.isUsuarioPaciente(loginForm.login)) {
            loginForm.dispose();
            Navigator.of(context).pushNamed('/paciente_home');
          } else {
            _mostrarErroLogin(context);
          }
          break;
        case 2:
          if (await usuarioRepository.isUsuarioMedico(loginForm.login)) {
            loginForm.dispose();
            Navigator.of(context).pushNamed('/medico_home');
          } else {
            _mostrarErroLogin(context);
          }
          break;
        case 3:
          if (loginForm.login == 'admin') {
            loginForm.dispose();
            Navigator.of(context).pushNamed('/admin_home');
          } else {
            _mostrarErroLogin(context);
          }
          break;
      }
    } else {
      _mostrarErroLogin(context);
    }
  }

  void _mostrarErroLogin(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Usuario ou senha inválidos'),
      ),
    );
  }
}
