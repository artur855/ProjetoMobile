import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/model/estado.dart';
import 'package:projetomobile/repository/endereco_repository.dart';
import 'package:projetomobile/repository/estado_repository.dart';
import 'package:projetomobile/store/endereco/endereco_form.dart';

class EnderecoFormView extends StatelessWidget {
  final String title;
  final EnderecoForm enderecoForm = EnderecoForm();
  final EstadoRepository estadoRepository = EstadoRepository();
  final EnderecoRepository enderecoRepository = EnderecoRepository();
  final Function(BuildContext context, EnderecoForm enderecoForm, EnderecoRepository enderecoRepository) onSubmit;
  final _formKey = GlobalKey<FormState>();

  EnderecoFormView({this.title, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    enderecoForm.criarValidacoes();
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Observer(
                  builder: (_) => TextField(
                    onChanged: (value) => enderecoForm.cidade = value.trim(),
                    decoration: InputDecoration(labelText: 'Cidade:', hintText: 'Insira o nome da cidade', errorText: enderecoForm.msgCidade),
                  ),
                ),
                Observer(
                  builder: (_) => TextField(
                    onChanged: (value) => enderecoForm.logradouro = value.trim(),
                    decoration: InputDecoration(labelText: 'Logradouro:', hintText: 'Insira o nome do logradouro', errorText: enderecoForm.msgLogradouro),
                  ),
                ),
                Observer(
                  builder: (_) => TextField(
                    onChanged: (value) => enderecoForm.cep = value.trim(),
                    decoration: InputDecoration(labelText: 'CEP:', hintText: 'Insira o nome do CEP', errorText: enderecoForm.msgCep),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: FutureBuilder(
                    future: estadoRepository.getAll(),
                    builder: (context, snapshot) {
                      List<Estado> estados = snapshot.data;
                      if (estados == null) {
                        return Text('Sem estados');
                      }
                      List<DropdownMenuItem> itemsEstados = estados
                          .map((estado) => DropdownMenuItem(
                                value: estado,
                                child: Text(estado.nome),
                              ))
                          .toList();
                      return Observer(
                        builder: (_) => InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Estado',
                            labelStyle: TextStyle(),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: enderecoForm.estado,
                              items: itemsEstados,
                              onChanged: (value) {
                                enderecoForm.estado = value;
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                RaisedButton(
                  onPressed: () async {
                      await onSubmit(context, enderecoForm, enderecoRepository);
                  },
                  color: Colors.blue[200],
                  child: Text(title),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
