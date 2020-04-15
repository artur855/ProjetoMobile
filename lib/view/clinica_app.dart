import 'package:flutter/material.dart';
import 'package:projetomobile/view/endereco/endereco_home_view.dart';
import 'package:projetomobile/view/estado/estado_home_view.dart';

import 'home/home.dart';

class ClinicaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/estado': (context) => EstadoHomeView(),
        '/endereco': (context) => EnderecoHomeView(),
        '/medico': (context) => null
      },
    );
  }
}
