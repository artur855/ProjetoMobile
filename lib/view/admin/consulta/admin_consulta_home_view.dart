import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/repository/consulta_repository.dart';
import 'package:projetomobile/store/consulta/consulta_store.dart';
import 'package:projetomobile/view/admin/consulta/admin_consulta_add_view.dart';
import 'package:projetomobile/view/admin/consulta/admin_consulta_edit_view.dart';
import 'package:provider/provider.dart';

class AdminConsultaHomeView extends StatelessWidget {
  ConsultaRepository consultaRepository;
  ConsultaStore consultaStore = ConsultaStore();

  @override
  Widget build(BuildContext context) {
    consultaRepository = Provider.of<ConsultaRepository>(context);
    atualizarConsultas();
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta'),
        backgroundColor: Colors.redAccent,
      ),
      body: Observer(
        builder: (_) =>
            RefreshIndicator(
              onRefresh: atualizarConsultas,
              child: ListView.builder(
                padding: EdgeInsets.all(16.0),
                itemCount: consultaStore.consultas.length,
                itemBuilder: (context, i) {
                  var consulta = consultaStore.consultas[i];
                  return InkWell(
                    onTap: () async {
                      await Navigator.of(context).push(MaterialPageRoute(builder: (_) => AdminConsultaEditView(consulta: consulta)));
                      await atualizarConsultas();
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
                                'Data: ${consulta.data}',
                                style: TextStyle(fontSize: 28.0, color: Colors.grey[700]),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Paciente: ${consulta.paciente.nome}',
                                style: TextStyle(fontSize: 16.0, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Médico: ${consulta.medico.nome}',
                                style: TextStyle(fontSize: 16.0, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Cobertura: ${consulta.cobertura.dsc}',
                                style: TextStyle(fontSize: 16.0, color: Colors.grey),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.calendar_today,
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
        backgroundColor: Colors.redAccent,
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdminConsultaAddView()));
          await atualizarConsultas();
        },
      ),
    );
  }

  Future atualizarConsultas() async {
    var consultas = await consultaRepository.getAll();
    consultaStore.atualizarConsultas(consultas);
  }
}
