import 'package:ahorrapp/routes/crear_orden.dart';
import 'package:ahorrapp/routes/estadisticas.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Crear orden'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CrearOrden()),
                );
              },
            ),
            RaisedButton(
              child: Text('Estadisticas'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Estadisticas()));
              },
            )
          ],
        ),
      ),
    );
  }
}
