import 'package:flutter/material.dart';

class AdminHomeView extends StatelessWidget {
  var menuCardsConfig = [
    {'name': 'Consulta', 'icon': Icons.calendar_today, 'color': Colors.redAccent, 'next': '/admin_consulta'},
    {'name': 'Estado', 'icon': Icons.map, 'color': Colors.green[200], 'next': '/admin_estado'},
    {'name': 'Endereço', 'icon': Icons.location_on, 'color': Colors.blue[200], 'next': '/admin_endereco'},
    {'name': 'Médico', 'icon': Icons.healing, 'color': Colors.red[200], 'next': '/admin_medico'},
    {'name': 'Especialidade', 'icon': Icons.library_books, 'color': Colors.brown[200], 'next': '/admin_especialidade'},
    {'name': 'Cobertura', 'icon': Icons.list, 'color': Colors.purple[200], 'next': '/admin_cobertura'},
    {'name': 'Paciente', 'icon': Icons.child_care, 'color': Colors.blue, 'next': '/admin_paciente'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seja bem vindo admin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: menuCardsConfig
              .map(
                (config) => generateMenuCard(name: config['name'], icon: config['icon'], color: config['color'], next: config['next'], context: context),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget generateMenuCard({String name, IconData icon, Color color, String next, BuildContext context}) {
    return InkWell(
      onTap: () async {
        Navigator.of(context).pushNamed(next);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 34,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Icon(
                icon,
                size: 34.0,
              ),
            ],
          ),
        ),
        color: color,
      ),
    );
  }
}
