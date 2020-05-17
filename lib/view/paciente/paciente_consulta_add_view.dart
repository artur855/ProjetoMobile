import 'package:flutter/material.dart';
import 'package:projetomobile/model/consulta.dart';
import 'package:projetomobile/repository/consulta_repository.dart';
import 'package:projetomobile/repository/paciente_repository.dart';
import 'package:projetomobile/repository/usuario_repository.dart';
import 'package:projetomobile/store/paciente/marcar_consulta_form.dart';
import 'package:projetomobile/view/paciente/paciente_consulta_edit_view.dart';
import 'package:provider/provider.dart';

import 'paciente_consulta_form_view.dart';

class PacienteAddConsultaView extends StatelessWidget {
  PacienteRepository pacienteRepository;
  UsuarioRepository usuarioRepository;

  PacienteAddConsultaView();

  @override
  Widget build(BuildContext context) {
    usuarioRepository = Provider.of<UsuarioRepository>(context);
    pacienteRepository = Provider.of<PacienteRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Marcar consulta'),
      ),
      body: PacienteFormConsultaView(
        title: 'Marcar',
        onSubmit: onSubmit,
      ),
    );
  }

  Future onSubmit(BuildContext context, MarcarConsultaForm marcarConsultaForm, ConsultaRepository consultaRepository) async {
    if (marcarConsultaForm.validarAll()) {
      try {
        var login = usuarioRepository.usuarioLogado.login;
        var paciente = await pacienteRepository.getByLogin(login);
        var consulta = Consulta(
          data: marcarConsultaForm.dataStr,
          paciente: paciente,
          medico: marcarConsultaForm.medico,
          cobertura: marcarConsultaForm.cobertura,
        );
        await consultaRepository.insert(consulta);
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
