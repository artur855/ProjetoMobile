import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/repository/endereco_repository.dart';
import 'package:projetomobile/store/endereco/endereco_store.dart';
import 'package:projetomobile/view/admin/endereco/endereco_add_view.dart';
import 'package:provider/provider.dart';

import 'endereco_edit_view.dart';

class AdminEnderecoHomeView extends StatelessWidget {
  final EnderecoStore enderecoStore = EnderecoStore();
  EnderecoRepository enderecoRepository;

  @override
  Widget build(BuildContext context) {
    enderecoRepository = Provider.of<EnderecoRepository>(context);
    atualizarEnderecos();
    return Scaffold(
      appBar: AppBar(
        title: Text('Endereco'),
        backgroundColor: Colors.blue[200],
      ),
      body: Observer(
        builder: (_) => RefreshIndicator(
          onRefresh: atualizarEnderecos,
          child: ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: enderecoStore.enderecos.length,
            itemBuilder: (context, i) {
              var endereco = enderecoStore.enderecos[i];
              return InkWell(
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(builder: (_) => EnderecoEditView(endereco: endereco)));
                  await atualizarEnderecos();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '${endereco.logradouro}',
                              style: TextStyle(fontSize: 28.0, color: Colors.grey[700]),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5,),
                            Text(
                              '${endereco.cidade} - ${endereco.estado.sigla}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              '${endereco.cep}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.location_on,
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
        backgroundColor: Colors.blue[200],
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => EnderecoAddView()));
          await atualizarEnderecos();
        },
      ),
    );
  }

  Future atualizarEnderecos() async {
    var enderecos = await enderecoRepository.getAll(includeEstado: true);
    enderecoStore.updateEnderecos(enderecos);
  }
}
