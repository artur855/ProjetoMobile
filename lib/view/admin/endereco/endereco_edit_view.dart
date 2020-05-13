import 'package:flutter/material.dart';
import 'package:projetomobile/model/endereco.dart';
import 'package:projetomobile/repository/endereco_repository.dart';
import 'package:projetomobile/store/endereco/endereco_form.dart';
import 'package:projetomobile/view/admin/endereco/endereco_form_view.dart';
import 'package:provider/provider.dart';

class EnderecoEditView extends StatelessWidget {
  final Endereco endereco;
   EnderecoRepository enderecoRepository ;

  EnderecoEditView({this.endereco});

  @override
  Widget build(BuildContext context) {
    enderecoRepository = Provider.of<EnderecoRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar endereco'),
        backgroundColor: Colors.blue[200],
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: 32,
            ),
            onSelected: (value) async {
              switch (value) {
                case 0:
                  await enderecoRepository.delete(endereco);
                  Navigator.of(context).popUntil(ModalRoute.withName('/admin_endereco'));
              }
            },
            itemBuilder: (context) {
              return [PopupMenuItem(child: Text('Deletar endereco'), value: 0)];
            },
          )
        ],
      ),
      body: EnderecoFormView(
        title: 'Atualizar',
        onSubmit: onSubmit,
      ),
    );
  }

  Future onSubmit(BuildContext context, EnderecoForm enderecoForm, EnderecoRepository enderecoRepository) async {
    if (enderecoForm.validarAll()) {
      endereco.cidade = enderecoForm.cidade;
      endereco.logradouro = enderecoForm.logradouro;
      endereco.cep = enderecoForm.cep;
      endereco.estadoId = enderecoForm.estado.id;
      await enderecoRepository.update(endereco);
      enderecoForm.dispose();
      Navigator.pop(context);
    }
  }

}
