import 'package:flutter/material.dart';
import 'package:projetomobile/model/especialidade.dart';
import 'package:projetomobile/repository/especialidade_repository.dart';
import 'package:projetomobile/store/especialidade/especialidade_form.dart';
import 'package:projetomobile/view/admin/especialidade/especialidade_form_view.dart';

class EspecialidadeAddView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar especialidade'),
        backgroundColor: Colors.brown[200],
      ),
      body: EspecialidadeFormView(
        onSubmit: onSubmit,
        buttonText: 'Adicionar',
      ),
    );
  }

  Future onSubmit(BuildContext context, EspecialidadeForm especialidadeForm, EspecialidadeRepository especialidadeRepository) async {
    if (especialidadeForm.validarAll()) {
      Especialidade especialidade = Especialidade(
        dsc: especialidadeForm.dsc,
      );
      await especialidadeRepository.insert(especialidade);
      especialidadeForm.dispose();
      Navigator.pop(context);
    }
  }
}
