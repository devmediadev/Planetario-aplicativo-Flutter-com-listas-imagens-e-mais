import 'package:flutter/material.dart';

import 'package:solar_system/pages/single/single_page.dart';
import 'package:solar_system/services/planet_service.dart';
import 'package:solar_system/widgets/planet_list_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  final PlanetService planetService = PlanetService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: planetService.planets.map((planet) {
          return PlanetListTile(
            planet: planet,
            subtitle: Text("${planet.distanceFromTheSun} AU do sol."),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SinglePage(planet: planet),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
