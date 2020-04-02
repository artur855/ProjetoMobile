import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/repository/estado_repository.dart';
import 'package:projetomobile/store/estado_store.dart';
import 'package:projetomobile/view/estado/estado_add.dart';

class EstadoHome extends StatelessWidget {
  final EstadoStore estadoStore = EstadoStore();
  final EstadoRepository estadoRepository = EstadoRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado'),
        backgroundColor: Colors.green[200],
      ),
      body: Observer(
        builder: (_) => RefreshIndicator(
          onRefresh: atualizarEstados,
          child: ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: estadoStore.estados.length,
            itemBuilder: (context, i) {
              var estado = estadoStore.estados[i];
              return Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                decoration: BoxDecoration(),
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
          var shouldRefresh = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => EstadoAddView()));
          if (shouldRefresh != null && shouldRefresh) {
            await atualizarEstados();
          }
        },
      ),
    );
  }

  Future atualizarEstados() async {
    var estados = await estadoRepository.getAllEstados();
    estadoStore.updateEstados(estados);
  }
}
