import 'package:flutter/material.dart';
import 'package:projetomobile/model/consulta.dart';
import 'package:projetomobile/repository/consulta_repository.dart';
import 'package:projetomobile/store/consulta/consulta_form.dart';
import 'package:projetomobile/view/admin/consulta/admin_consulta_form_view.dart';

class AdminConsultaAddView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar consulta'),
        backgroundColor: Colors.redAccent,
      ),
      body: AdminConsultaFormView(
        title: 'Adicionar',
        onSubmit: onSubmit,
      ),
    );
  }

  Future onSubmit(BuildContext context, ConsultaForm consultaForm, ConsultaRepository consultaRepository) async {
    if (consultaForm.validarAll()) {
      try {
        var consulta = Consulta(
          data: consultaForm.dataStr,
          paciente: consultaForm.paciente,
          medico: consultaForm.medico,
          cobertura: consultaForm.cobertura,
        );
        await consultaRepository.insert(consulta);
        consultaForm.dispose();
        Navigator.of(context).pop();
      } catch (e) {
        await showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Médico ou paciente já possui consulta marcada'),
          ),
        );
      }
    }
  }
}
