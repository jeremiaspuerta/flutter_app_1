import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';

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
      body: Formulario(),
    );
  }
}

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  final controladorForm = TextEditingController();
  var _barcode;

  @override
  void dispose() {
    controladorForm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: controladorForm,
            ),
            TextField(
              controller: controladorForm,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Procesando informacion')));
                    print(controladorForm.text);
                  }
                },
                child: Text('Submit'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
              child: RaisedButton(
                color: Colors.amber,
                textColor: Colors.black,
                splashColor: Colors.blueGrey,
                onPressed: scan,
                child: const Text('Scanear el código QR.'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                _barcode.rawContent ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ));
  }

  Future scan() async {
    try {
      var barcode = await BarcodeScanner.scan();
      setState(() => this._barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          this._barcode = 'El usuario no dio permiso para el uso de la cámara!';
        });
      } else {
        setState(() => this._barcode = 'Error desconocido $e');
      }
    } on FormatException {
      setState(() => this._barcode =
          'nulo, el usuario presionó el botón de volver antes de escanear algo)');
    } catch (e) {
      setState(() => this._barcode = 'Error desconocido : $e');
    }
  }
}
