import 'package:flutter/material.dart';
import 'package:projetomobile/model/medico.dart';
import 'package:projetomobile/model/usuario.dart';
import 'package:projetomobile/repository/medico_repository.dart';
import 'package:projetomobile/repository/usuario_repository.dart';
import 'package:projetomobile/store/medico/medico_form.dart';
import 'package:projetomobile/view/admin/medico/admin_medico_form_view.dart';

class MedicoAddView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar médico'),
        backgroundColor: Colors.red[200],
      ),
      body: MedicoFormView(
        title: 'Adicionar',
        onSubmit: onSubmit,
        isRegisterForm: true,
      ),
    );
  }

  Future onSubmit(BuildContext context, MedicoForm medicoForm, MedicoRepository medicoRepository, UsuarioRepository usuarioRepository) async {
    if (medicoForm.validarAll()) {
      var usuario = Usuario(
        login: medicoForm.login,
        senha: medicoForm.senha,
      );
      try {
        var idUsuario = await usuarioRepository.insert(usuario);
        var medico = Medico(
          id: idUsuario,
          nome: medicoForm.nome,
          crm: medicoForm.crm,
          especialidade: medicoForm.especialidade,
        );
        await medicoRepository.insert(medico);
        medicoForm.dispose();
        Navigator.of(context).pop();
      } catch (e) {
        medicoForm.setLoginMsg('Já existe um usúario com este login');
      }
    }
  }
}
