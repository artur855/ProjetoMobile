import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/repository/cobertura_repository.dart';
import 'package:projetomobile/store/cobertura/cobertura_form.dart';

class CoberturaFormView extends StatelessWidget {
  final CoberturaForm coberturaForm = CoberturaForm();
  final CoberturaRepository coberturaRepository = CoberturaRepository();

  final Function(BuildContext context, CoberturaForm coberturaForm, CoberturaRepository coberturaRepository) onSubmit;
  final String buttonText;

  CoberturaFormView({this.onSubmit, this.buttonText});

  @override
  Widget build(BuildContext context) {
    coberturaForm.criarValidacoes();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => coberturaForm.dsc = value,
                  decoration: InputDecoration(labelText: 'Descrição:', hintText: 'Insira a cobertura', errorText: coberturaForm.msgDsc),
                ),
              ),
              RaisedButton(
                color: Colors.purple[200],
                child: Text(buttonText),
                onPressed: () async {
                  await onSubmit(context, coberturaForm, coberturaRepository);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
