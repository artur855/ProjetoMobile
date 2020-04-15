import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/repository/medico_repository.dart';
import 'package:projetomobile/store/medico/medico_store.dart';
import 'package:projetomobile/view/medico/medico_add_view.dart';
import 'package:projetomobile/view/medico/medico_edit_view.dart';


class MedicoHomeView extends StatelessWidget {
  final MedicoStore medicoStore  = MedicoStore();
  final MedicoRepository medicoRepository = MedicoRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado'),
        backgroundColor: Colors.green[200],
      ),
      body: Observer(
        builder: (_) => RefreshIndicator(
          onRefresh: atualizarMedicos,
          child: ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: medicoStore.medicos.length,
            itemBuilder: (context, i) {
              var medico = medicoStore.medicos[i];
              return InkWell(
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(builder: (_) => MedicoEditView(medico: medico)));
                  await atualizarMedicos();
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
                            medico.nome,
                            style: TextStyle(fontSize: 28.0, color: Colors.grey[700]),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '${medico.crm}',
                            style: TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.adjust,
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
        backgroundColor: Colors.green[200],
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => MedicoAddView()));
          await atualizarMedicos();
        },
      ),
    );

  }

  Future atualizarMedicos() async {
    var medicos = await medicoRepository.getAll();
    medicoStore.updateMedicos(medicos);
  }
}
