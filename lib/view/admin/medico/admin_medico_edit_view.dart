import 'package:flutter/material.dart';
import 'package:projetomobile/model/medico.dart';
import 'package:projetomobile/repository/medico_repository.dart';
import 'package:projetomobile/repository/usuario_repository.dart';
import 'package:projetomobile/store/medico/medico_form.dart';
import 'package:projetomobile/view/admin/medico/admin_medico_form_view.dart';
import 'package:provider/provider.dart';

class MedicoEditView extends StatelessWidget {
  final Medico medico;
  MedicoRepository medicoRepository;
  UsuarioRepository usuarioRepository;

  MedicoEditView({this.medico});

  @override
  Widget build(BuildContext context) {
    usuarioRepository = Provider.of<UsuarioRepository>(context);
    medicoRepository = Provider.of<MedicoRepository>(context);
    print(medico);
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar endereco'),
        backgroundColor: Colors.red[200],
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: 32,
            ),
            onSelected: (value) async {
              switch (value) {
                case 0:
                  await medicoRepository.delete(medico);
                  await usuarioRepository.delete(medico);
                  Navigator.of(context).popUntil(ModalRoute.withName('/admin_medico'));
              }
            },
            itemBuilder: (context) {
              return [PopupMenuItem(child: Text('Deletar médico'), value: 0)];
            },
          )
        ],
      ),
      body: MedicoFormView(
        title: 'Atualizar',
        onSubmit: onSubmit,
        isRegisterForm: false,
      ),
    );
  }

  Future onSubmit(BuildContext context, MedicoForm medicoForm, MedicoRepository medicoRepository, UsuarioRepository usuarioRepository) async {
    if (medicoForm.validarAll()) {
      medico.nome = medicoForm.nome;
      medico.crm = medicoForm.crm;
      medico.especialidade = medicoForm.especialidade;
      await medicoRepository.update(medico);
      medicoForm.dispose();
      Navigator.pop(context);
    }
  }
}
