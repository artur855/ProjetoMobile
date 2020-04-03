import 'package:flutter/material.dart';
import 'package:projetomobile/model/estado.dart';
import 'package:projetomobile/repository/estado_repository.dart';
import 'package:projetomobile/store/estado_store.dart';
import 'package:projetomobile/view/estado/estado_form.dart';

class EstadoAddView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar estado'),
        backgroundColor: Colors.green[200],
      ),
      body: EstadoFormView(
        onSubmit: onSubmit,
        buttonText: 'Adicionar',
      ),
    );
  }

  Future onSubmit(BuildContext context, EstadoForm estadoForm, EstadoRepository estadoRepository) async {
    if (estadoForm.isFormValido) {
      await estadoRepository.addEstado(Estado(nome: estadoForm.nome, sigla: estadoForm.sigla));
      Navigator.pop(context);
    } else {
      estadoForm.validarAll();
    }
  }
}
