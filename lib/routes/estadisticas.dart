import 'package:flutter/material.dart';

class Estadisticas extends StatefulWidget {
  @override
  _EstadisticasState createState() => _EstadisticasState();
}

class _EstadisticasState extends State<Estadisticas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estadisticas'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Volver al home'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
