import 'dart:convert';

import 'package:dashboard/model/res/api_rest.dart';
import 'package:dashboard/routes/routes.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:http/http.dart' as http;

//stf

class ClientPage extends StatefulWidget {
  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  final _idController = new TextEditingController();
  final _nameController = new TextEditingController();
  final _lastnameController = new TextEditingController();
  final _addressController = new TextEditingController();
  final _phoneController = new TextEditingController();
  final _dniController = new TextEditingController();

  DateTime selectedDate;

  List viajeroData;

  var _onPressed;

  bool enabledBtnAdd, enabledBtnUpdate;

  final _formKey = GlobalKey<FormState>(debugLabel: '_ClientPageState');

  getViajeros() async {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Methods": "GET"
    };
    var url = Uri.parse(Constants.BASE_URL + Constants.VIAJEROS);
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      setState(() {
        viajeroData = json.decode(response.body);
      });
      print(viajeroData);
      return viajeroData;
    } else {
      return null;
    }
  }

  getCall() {
    VoidCallback onpressed = () => navKey.currentState.pushNamed('/client');
    return onpressed();
  }

  @override
  initState() {
    super.initState();
    selectedDate = DateTime.now();
    getViajeros();
    setState(() {
      enabledBtnAdd = true;
      enabledBtnUpdate = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Viajeros",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Form(
            key: _formKey,
            child: Container(
              color: Colors.grey,
              padding: const EdgeInsets.all(20.0),
              child: Material(
                elevation: 20,
                child: BootstrapContainer(
                  fluid: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BootstrapRow(
                        height:
                            60, //es obligatorio poner una altura al container
                        children: [
                          BootstrapCol(
                            sizes: 'col-0 col-sm-0 col-md-0 col-lg-0 col-xl-0',
                            child: Visibility(
                              visible: false,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: _idController,
                                  decoration: InputDecoration(
                                    labelText: 'id',
                                    icon: Icon(Icons.perm_identity),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes:
                                'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3',
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _nameController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Por favor ingrese un Nombre';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Nombre',
                                  icon: Icon(Icons.person),
                                ),
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes:
                                'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3',
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _lastnameController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Por favor ingrese un Apellido';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Apellido',
                                  icon: Icon(Icons.person),
                                ),
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes:
                                'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3',
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _addressController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Por favor ingrese una Direccion';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Direccion',
                                  icon: Icon(Icons.streetview),
                                ),
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes:
                                'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3',
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _phoneController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Por favor ingrese un numero de Telefono';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Telefono',
                                  icon: Icon(Icons.phone),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BootstrapRow(
                        height:
                            60, //es obligatorio poner una altura al container
                        children: [
                          BootstrapCol(
                            sizes:
                                'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3',
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _dniController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Por favor ingrese un numero de Cedula';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Cedula',
                                  icon: Icon(Icons.description_outlined),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BootstrapRow(
                        height:
                            60, //es obligatorio poner una altura al container
                        children: [
                          BootstrapCol(
                            sizes:
                                'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3',
                            child: _buttonAdd(context),
                          ),
                          BootstrapCol(
                            sizes:
                                'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3',
                            child: _buttonUpdate(context),
                          ),
                          BootstrapCol(
                            sizes:
                                'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3',
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                //style: TextButton.styleFrom(primary: Colors.red),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.red,
                                  onSurface: Colors.grey,
                                ),
                                onPressed: () {
                                  getCall();
                                },
                                child: Text('Limpiar'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              color: Colors.grey,
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Material(
                elevation: 20,
                child: BootstrapContainer(
                  fluid: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BootstrapRow(
                        height: 1200,
                        children: [
                          BootstrapCol(
                            sizes:
                                'col-12 col-sm-10 col-md-14 col-lg-38 col-xl-38',
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: updateListView(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView updateListView(context) {
    return ListView.builder(
      padding: const EdgeInsets.all(2),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.black,
          child: ListTile(
            onTap: () {
              setState(() {
                _idController.text = viajeroData[index]['id'].toString();
                _nameController.text = viajeroData[index]['nombre'];
                _lastnameController.text = viajeroData[index]['apellido'];
                _addressController.text = viajeroData[index]['direccion'];
                _phoneController.text = viajeroData[index]['telefono'];
                _dniController.text = viajeroData[index]['cedula'].toString();
                enabledBtnUpdate = true;
                enabledBtnAdd = false;
              });
            },
            title: Text(
              '${viajeroData[index]['nombre']} ${viajeroData[index]['apellido']}  Cedula: ${viajeroData[index]['cedula'].toString()}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            subtitle: Text(
              'Telefono: ${viajeroData[index]['telefono']}   Direccion: ${viajeroData[index]['direccion']}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            leading: Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Text(
                viajeroData[index]['\$id'],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                confirm(context, index);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 30.0,
              ),
            ),
          ),
        );
      },
      itemCount: viajeroData == null ? 0 : viajeroData.length,
    );
  }

  void confirm(context, index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: new Text(
            'Esta seguro de eliminar a ${viajeroData[index]['nombre']} ${viajeroData[index]['apellido']}?'),
        actions: [
          ElevatedButton(
            child: new Text(
              "Eliminar",
              style: new TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.white,
              onSurface: Colors.grey,
            ),
            onPressed: () {
              final Map<String, int> body = {
                "id": viajeroData[index]['id'],
              };
              print(body);
              ApiService.eliminarViajero(body).then(
                (response) {
                  print(response.toString());
                  if (response["R"] == '0') {
                    getCall();
                    Navigator.of(context).pop();
                  } else if (response["R"] == '1') {
                    print("response:" + response.toString());
                    Navigator.of(context).pop();
                  }
                },
              );
            },
          ),
          ElevatedButton(
            child: Text(
              "Cancelar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.white,
              onSurface: Colors.grey,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buttonAdd(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.black,
          onSurface: Colors.grey,
        ),
        onPressed: enabledBtnAdd == true
            ? () {
                if (_formKey.currentState.validate()) {
                  final Map<String, dynamic> body = {
                    "nombre": _nameController.text,
                    "apellido": _lastnameController.text,
                    "direccion": _addressController.text,
                    "telefono": _phoneController.text,
                    "cedula": int.parse(_dniController.text)
                  };
                  try {
                    ApiService.registroViajero(body).then((response) {
                      if (response.statusCode == 200) {
                        _nameController.text = '';
                        _lastnameController.text = '';
                        _addressController.text = '';
                        _phoneController.text = '';
                        _dniController.text = '';
                        getCall();
                        //Navigator.of(context).pop();
                      } else {
                        showDialog(
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            content: Container(
                              height: 25,
                              width: 180,
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.lock,
                                    size: 50,
                                    color: Colors.red,
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(15),
                                    child: Text(
                                      'El usuario no se puedo insertar',
                                      style: TextStyle(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Colors.red,
                                      onSurface: Colors.grey,
                                      textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _nameController.text = '';
                                      _lastnameController.text = '';
                                      _addressController.text = '';
                                      _phoneController.text = '';
                                      _dniController.text = '';
                                    },
                                    child: Text(
                                      'Cerrar',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          context: context,
                        );
                      }
                      return Center(
                        heightFactor: 30.0,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.red,
                        ),
                      );
                    });
                  } on Exception catch (error) {
                    print("Hola FormatException: " + error.toString());
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // return object of type Dialog
                        return AlertDialog(
                          title: new Text("Something has gone wrong!"),
                          content: new Text(
                              "The connection to the main server has failed. " +
                                  error.toString()),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            ElevatedButton(
                              child: new Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } catch (error) {
                    print("loginPageError: " + error.toString());
                  }
                }
              }
            : _onPressed,
        child: Text('Agregar'),
      ),
    );
  }

  Widget _buttonUpdate(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.black,
          onSurface: Colors.grey,
        ),
        onPressed: enabledBtnUpdate == false
            ? _onPressed
            : () {
                if (_formKey.currentState.validate()) {
                  final Map<String, dynamic> body = {
                    "id": _idController.text,
                    "nombre": _nameController.text,
                    "apellido": _lastnameController.text,
                    "direccion": _addressController.text,
                    "telefono": _phoneController.text,
                    "cedula": int.parse(_dniController.text)
                  };
                  try {
                    ApiService.actualizarViajero(body).then((response) {
                      print('updateRegistry response: ' + response.toString());
                      if (response['R'] == '0') {
                        _idController.text = '';
                        _nameController.text = '';
                        _lastnameController.text = '';
                        _addressController.text = '';
                        _phoneController.text = '';
                        _dniController.text = '';
                        getCall();
                        enabledBtnAdd = true;
                        enabledBtnUpdate = false;
                      } else if (response['R'] == '1') {
                        showDialog(
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            content: Container(
                              height: 25,
                              width: 180,
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.lock,
                                    size: 50,
                                    color: Colors.red,
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(15),
                                    child: Text(
                                      'El usuario no se puedo actualizar',
                                      style: TextStyle(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Colors.red,
                                      onSurface: Colors.grey,
                                      textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _nameController.text = '';
                                      _lastnameController.text = '';
                                      _addressController.text = '';
                                      _phoneController.text = '';
                                      _dniController.text = '';
                                      enabledBtnUpdate = true;
                                      enabledBtnUpdate = false;
                                    },
                                    child: Text(
                                      'Cerrar',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          context: context,
                        );
                      }
                      return Center(
                        heightFactor: 30.0,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.red,
                        ),
                      );
                    });
                  } on Exception catch (error) {
                    print("Hola FormatException: " + error.toString());
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // return object of type Dialog
                        return AlertDialog(
                          title: new Text("Something has gone wrong!"),
                          content: new Text(
                              "The connection to the main server has failed. " +
                                  error.toString()),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            ElevatedButton(
                              child: new Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } catch (error) {
                    print("loginPageError: " + error.toString());
                  }
                }
              },
        child: Text('Actualizar'),
      ),
    );
  }
}
