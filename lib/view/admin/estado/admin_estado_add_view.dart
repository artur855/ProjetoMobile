import 'package:flutter/material.dart';
import 'package:projetomobile/model/estado.dart';
import 'package:projetomobile/repository/estado_repository.dart';
import 'package:projetomobile/store/estado/estado_form.dart';
import 'package:projetomobile/view/admin/estado/admin_estado_form_view.dart';

class AdminEstadoAddView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar estado'),
        backgroundColor: Colors.green[200],
      ),
      body: AdminEstadoFormView(
        onSubmit: onSubmit,
        buttonText: 'Adicionar',
      ),
    );
  }

  Future onSubmit(BuildContext context, EstadoForm estadoForm, EstadoRepository estadoRepository) async {
    if (estadoForm.validarAll()) {
      Estado estado = Estado(
        nome: estadoForm.nome,
        sigla: estadoForm.sigla,
      );
      await estadoRepository.insert(estado);
      estadoForm.dispose();
      Navigator.pop(context);
    }
  }
}
