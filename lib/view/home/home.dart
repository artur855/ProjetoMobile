import 'package:flutter/material.dart';
import 'package:projetomobile/view/estado/estado_home_view.dart';

class HomePage extends StatelessWidget {
  var menuCardsConfig = [
    {'name': 'Estado', 'icon': Icons.map, 'color': Colors.green[200], 'next': '/estado'},
    {'name': 'Endereço', 'icon': Icons.location_on, 'color': Colors.blue[200], 'next': '/endereco'},
    {'name': 'Médico', 'icon': Icons.person, 'color': Colors.red[200], 'next': '/medico'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  style: Theme.of(context).primaryTextTheme.display1,
                ),
              ),
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
