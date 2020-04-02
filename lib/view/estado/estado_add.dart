import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/model/estado.dart';
import 'package:projetomobile/repository/estado_repository.dart';
import 'package:projetomobile/store/estado_store.dart';

class EstadoAddView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Adicionar estado'),
          backgroundColor: Colors.green[200],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[EstadoFormView()],
          ),
        ));
  }
}

class EstadoFormView extends StatelessWidget {
  EstadoForm estadoForm = EstadoForm();
  EstadoRepository estadoRepository = EstadoRepository();

  @override
  Widget build(BuildContext context) {
    estadoForm.criarValidacoes();
    return Container(
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
              child: Text('Adicionar'),
              onPressed: () async {
                if (estadoForm.isFormValido) {
                  await estadoRepository.addEstado(Estado(nome: estadoForm.nome, sigla: estadoForm.sigla));
                  Navigator.pop(context, true);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
