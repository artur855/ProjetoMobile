import 'package:flutter/material.dart';
import 'package:projetomobile/model/paciente.dart';
import 'package:projetomobile/model/usuario.dart';
import 'package:projetomobile/repository/paciente_repository.dart';
import 'package:projetomobile/repository/usuario_repository.dart';
import 'package:projetomobile/store/paciente/paciente_form.dart';
import 'package:projetomobile/view/admin/paciente/paciente_form_view.dart';

class PacienteAddView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar paciente'),
        backgroundColor: Colors.blue,
      ),
      body: PacienteFormView(
        title: 'Adicionar',
        onSubmit: onSubmit,
        isRegisterForm: true,
      ),
    );
  }

  Future onSubmit(BuildContext context, PacienteForm pacienteForm, PacienteRepository pacienteRepository, UsuarioRepository usuarioRepository) async {
    if (pacienteForm.validarAll()) {
      var usuario = Usuario(
        login: pacienteForm.login,
        senha: pacienteForm.senha,
      );
      try {
        var idUsuario = await usuarioRepository.insert(usuario);
        var paciente = Paciente(
          id: idUsuario,
          nome: pacienteForm.nome,
          datNascimento: pacienteForm.datNascimentoStr,
          cpf: pacienteForm.cpf,
          rg: pacienteForm.rg,
          telefone: pacienteForm.telefone,
          endereco: pacienteForm.endereco,
        );
        await pacienteRepository.insert(paciente);
        pacienteForm.dispose();
        Navigator.of(context).pop();
      }
      catch (e){
        pacienteForm.setMsgLogin('Já existe um usúario com este login');
      }
    }
  }
}
