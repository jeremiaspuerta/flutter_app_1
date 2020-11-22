import 'package:flutter/material.dart';

class AgregarAliementos extends StatefulWidget {
  @override
  _AgregarAliementosState createState() => _AgregarAliementosState();
}

class _AgregarAliementosState extends State<AgregarAliementos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar alimentos'),
      ),
    );
  }
}
