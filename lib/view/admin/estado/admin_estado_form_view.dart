import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/repository/estado_repository.dart';
import 'package:projetomobile/store/estado/estado_form.dart';
import 'package:provider/provider.dart';

class AdminEstadoFormView extends StatelessWidget {
  EstadoForm estadoForm;
  EstadoRepository estadoRepository;

  final Function(BuildContext context, EstadoForm estadoForm, EstadoRepository estadoRepository) onSubmit;
  final String buttonText;

  AdminEstadoFormView({this.onSubmit, this.buttonText, nome, sigla}) {
    estadoForm = EstadoForm();
    estadoForm.criarValidacoes(nome: nome, sigla: sigla);
  }

  @override
  Widget build(BuildContext context) {
    estadoRepository = Provider.of<EstadoRepository>(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => estadoForm.nome = value,
                  decoration: InputDecoration(labelText: 'Nome:', hintText: 'Insira o nome do estado', errorText: estadoForm.msgNome),
                  controller: estadoForm.nomeController,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => estadoForm.sigla = value,
                  decoration: InputDecoration(labelText: 'Sigla:', hintText: 'Insira a sigla do estado', errorText: estadoForm.msgSigla),
                  controller: estadoForm.siglaController,
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
    );
  }
}
