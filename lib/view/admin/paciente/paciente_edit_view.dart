import 'package:flutter/material.dart';
import 'package:projetomobile/model/paciente.dart';
import 'package:projetomobile/repository/paciente_repository.dart';
import 'package:projetomobile/repository/usuario_repository.dart';
import 'package:projetomobile/store/paciente/paciente_form.dart';
import 'package:projetomobile/view/admin/paciente/paciente_form_view.dart';
import 'package:provider/provider.dart';

class PacienteEditView extends StatelessWidget {
  final Paciente paciente;
  PacienteRepository pacienteRepository;
  UsuarioRepository usuarioRepository;

  PacienteEditView({this.paciente});

  @override
  Widget build(BuildContext context) {
    usuarioRepository = Provider.of<UsuarioRepository>(context);
    pacienteRepository = Provider.of<PacienteRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar paciente'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: 32,
            ),
            onSelected: (value) async {
              switch (value) {
                case 0:
                  await pacienteRepository.delete(paciente);
                  await usuarioRepository.delete(paciente);
                  Navigator.of(context).popUntil(ModalRoute.withName('/admin_paciente'));
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text('Deletar paciente'), value: 0),
              ];
            },
          )
        ],
      ),
      body: PacienteFormView(
        title: 'Atualizar',
        onSubmit: onSubmit,
        isRegisterForm: false,
      ),
    );
  }

  Future onSubmit(BuildContext context, PacienteForm pacienteForm, PacienteRepository pacienteRepository, UsuarioRepository usuarioRepository) async {
    if (pacienteForm.validarAll()) {
      paciente.nome = pacienteForm.nome;
      paciente.datNascimento = pacienteForm.datNascimentoStr;
      paciente.cpf = pacienteForm.cpf;
      paciente.rg = pacienteForm.rg;
      paciente.telefone = pacienteForm.telefone;
      paciente.endereco = pacienteForm.endereco;
      await pacienteRepository.update(paciente);
      pacienteForm.dispose();
      Navigator.pop(context);
    }
  }
}
