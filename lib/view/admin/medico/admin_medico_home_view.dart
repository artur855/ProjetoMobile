import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/repository/medico_repository.dart';
import 'package:projetomobile/store/medico/medico_store.dart';
import 'package:projetomobile/view/admin/medico/admin_medico_add_view.dart';
import 'package:projetomobile/view/admin/medico/admin_medico_edit_view.dart';
import 'package:provider/provider.dart';

class AdminMedicoHomeView extends StatelessWidget {
  final MedicoStore medicoStore = MedicoStore();
  MedicoRepository medicoRepository;

  @override
  Widget build(BuildContext context) {
    medicoRepository = Provider.of<MedicoRepository>(context);
    updateMedicos();
    return Scaffold(
      appBar: AppBar(
        title: Text('Médico'),
        backgroundColor: Colors.red[200],
      ),
      body: Observer(
        builder: (_) => RefreshIndicator(
          onRefresh: updateMedicos,
          child: ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: medicoStore.medicos.length,
            itemBuilder: (context, i) {
              var medico = medicoStore.medicos[i];
              return InkWell(
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(builder: (_) => MedicoEditView(medico: medico)));
                  await updateMedicos();
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
                          Row(
                            children: <Widget>[
                              Text(
                                '${medico.nome}',
                                style: TextStyle(fontSize: 28.0, color: Colors.grey[700]),
                              ),
                              SizedBox(width: 10,),
                              Text(
                                '(${medico.especialidade.dsc})',
                                style: TextStyle(fontSize: 18.0, color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'CRM: ${medico.crm}',
                            style: TextStyle(fontSize: 12.0, color: Colors.grey),
                          )
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
        backgroundColor: Colors.red[200],
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => MedicoAddView()));
          await updateMedicos();
        },
      ),
    );
  }

  Future updateMedicos() async {
    var medicos = await medicoRepository.getAll();
    medicoStore.updateMedicos(medicos);
  }
}
