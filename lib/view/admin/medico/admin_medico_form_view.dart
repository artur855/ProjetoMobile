import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomobile/model/especialidade.dart';
import 'package:projetomobile/repository/especialidade_repository.dart';
import 'package:projetomobile/repository/medico_repository.dart';
import 'package:projetomobile/repository/usuario_repository.dart';
import 'package:projetomobile/store/medico/medico_form.dart';
import 'package:provider/provider.dart';

class MedicoFormView extends StatelessWidget {
  final String title;
  final Function(BuildContext context, MedicoForm medicoForm, MedicoRepository medicoRepository, UsuarioRepository usuarioRepository) onSubmit;
  final _formKey = GlobalKey();
  final bool isRegisterForm; // Variavel utilizada para reaproveitar a logica do formulario de cadastro para edicao

  MedicoForm medicoForm;
  UsuarioRepository usuarioRepository;
  MedicoRepository medicoRepository;
  EspecialidadeRepository especialidadeRepository;

  MedicoFormView({this.title, this.onSubmit, this.isRegisterForm});

  @override
  Widget build(BuildContext context) {
    usuarioRepository = Provider.of<UsuarioRepository>(context);
    medicoRepository = Provider.of<MedicoRepository>(context);
    especialidadeRepository = Provider.of<EspecialidadeRepository>(context);
    medicoForm = MedicoForm(isRegisterForm: isRegisterForm);
    medicoForm.criarValidacoes();
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: _generateFormFields(context),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _generateFormFields(context) {
    var widgets = <Widget>[
      Observer(
        builder: (_) => TextField(
          onChanged: (value) => medicoForm.nome = value.trim(),
          decoration: InputDecoration(labelText: 'Nome:', hintText: 'Insira o nome do médico', errorText: medicoForm.msgNome),
        ),
      ),
      Observer(
        builder: (_) => TextField(
          onChanged: (value) => medicoForm.crm = num.parse(value.trim()),
          decoration: InputDecoration(labelText: 'CRM:', hintText: 'Insira o crm do médico', errorText: medicoForm.msgCrm),
          keyboardType: TextInputType.numberWithOptions(),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: FutureBuilder(
          future: especialidadeRepository.getAll(),
          builder: (context, snapshot) {
            List<Especialidade> especialidades = snapshot.data;
            if (especialidades == null) {
              return Text('Sem especialidades');
            }
            List<DropdownMenuItem> itemsEspecialidades = especialidades
                .map((especialidade) => DropdownMenuItem(
                      value: especialidade,
                      child: Text(especialidade.dsc),
                    ))
                .toList();
            return Observer(
              builder: (_) => InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Especialidade',
                  labelStyle: TextStyle(),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: medicoForm.especialidade,
                    items: itemsEspecialidades,
                    onChanged: (value) {
                      medicoForm.especialidade = value;
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
          await onSubmit(context, medicoForm, medicoRepository, usuarioRepository);
        },
        color: Colors.red[200],
        child: Text(title),
      )
    ];
    if (isRegisterForm) {
      var loginField = Observer(
        builder: (_) => TextField(
          onChanged: (value) => medicoForm.login = value.trim(),
          decoration: InputDecoration(labelText: 'Login:', hintText: 'Insira o login do médico', errorText: medicoForm.msgLogin),
        ),
      );
      var senhaField = Observer(
        builder: (_) => TextField(
          onChanged: (value) => medicoForm.senha = value.trim(),
          decoration: InputDecoration(labelText: 'Senha:', hintText: 'Insira a senha do médico', errorText: medicoForm.msgSenha),
          obscureText: true,
        ),
      );
      var confSenhaField = Observer(
        builder: (_) => TextField(
          onChanged: (value) => medicoForm.confSenha = value.trim(),
          decoration: InputDecoration(labelText: 'Confirmação de senha:', hintText: 'Confirme a senha', errorText: medicoForm.msgConfSenha),
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
