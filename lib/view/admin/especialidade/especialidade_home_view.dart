import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/repository/especialidade_repository.dart';
import 'package:projetomobile/store/especialidade/especialidade_store.dart';
import 'package:projetomobile/view/admin/especialidade/especialidade_add_view.dart';
import 'package:projetomobile/view/admin/especialidade/especialidade_edit_view.dart';
import 'package:provider/provider.dart';

class AdminEspecialidadeHomeView extends StatelessWidget {
  final EspecialidadeStore especialidadeStore = EspecialidadeStore();
  EspecialidadeRepository especialidadeRepository;

  @override
  Widget build(BuildContext context) {
    especialidadeRepository = Provider.of<EspecialidadeRepository>(context);
    atualizarEspecialidades();
    return Scaffold(
      appBar: AppBar(
        title: Text('Especialidade'),
        backgroundColor: Colors.brown[200],
      ),
      body: Observer(
        builder: (_) => RefreshIndicator(
          onRefresh: atualizarEspecialidades,
          child: ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: especialidadeStore.especialidades.length,
            itemBuilder: (context, i) {
              var especialidade = especialidadeStore.especialidades[i];
              return InkWell(
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(builder: (_) => EspecialidadeEditView(especialidade: especialidade)));
                  await atualizarEspecialidades();
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
                            especialidade.dsc,
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
        backgroundColor: Colors.brown[200],
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => EspecialidadeAddView()));
          await atualizarEspecialidades();
        },
      ),
    );
  }

  Future atualizarEspecialidades() async {
    var especialidades = await especialidadeRepository.getAll();
    especialidadeStore.atualizarEspecialidades(especialidades);
  }
}
