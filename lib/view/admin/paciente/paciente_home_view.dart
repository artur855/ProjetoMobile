import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/repository/paciente_repository.dart';
import 'package:projetomobile/store/paciente/paciente_store.dart';
import 'package:projetomobile/view/admin/paciente/paciente_add_view.dart';
import 'package:projetomobile/view/admin/paciente/paciente_edit_view.dart';
import 'package:provider/provider.dart';

class AdminPacienteHomeView extends StatelessWidget {
  final PacienteStore pacienteStore = PacienteStore();
  PacienteRepository pacienteRepository;

  @override
  Widget build(BuildContext context) {
    pacienteRepository = Provider.of<PacienteRepository>(context);
    atualizarPacientes();
    return Scaffold(
      appBar: AppBar(
        title: Text('Paciente'),
        backgroundColor: Colors.blue,
      ),
      body: Observer(
        builder: (_) => RefreshIndicator(
          onRefresh: atualizarPacientes,
          child: ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: pacienteStore.pacientes.length,
            itemBuilder: (context, i) {
              var paciente = pacienteStore.pacientes[i];
              return InkWell(
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(builder: (_) => PacienteEditView(paciente: paciente)));
                  await atualizarPacientes();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${paciente.nome}',
                            style: TextStyle(fontSize: 28.0, color: Colors.grey[700]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'CPF: ${paciente.cpfFormated}',
                            style: TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'RG: ${paciente.rgFormated}',
                            style: TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                          Text(
                            'Telefone: ${paciente.telefone}',
                            style: TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.healing,
                        size: 40,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.blue,
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => PacienteAddView()));
          await atualizarPacientes();
        },
      ),
    );
  }

  Future atualizarPacientes() async {
    var pacientes = await pacienteRepository.getAll();
    pacienteStore.updatePacientes(pacientes);
  }
}
