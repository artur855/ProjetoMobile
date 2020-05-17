import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/model/cobertura.dart';
import 'package:projetomobile/model/medico.dart';
import 'package:projetomobile/repository/cobertura_repository.dart';
import 'package:projetomobile/repository/consulta_repository.dart';
import 'package:projetomobile/repository/medico_repository.dart';
import 'package:projetomobile/repository/paciente_repository.dart';
import 'package:projetomobile/store/paciente/marcar_consulta_form.dart';
import 'package:provider/provider.dart';

class PacienteFormConsultaView extends StatelessWidget {
  final String title;
  final Function(BuildContext context, MarcarConsultaForm remarcarConsultaForm, ConsultaRepository consultaRepository) onSubmit;
  final _formKey = GlobalKey();
  final MarcarConsultaForm marcarConsultaForm = MarcarConsultaForm();

  ConsultaRepository consultaRepository;
  PacienteRepository pacienteRepository;
  MedicoRepository medicoRepository;
  CoberturaRepository coberturaRepository;

  PacienteFormConsultaView({this.title, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    consultaRepository = Provider.of<ConsultaRepository>(context);
    pacienteRepository = Provider.of<PacienteRepository>(context);
    medicoRepository = Provider.of<MedicoRepository>(context);
    coberturaRepository = Provider.of<CoberturaRepository>(context);
    marcarConsultaForm.criarValidacoes();

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Observer(
                  builder: (_) => Container(
                    margin: EdgeInsets.all(12),
                    child: RaisedButton(
                      onPressed: () async {
                        var firstDate = DateTime.now();
                        var dataConsulta = await showDatePicker(
                          context: context,
                          initialDate: firstDate,
                          firstDate: firstDate,
                          lastDate: DateTime(2100),
                        );
                        marcarConsultaForm.data = dataConsulta;
                      },
                      child: Text(marcarConsultaForm.dataStr ?? 'Escolha a data da consulta'),
                    ),
                  ),
                ),
                _dropDownMedico(),
                _dropDownCobertura(),
                RaisedButton(
                  onPressed: () async {
                    await onSubmit(context, marcarConsultaForm, consultaRepository);
                  },
                  color: Colors.blue,
                  child: Text(title),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dropDownMedico() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: FutureBuilder(
        future: medicoRepository.getAll(),
        builder: (context, snapshot) {
          List<Medico> medicos = snapshot.data;
          if (medicos == null) {
            return Text('Sem medicos');
          }
          List<DropdownMenuItem> itemsMedicos = medicos
              .map((medico) => DropdownMenuItem(
            value: medico,
            child: Text('${medico.nome} - ${medico.crm} - ${medico.especialidade?.dsc}'),
          ))
              .toList();
          return Observer(
            builder: (_) => InputDecorator(
              decoration: InputDecoration(
                labelText: 'Médico',
                labelStyle: TextStyle(),
                errorText: marcarConsultaForm.msgMedico,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: marcarConsultaForm.medico,
                  items: itemsMedicos,
                  onChanged: (value) {
                    marcarConsultaForm.medico = value;
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _dropDownCobertura() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: FutureBuilder(
        future: coberturaRepository.getAll(),
        builder: (context, snapshot) {
          List<Cobertura> coberturas = snapshot.data;
          if (coberturas == null) {
            return Text('Sem coberturas');
          }
          List<DropdownMenuItem> itemsCoberturas = coberturas
              .map((cobertura) => DropdownMenuItem(
            value: cobertura,
            child: Text('${cobertura.dsc}'),
          ))
              .toList();
          return Observer(
            builder: (_) => InputDecorator(
              decoration: InputDecoration(
                labelText: 'Cobertura',
                labelStyle: TextStyle(),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                errorText: marcarConsultaForm.msgCobertura,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: marcarConsultaForm.cobertura,
                  items: itemsCoberturas,
                  onChanged: (value) {
                    marcarConsultaForm.cobertura = value;
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
