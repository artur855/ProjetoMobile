import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/repository/estado_repository.dart';
import 'package:projetomobile/store/estado/estado_store.dart';
import 'package:projetomobile/view/admin/estado/admin_estado_add_view.dart';
import 'package:projetomobile/view/admin/estado/admin_estado_edit_view.dart';
import 'package:provider/provider.dart';

class AdminEstadoHomeView extends StatelessWidget {
  final EstadoStore estadoStore = EstadoStore();
   EstadoRepository estadoRepository;

  @override
  Widget build(BuildContext context) {
    estadoRepository = Provider.of<EstadoRepository>(context);
    updateEstados();
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado'),
        backgroundColor: Colors.green[200],
      ),
      body: Observer(
        builder: (_) => RefreshIndicator(
          onRefresh: updateEstados,
          child: ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: estadoStore.estados.length,
            itemBuilder: (context, i) {
              var estado = estadoStore.estados[i];
              return InkWell(
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(builder: (_) => AdminEstadoEditView(estado: estado)));
                  await updateEstados();
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
                            estado.nome,
                            style: TextStyle(fontSize: 28.0, color: Colors.grey[700]),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            estado.sigla,
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
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdminEstadoAddView()));
          await updateEstados();
        },
      ),
    );
  }

  Future updateEstados() async {
    var estados = await estadoRepository.getAll();
    estadoStore.updateEstados(estados);
  }
}
