import 'package:flutter/material.dart';
import 'package:projetomobile/model/especialidade.dart';
import 'package:projetomobile/repository/especialidade_repository.dart';
import 'package:projetomobile/store/especialidade/especialidade_form.dart';
import 'package:projetomobile/view/admin/especialidade/especialidade_form_view.dart';

class EspecialidadeEditView extends StatelessWidget {
  final EspecialidadeRepository especialidadeRepository = EspecialidadeRepository();
  final Especialidade especialidade;

  EspecialidadeEditView({this.especialidade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar especialidade'),
        backgroundColor: Colors.brown[200],
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: 32,
            ),
            onSelected: (value) async {
              switch (value) {
                case 0:
                  await especialidadeRepository.delete(especialidade);
                  Navigator.of(context).popUntil(ModalRoute.withName('/admin_especialidade'));
              }
            },
            itemBuilder: (context) {
              return [PopupMenuItem(child: Text('Deletar especialidade'), value: 0)];
            },
          )
        ],
      ),
      body: EspecialidadeFormView(
        onSubmit: onSubmit,
        buttonText: 'Atualizar',
      ),
    );
  }

  Future onSubmit(BuildContext context, EspecialidadeForm especialidadeForm, EspecialidadeRepository especialidadeRepository) async {
    if (especialidadeForm.validarAll()) {
      especialidade.dsc = especialidadeForm.dsc;
      await especialidadeRepository.update(especialidade);
      especialidadeForm.dispose();
      Navigator.pop(context);
    }
  }
}
