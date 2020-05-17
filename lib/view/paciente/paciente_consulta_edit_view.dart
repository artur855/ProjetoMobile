import 'package:flutter/material.dart';
import 'package:projetomobile/model/consulta.dart';
import 'package:projetomobile/repository/consulta_repository.dart';
import 'package:projetomobile/repository/paciente_repository.dart';
import 'package:projetomobile/repository/usuario_repository.dart';
import 'package:projetomobile/store/paciente/marcar_consulta_form.dart';
import 'package:projetomobile/view/paciente/paciente_consulta_form_view.dart';
import 'package:provider/provider.dart';
class PacienteEditConsultaView extends StatelessWidget {
  Consulta consulta;

  PacienteEditConsultaView({this.consulta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remarcar consulta'),
      ),
      body: PacienteFormConsultaView(
        title: 'Remarcar consulta',
        onSubmit: onSubmit,
      ),
    );
  }
  Future onSubmit(BuildContext context, MarcarConsultaForm marcarConsultaForm, ConsultaRepository consultaRepository) async {
    if (marcarConsultaForm.validarAll()) {
      try {
        consulta.medico = marcarConsultaForm.medico;
        consulta.cobertura = marcarConsultaForm.cobertura;
        consulta.data = marcarConsultaForm.dataStr;
        await consultaRepository.update(consulta);
        marcarConsultaForm.dispose();
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
