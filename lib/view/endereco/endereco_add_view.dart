import 'package:flutter/material.dart';
import 'package:projetomobile/model/endereco.dart';
import 'package:projetomobile/repository/endereco_repository.dart';
import 'package:projetomobile/store/endereco/endereco_form.dart';
import 'package:projetomobile/view/endereco/endereco_form_view.dart';

class EnderecoAddView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar endereco'),
        backgroundColor: Colors.blue[200],
      ),
      body: EnderecoFormView(
        title: 'Adicionar',
        onSubmit: onSubmit,
      ),
    );
  }

  Future onSubmit(BuildContext context, EnderecoForm enderecoForm, EnderecoRepository enderecoRepository) async{
    if (enderecoForm.validarAll()){
      var endereco = Endereco(
        cidade: enderecoForm.cidade,
        logradouro: enderecoForm.logradouro,
        cep: enderecoForm.cep,
        estado: enderecoForm.estado
      );
      await enderecoRepository.insert(endereco);
      Navigator.of(context).pop();
    }
  }


}
