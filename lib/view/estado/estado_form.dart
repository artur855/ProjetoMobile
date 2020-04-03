import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/repository/estado_repository.dart';
import 'package:projetomobile/store/estado_store.dart';

class EstadoFormView extends StatelessWidget {
  final EstadoForm estadoForm = EstadoForm();
  final EstadoRepository estadoRepository = EstadoRepository();
  final Function(BuildContext context, EstadoForm estadoForm, EstadoRepository estadoRepository) onSubmit;
  final String buttonText;
  final String initialNome;
  final String initialSigla;

  EstadoFormView({this.onSubmit, this.buttonText, this.initialNome, this.initialSigla});

  @override
  Widget build(BuildContext context) {
    estadoForm.criarValidacoes();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
            child: Form(
              child: Column(
                children: <Widget>[
                  Observer(
                    builder: (_) => TextField(
                      onChanged: (value) => estadoForm.nome = value,
                      decoration: InputDecoration(labelText: 'Nome:', hintText: 'Insira o nome do estado', errorText: estadoForm.msgNome),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Observer(
                    builder: (_) => TextField(
                      onChanged: (value) => estadoForm.sigla = value,
                      decoration: InputDecoration(labelText: 'Sigla:', hintText: 'Insira a sigla do estado', errorText: estadoForm.msgSigla),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  RaisedButton(
                    color: Colors.green[200],
                    child: Text(buttonText),
                    onPressed: () async {
                      await onSubmit(context, estadoForm, estadoRepository);
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}