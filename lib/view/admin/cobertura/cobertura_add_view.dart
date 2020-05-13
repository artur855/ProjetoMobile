import 'package:flutter/material.dart';
import 'package:projetomobile/model/cobertura.dart';
import 'package:projetomobile/repository/cobertura_repository.dart';
import 'package:projetomobile/store/cobertura/cobertura_form.dart';
import 'package:projetomobile/view/admin/cobertura/cobertura_form_view.dart';

class CoberturaAddView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar cobertura'),
        backgroundColor: Colors.purple[200],
      ),
      body: CoberturaFormView(
        onSubmit: onSubmit,
        buttonText: 'Adicionar',
      ),
    );
  }

  Future onSubmit(BuildContext context, CoberturaForm coberturaForm, CoberturaRepository coberturaRepository) async {
    if (coberturaForm.validarAll()) {
      Cobertura cobertura = Cobertura(
        dsc: coberturaForm.dsc,
      );
      await coberturaRepository.insert(cobertura);
      coberturaForm.dispose();
      Navigator.pop(context);
    }
  }
}
