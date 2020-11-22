import 'package:ahorrapp/routes/agregar_alimentos.dart';
import 'package:flutter/material.dart';

class CrearOrden extends StatefulWidget {
  @override
  _CrearOrdenState createState() => _CrearOrdenState();
}

class _CrearOrdenState extends State<CrearOrden> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear orden"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('volver al inicio'),
            ),
            RaisedButton(
              child: Text('Agregar alimentos'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AgregarAliementos()));
              },
            )
          ],
        ),
      ),
    );
  }
}
