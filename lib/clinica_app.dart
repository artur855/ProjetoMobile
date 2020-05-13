import 'package:flutter/material.dart';
import 'package:projetomobile/repository/cobertura_repository.dart';
import 'package:projetomobile/repository/consulta_repository.dart';
import 'package:projetomobile/repository/endereco_repository.dart';
import 'package:projetomobile/repository/especialidade_repository.dart';
import 'package:projetomobile/repository/estado_repository.dart';
import 'package:projetomobile/repository/medico_repository.dart';
import 'package:projetomobile/repository/paciente_repository.dart';
import 'package:projetomobile/repository/usuario_repository.dart';
import 'package:projetomobile/view/admin/cobertura/cobertura_home_view.dart';
import 'package:projetomobile/view/admin/consulta/admin_consulta_home_view.dart';
import 'package:projetomobile/view/admin/endereco/endereco_home_view.dart';
import 'package:projetomobile/view/admin/especialidade/especialidade_home_view.dart';
import 'package:projetomobile/view/admin/estado/estado_home_view.dart';
import 'package:projetomobile/view/login/login_view.dart';
import 'package:projetomobile/view/admin/medico/admin_medico_home_view.dart';
import 'package:projetomobile/view/admin/paciente/paciente_home_view.dart';
import 'package:projetomobile/view/admin/admin_home_view.dart';
import 'package:projetomobile/view/medico/medico_home_view.dart';
import 'package:projetomobile/view/paciente/paciente_home_view.dart';
import 'package:provider/provider.dart';


class ClinicaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => LoginView(),
          '/admin_home': (context) => _wrapWithWillPopWidget(context, AdminHomeView()),
          '/admin_estado': (context) => AdminEstadoHomeView(),
          '/admin_endereco': (context) => AdminEnderecoHomeView(),
          '/admin_medico': (context) => AdminMedicoHomeView(),
          '/admin_especialidade': (context) => AdminEspecialidadeHomeView(),
          '/admin_cobertura': (context) => AdminCoberturaHomeView(),
          '/admin_paciente': (context) => AdminPacienteHomeView(),
          '/admin_consulta': (context) => AdminConsultaHomeView(),
          '/paciente_home': (context) => _wrapWithWillPopWidget(context, PacienteHomeView()),
          '/medico_home': (context) => _wrapWithWillPopWidget(context, MedicoHomeView()),
        },
      ),
      providers: [
        Provider<EstadoRepository>(create: (_) => EstadoRepository()),
        Provider<EnderecoRepository>(create: (_) => EnderecoRepository()),
        Provider<EspecialidadeRepository>(create: (_) => EspecialidadeRepository()),
        Provider<MedicoRepository>(create: (_) => MedicoRepository()),
        Provider<CoberturaRepository>(create: (_) => CoberturaRepository()),
        Provider<PacienteRepository>(create: (_) => PacienteRepository()),
        Provider<UsuarioRepository>(create: (_) => UsuarioRepository()),
        Provider<ConsultaRepository>(create: (_) => ConsultaRepository()),
      ],
    );
  }

  Widget _wrapWithWillPopWidget(BuildContext context, Widget child) {
    UsuarioRepository usuarioRepository = Provider.of<UsuarioRepository>(context);
    return WillPopScope(
      onWillPop: () =>
          showDialog<bool>(
            context: context,
            builder: (c) =>
                AlertDialog(
                  title: Text('Aviso'),
                  content: Text('Tem certeza que quer sair?'),
                  actions: [
                    FlatButton(
                      child: Text('Sim'),
                      onPressed: () {
                        usuarioRepository.logout();
                        Navigator.pop(c, true);
                      },
                    ),
                    FlatButton(
                      child: Text('Não'),
                      onPressed: () => Navigator.pop(c, false),
                    ),
                  ],
                ),
          ),
      child: child,
    );
  }
}
