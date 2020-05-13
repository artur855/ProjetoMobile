import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/model/endereco.dart';
import 'package:projetomobile/repository/endereco_repository.dart';
import 'package:projetomobile/repository/paciente_repository.dart';
import 'package:projetomobile/repository/usuario_repository.dart';
import 'package:projetomobile/store/paciente/paciente_form.dart';
import 'package:provider/provider.dart';

class PacienteFormView extends StatelessWidget {
  final String title;
  final Function(BuildContext context, PacienteForm pacienteForm, PacienteRepository pacienteRepository, UsuarioRepository usuarioRepository) onSubmit;
  final bool isRegisterForm; // Variavel utilizada para reaproveitar a logica do formulario de cadastro  para edicao
  final _formKey = GlobalKey();

  PacienteForm pacienteForm;
  UsuarioRepository usuarioRepository;
  PacienteRepository pacienteRepository;
  EnderecoRepository enderecoRepository;

  PacienteFormView({this.title, this.onSubmit, this.isRegisterForm});

  @override
  Widget build(BuildContext context) {
    usuarioRepository = Provider.of<UsuarioRepository>(context);
    pacienteRepository = Provider.of<PacienteRepository>(context);
    enderecoRepository = Provider.of<EnderecoRepository>(context);

    pacienteForm = PacienteForm(isRegisterForm: isRegisterForm);
    pacienteForm.criarValidacoes();

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: _generateUsuarioField(context),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _generateUsuarioField(BuildContext context) {
    var widgets = <Widget>[
      Observer(
        builder: (_) => TextField(
          onChanged: (value) => pacienteForm.nome = value.trim(),
          decoration: InputDecoration(labelText: 'Nome:', hintText: 'Insira o nome do paciente', errorText: pacienteForm.msgNome),
        ),
      ),
      Observer(
        builder: (_) => Container(
          margin: EdgeInsets.all(12),
          child: RaisedButton(
            onPressed: () async {
              var datNascimento = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
              );
              pacienteForm.datNascimento = datNascimento;
            },
            child: Text(pacienteForm.datNascimentoStr ?? 'Escolha a data de nascimento'),
          ),
        ),
      ),
      Observer(
        builder: (_) => TextField(
          onChanged: (value) => pacienteForm.cpf = num.parse(value.trim()),
          decoration: InputDecoration(labelText: 'CPF:', hintText: 'Insira o cpf do paciente', errorText: pacienteForm.msgCpf),
          keyboardType: TextInputType.numberWithOptions(),
        ),
      ),
      Observer(
        builder: (_) => TextField(
          onChanged: (value) => pacienteForm.rg = num.parse(value.trim()),
          decoration: InputDecoration(labelText: 'RG:', hintText: 'Insira o crm do paciente', errorText: pacienteForm.msgRg),
          keyboardType: TextInputType.numberWithOptions(),
        ),
      ),
      Observer(
        builder: (_) => TextField(
          onChanged: (value) => pacienteForm.telefone = num.parse(value.trim()),
          decoration: InputDecoration(labelText: 'Telefone:', hintText: 'Insira o telefone do paciente', errorText: pacienteForm.msgTelefone),
          keyboardType: TextInputType.numberWithOptions(),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: FutureBuilder(
          future: enderecoRepository.getAll(),
          builder: (context, snapshot) {
            List<Endereco> enderecos = snapshot.data;
            if (enderecos == null) {
              return Text('Sem enderecos');
            }
            List<DropdownMenuItem> itemsEnderecos = enderecos
                .map((endereco) => DropdownMenuItem(
                      value: endereco,
                      child: Text('${endereco.logradouro} - ${endereco.cidade} - ${endereco.cep}'),
                    ))
                .toList();
            return Observer(
              builder: (_) => InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Endereco',
                  labelStyle: TextStyle(),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: pacienteForm.endereco,
                    items: itemsEnderecos,
                    onChanged: (value) {
                      pacienteForm.endereco = value;
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
          await onSubmit(context, pacienteForm, pacienteRepository, usuarioRepository);
        },
        color: Colors.blue,
        child: Text(title),
      )
    ];

    if (isRegisterForm) {
      var loginField = Observer(
        builder: (_) => TextField(
          onChanged: (value) => pacienteForm.login = value.trim(),
          decoration: InputDecoration(labelText: 'Login:', hintText: 'Insira o login do paciente', errorText: pacienteForm.msgLogin),
        ),
      );
      var senhaField = Observer(
        builder: (_) => TextField(
          onChanged: (value) => pacienteForm.senha = value.trim(),
          decoration: InputDecoration(labelText: 'Senha:', hintText: 'Insira a senha do paciente', errorText: pacienteForm.msgSenha),
          obscureText: true,
        ),
      );
      var confSenhaField = Observer(
        builder: (_) => TextField(
          onChanged: (value) => pacienteForm.confSenha = value.trim(),
          decoration: InputDecoration(labelText: 'Confirmação de senha:', hintText: 'Confirme a senha', errorText: pacienteForm.msgConfSenha),
          obscureText: true,
        ),
      );
      widgets.insert(0, loginField);
      widgets.insert(1, senhaField);
      widgets.insert(2, confSenhaField);
    }
    return widgets;
  }
}
