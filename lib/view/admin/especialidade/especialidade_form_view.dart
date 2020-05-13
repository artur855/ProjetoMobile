import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/repository/especialidade_repository.dart';
import 'package:projetomobile/store/especialidade/especialidade_form.dart';

class EspecialidadeFormView extends StatelessWidget {
  final EspecialidadeForm especialidadeForm = EspecialidadeForm();
  final EspecialidadeRepository especialidadeRepository = EspecialidadeRepository();

  final Function(BuildContext context, EspecialidadeForm especialidadeForm, EspecialidadeRepository especialidadeRepository) onSubmit;
  final String buttonText;

  EspecialidadeFormView({this.onSubmit, this.buttonText});

  @override
  Widget build(BuildContext context) {
    especialidadeForm.criarValidacoes();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => especialidadeForm.dsc = value,
                  decoration: InputDecoration(labelText: 'Descrição:', hintText: 'Insira a especialidade', errorText: especialidadeForm.msgDsc),
                ),
              ),
              RaisedButton(
                color: Colors.brown[200],
                child: Text(buttonText),
                onPressed: () async {
                  await onSubmit(context, especialidadeForm, especialidadeRepository);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
