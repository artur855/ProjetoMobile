import 'package:flutter/material.dart';
import 'package:projetomobile/repository/medico_repository.dart';
import 'package:projetomobile/repository/usuario_repository.dart';
import 'package:provider/provider.dart';

class MedicoHomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seja bem vindo médico'),
      ),
    );
  }
}
