import 'package:flutter/material.dart';
import 'package:projetomobile/model/consulta.dart';
import 'package:projetomobile/repository/consulta_repository.dart';
import 'package:projetomobile/store/consulta/consulta_form.dart';
import 'package:projetomobile/view/admin/consulta/admin_consulta_form_view.dart';
import 'package:provider/provider.dart';

class AdminConsultaEditView extends StatelessWidget {
  final Consulta consulta;
  ConsultaRepository consultaRepository;

  AdminConsultaEditView({this.consulta});

  @override
  Widget build(BuildContext context) {
    consultaRepository = Provider.of<ConsultaRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar consulta'),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: 32,
            ),
            onSelected: (value) async {
              switch (value) {
                case 0:
                  await consultaRepository.delete(consulta);
                  Navigator.of(context).popUntil(ModalRoute.withName('/admin_consulta'));
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text('Deletar consulta'), value: 0),
              ];
            },
          )
        ],
      ),
      body: AdminConsultaFormView(
        title: 'Atualizar',
        onSubmit: onSubmit,
      ),
    );
  }

  Future onSubmit(BuildContext context, ConsultaForm consultaForm, ConsultaRepository consultaRepository) async {
    if (consultaForm.validarAll()) {
      consulta.data = consultaForm.dataStr;
      consulta.paciente = consultaForm.paciente;
      consulta.medico = consultaForm.medico;
      consulta.cobertura = consultaForm.cobertura;
      await consultaRepository.update(consulta);
      consultaForm.dispose();
      Navigator.pop(context);
    }
  }
}
