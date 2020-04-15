import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/model/estado.dart';
import 'package:projetomobile/repository/estado_repository.dart';
import 'package:projetomobile/store/estado/estado_form.dart';
import 'package:projetomobile/store/estado/estado_store.dart';
import 'package:projetomobile/view/estado/estado_form_view.dart';

class EstadoEditView extends StatelessWidget {
  final EstadoForm estadoForm = EstadoForm();
  final EstadoRepository estadoRepository = EstadoRepository();
  final Estado estado;

  EstadoEditView({this.estado});

  @override
  Widget build(BuildContext context) {
    estadoForm.criarValidacoes();
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
                  Navigator.of(context).popUntil(ModalRoute.withName('/estado'));
              }
            },
            itemBuilder: (context) {
              return [PopupMenuItem(child: Text('Deletar estado'), value: 0)];
            },
          )
        ],
      ),
      body: EstadoFormView(
        onSubmit: onSubmit,
        buttonText: 'Atualizar',
        initialNome: estado.nome,
        initialSigla: estado.sigla,
      ),
    );
  }

  Future onSubmit(BuildContext context, EstadoForm estadoForm, EstadoRepository estadoRepository) async {
    if (estadoForm.validarAll()) {
      estado.nome = estadoForm.nome;
      estado.sigla = estadoForm.sigla;
      await estadoRepository.update(estado);
      Navigator.pop(context);
    }
  }
}
