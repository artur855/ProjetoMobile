import 'package:flutter/material.dart';
import 'package:projetomobile/model/estado.dart';
import 'package:projetomobile/repository/estado_repository.dart';
import 'package:projetomobile/store/estado/estado_form.dart';
import 'package:projetomobile/view/admin/estado/admin_estado_form_view.dart';
import 'package:provider/provider.dart';

class AdminEstadoEditView extends StatelessWidget {
  EstadoRepository estadoRepository;

  final Estado estado;

  AdminEstadoEditView({this.estado});

  @override
  Widget build(BuildContext context) {
    estadoRepository = Provider.of<EstadoRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar estado'),
        backgroundColor: Colors.green[200],
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: 32,
            ),
            onSelected: (value) async {
              switch (value) {
                case 0:
                  await estadoRepository.delete(estado);
                  Navigator.of(context).popUntil(ModalRoute.withName('/admin_estado'));
              }
            },
            itemBuilder: (context) {
              return [PopupMenuItem(child: Text('Deletar estado'), value: 0)];
            },
          )
        ],
      ),
      body: AdminEstadoFormView(
        onSubmit: onSubmit,
        buttonText: 'Atualizar',
        nome: estado.nome,
        sigla: estado.sigla,
      ),
    );
  }

  Future onSubmit(BuildContext context, EstadoForm estadoForm, EstadoRepository estadoRepository) async {
    if (estadoForm.validarAll()) {
      estado.nome = estadoForm.nome;
      estado.sigla = estadoForm.sigla;
      await estadoRepository.update(estado);
      Navigator.pop(context);
      estadoForm.clearControllers();
      estadoForm.dispose();
    }
  }
}
