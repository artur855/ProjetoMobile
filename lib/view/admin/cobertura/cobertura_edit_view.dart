import 'package:flutter/material.dart';
import 'package:projetomobile/model/cobertura.dart';
import 'package:projetomobile/repository/cobertura_repository.dart';
import 'package:projetomobile/store/cobertura/cobertura_form.dart';
import 'package:projetomobile/view/admin/cobertura/cobertura_form_view.dart';

class CoberturaEditView extends StatelessWidget {
  final CoberturaRepository coberturaRepository = CoberturaRepository();
  final Cobertura cobertura;

  CoberturaEditView({this.cobertura});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar cobertura'),
        backgroundColor: Colors.purple[200],
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: 32,
            ),
            onSelected: (value) async {
              switch (value) {
                case 0:
                  await coberturaRepository.delete(cobertura);
                  Navigator.of(context).popUntil(ModalRoute.withName('/admin_cobertura'));
              }
            },
            itemBuilder: (context) {
              return [PopupMenuItem(child: Text('Deletar cobertura'), value: 0)];
            },
          )
        ],
      ),
      body: CoberturaFormView(
        onSubmit: onSubmit,
        buttonText: 'Atualizar',
      ),
    );
  }

  Future onSubmit(BuildContext context, CoberturaForm coberturaForm, CoberturaRepository coberturaRepository) async {
    if (coberturaForm.validarAll()) {
      cobertura.dsc = coberturaForm.dsc;
      await coberturaRepository.update(cobertura);
      coberturaForm.dispose();
      Navigator.pop(context);
    }
  }
}
