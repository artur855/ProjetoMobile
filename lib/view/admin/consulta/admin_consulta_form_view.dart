import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/model/cobertura.dart';
import 'package:projetomobile/model/medico.dart';
import 'package:projetomobile/model/paciente.dart';
import 'package:projetomobile/repository/base_repository.dart';
import 'package:projetomobile/repository/cobertura_repository.dart';
import 'package:projetomobile/repository/consulta_repository.dart';
import 'package:projetomobile/repository/medico_repository.dart';
import 'package:projetomobile/repository/paciente_repository.dart';
import 'package:projetomobile/store/consulta/consulta_form.dart';
import 'package:provider/provider.dart';

class AdminConsultaFormView extends StatelessWidget {
  final String title;
  final Function(BuildContext context, ConsultaForm consultaForm, ConsultaRepository consultaRepository) onSubmit;
  final _formKey = GlobalKey();
  final ConsultaForm consultaForm = ConsultaForm();

  ConsultaRepository consultaRepository;
  PacienteRepository pacienteRepository;
  MedicoRepository medicoRepository;
  CoberturaRepository coberturaRepository;

  AdminConsultaFormView({this.title, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    consultaRepository = Provider.of<ConsultaRepository>(context);
    pacienteRepository = Provider.of<PacienteRepository>(context);
    medicoRepository = Provider.of<MedicoRepository>(context);
    coberturaRepository = Provider.of<CoberturaRepository>(context);
    consultaForm.criarValidacoes();

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
                        var dataConsulta = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );
                        consultaForm.data = dataConsulta;
                      },
                      child: Text(consultaForm.dataStr ?? 'Escolha a data da consulta'),
                    ),
                  ),
                ),
                _dropDownPaciente(),
                _dropDownMedico(),
                _dropDownCobertura(),
                RaisedButton(
                  onPressed: () async {
                    await onSubmit(context, consultaForm, consultaRepository);
                  },
                  color: Colors.redAccent,
                  child: Text(title),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dropDownPaciente() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: FutureBuilder(
        future: pacienteRepository.getAll(),
        builder: (context, snapshot) {
          List<Paciente> pacientes = snapshot.data;
          if (pacientes == null) {
            return Text('Sem pacientes');
          }
          List<DropdownMenuItem> itemsPacientes = pacientes
              .map((paciente) => DropdownMenuItem(
                    value: paciente,
                    child: Text('${paciente.nome} - ${paciente.cpfFormated}'),
                  ))
              .toList();
          return Observer(
            builder: (_) => InputDecorator(
              decoration: InputDecoration(
                labelText: 'Pacientes',
                labelStyle: TextStyle(),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                errorText: consultaForm.msgPaciente,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: consultaForm.paciente,
                  items: itemsPacientes,
                  onChanged: (value) {
                    consultaForm.paciente = value;
                  },
                ),
              ),
            ),
          );
        },
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
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                errorText: consultaForm.msgMedico,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: consultaForm.medico,
                  items: itemsMedicos,
                  onChanged: (value) {
                    consultaForm.medico = value;
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
                errorText: consultaForm.msgCobertura,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: consultaForm.cobertura,
                  items: itemsCoberturas,
                  onChanged: (value) {
                    consultaForm.cobertura = value;
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
