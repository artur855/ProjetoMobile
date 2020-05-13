import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/repository/cobertura_repository.dart';
import 'package:projetomobile/store/cobertura/cobertura_store.dart';
import 'package:projetomobile/view/admin/cobertura/cobertura_add_view.dart';
import 'package:projetomobile/view/admin/cobertura/cobertura_edit_view.dart';
import 'package:provider/provider.dart';

class AdminCoberturaHomeView extends StatelessWidget {
  final CoberturaStore coberturaStore = CoberturaStore();
  CoberturaRepository coberturaRepository;

  @override
  Widget build(BuildContext context) {
    coberturaRepository = Provider.of<CoberturaRepository>(context);
    atualizarCoberturas();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cobertura'),
        backgroundColor: Colors.purple[200],
      ),
      body: Observer(
        builder: (_) => RefreshIndicator(
          onRefresh: atualizarCoberturas,
          child: ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: coberturaStore.coberturas.length,
            itemBuilder: (context, i) {
              var cobertura = coberturaStore.coberturas[i];
              return InkWell(
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(builder: (_) => CoberturaEditView(cobertura: cobertura)));
                  await atualizarCoberturas();
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
                            cobertura.dsc,
                            style: TextStyle(fontSize: 28.0, color: Colors.grey[700]),
                          )
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
        backgroundColor: Colors.purple[200],
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => CoberturaAddView()));
          await atualizarCoberturas();
        },
      ),
    );
  }

  Future atualizarCoberturas() async {
    var coberturas = await coberturaRepository.getAll();
    coberturaStore.atualizarCoberturas(coberturas);
  }
}
