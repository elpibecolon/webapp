import 'dart:convert';

import 'package:dashboard/model/res/api_rest.dart';
import 'package:dashboard/routes/routes.dart';
import 'package:dashboard/ui/invoces/list_invoice_page.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:http/http.dart' as http;
import 'package:select_form_field/select_form_field.dart';

class InvoicePage extends StatefulWidget {
  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  final _idTripController = new TextEditingController();
  final _codeTripsController = new TextEditingController();
  final _numberPlaceController = new TextEditingController();
  final _destinyController = new TextEditingController();
  final _originPlaceController = new TextEditingController();
  final _priceController = new TextEditingController();
  //final _dniTravelerController = new TextEditingController();

  DateTime selectedDate;

  //Map data;

  List viajeroData; //Viajeros

  List viajesData;

  var _onPressed;

  bool enabledBtnAdd, enabledBtnUpdate;

  //final _formKey = GlobalKey<FormState>(debugLabel: '_InvoicePageState');

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

  getViajesSinAsignar() async {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Methods": "GET"
    };
    var url = Uri.parse(Constants.BASE_URL + Constants.VIAJES_SIN_ASIGNAR);
    http.Response response = await http.get(url, headers: headers);
    Utf8Decoder utf8decoder = Utf8Decoder();
    final responseData = json.decode(utf8decoder.convert(response.bodyBytes));
    if (responseData["R"] == '0') {
      setState(() {
        viajesData = responseData['viajes'];
      });
      return viajesData;
    } else {
      return viajesData;
    }
  }

  String selectedItemSaved;
  String selectedItemChange;
  int selectedSpinnerItem;
  List data = [];
  Future<int> myFuture;
  Future<int> _getCedulas() async {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Methods": "GET"
    };
    var url = Uri.parse(Constants.BASE_URL + Constants.LISTA_CEDULAS);
    var response = await http.get(url, headers: headers);
    var jsonData = json.decode(response.body);

    setState(() {
      data = jsonData['cedulas'];
    });

    /* for (var c in jsonData) {
      Cedulas cd = Cedulas(c['cedulas']);
      ced.add(cd);
    } */

    print('Data Cedulas: ' + data.toString());

    return 00;
  }

  getCall() {
    VoidCallback onpressed = () => navKey.currentState.pushNamed('/invoice');
    return onpressed();
  }

  @override
  initState() {
    myFuture = _getCedulas();
    super.initState();
    selectedDate = DateTime.now();
    getViajeros();
    getViajesSinAsignar();
    _getCedulas();
    setState(() {
      enabledBtnAdd = true;
      enabledBtnUpdate = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //AppScale _scale = AppScale(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Viajes",
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
            child: Container(
              color: Colors.grey,
              //height: height,
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
                                  controller: _idTripController,
                                  decoration: InputDecoration(
                                    labelText: 'id',
                                    icon: Icon(Icons.perm_identity),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-0 col-sm-0 col-md-0 col-lg-0 col-xl-0',
                            child: Visibility(
                              visible: false,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: _codeTripsController,
                                  decoration: InputDecoration(
                                    labelText: 'Codigo de Viaje',
                                    icon: Icon(Icons.qr_code),
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
                                controller: _numberPlaceController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Por favor ingrese las plazas disponibles';
                                  }
                                  return '';
                                },
                                decoration: InputDecoration(
                                  labelText: 'Numero de Plazas',
                                  icon: Icon(Icons.airline_seat_legroom_extra),
                                ),
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes:
                                'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3',
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SelectFormField(
                                type: SelectFormFieldType.dropdown,
                                items: Listas.listas(),
                                controller: _destinyController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Por favor seleccione un Destino';
                                  }
                                  return '';
                                },
                                onChanged: (newVal) {
                                  setState(() {
                                    selectedItemChange = newVal;
                                  });
                                },
                                onSaved: (val) => setState(
                                    () => selectedItemSaved = val ?? ''),
                                decoration: InputDecoration(
                                  labelText: 'Destino de Viaje',
                                  icon: Icon(
                                    Icons.location_city,
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
                                controller: _originPlaceController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Por favor ingrese el Origen del Viaje';
                                  }
                                  return '';
                                },
                                decoration: InputDecoration(
                                  labelText: 'Origen del Viaje',
                                  icon: Icon(Icons.place),
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
                                controller: _priceController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Por favor ingrese el Precio del Viaje';
                                  }
                                  return '';
                                },
                                decoration: InputDecoration(
                                  labelText: 'Precio',
                                  icon: Icon(Icons.monetization_on),
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
                              child: FutureBuilder<int>(
                                future: myFuture,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData)
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      DropdownButton<int>(
                                        focusColor: Colors.red,
                                        items: data
                                            .map(
                                              (item) => DropdownMenuItem<int>(
                                                child: Text(
                                                  '${item['cedula']}',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                value: item['cedula'],
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (newVal) {
                                          setState(() {
                                            selectedSpinnerItem = newVal;
                                          });
                                        },
                                        value: selectedSpinnerItem,
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          textDirection: TextDirection.ltr,
                                        ),
                                      ),
                                    ],
                                  );
                                },
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
                                'col-12 col-sm-10 col-md-14 col-lg-34 col-xl-36',
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
                _idTripController.text =
                    viajesData[index]['id_viaje'].toString();
                _codeTripsController.text = viajesData[index]['codigo_viajes'];
                _numberPlaceController.text =
                    viajesData[index]['numero_plazas'].toString();
                _destinyController.text = viajesData[index]['destino'];
                _originPlaceController.text = viajesData[index]['lugar_origen'];
                _priceController.text = viajesData[index]['precio'].toString();
                enabledBtnUpdate = true;
                enabledBtnAdd = false;
              });
            },
            title: Text(
              'Codigo de Viaje: ${viajesData[index]['codigo_viajes']}  N° de Plazas Disponibles: ${(viajesData[index]['numero_plazas'])}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              'Destino de viaje: ${viajesData[index]['destino']}   Origen del Viaje: ${viajesData[index]['lugar_origen']} Precio: \$${viajesData[index]['precio']}',
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
                '${viajesData[index]['\$id_viaje']}',
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
      itemCount: viajesData == null ? 0 : viajesData.length,
    );
  }

  void confirm(context, index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: new Text(
            'Esta seguro de eliminar el codigo de Viaje: ${viajesData[index]['codigo_viajes']}?'),
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
                "id_viaje": viajesData[index]['id_viaje'],
              };
              print(body);
              ApiService.eliminarViaje(body).then((response) {
                print(response.toString());
                if (response["R"] == '0') {
                  getCall();
                  Navigator.of(context).pop();
                } else if (response["R"] == '1') {
                  print("response:" + response.toString());
                  Navigator.of(context).pop();
                }
              });
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
                //if (_formKey.currentState.validate()) {
                final Map<String, dynamic> body = {
                  "numero_plazas": int.parse(_numberPlaceController.text),
                  "destino": _destinyController.text,
                  "lugar_origen": _originPlaceController.text,
                  "precio": double.parse(_priceController.text),
                  "cedula_viajero": selectedSpinnerItem
                };
                try {
                  ApiService.agregarViaje(body).then((response) {
                    if (response.statusCode == 200) {
                      _numberPlaceController.text = '';
                      _destinyController.text = '';
                      _originPlaceController.text = '';
                      _priceController.text = '';
                      //_dniTravelerController.text = '';
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
                                    'El viaje no se puedo insertar',
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
                                    _numberPlaceController.text = '';
                                    _destinyController.text = '';
                                    _originPlaceController.text = '';
                                    _priceController.text = '';
                                    //_dniTravelerController.text = '';
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
                //}
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
                //if (_formKey.currentState.validate()) {
                final Map<String, dynamic> body = {
                  "id_viaje": int.parse(_idTripController.text),
                  "numero_plazas": int.parse(_numberPlaceController.text),
                  "destino": _destinyController.text,
                  "lugar_origen": _originPlaceController.text,
                  "precio": _priceController.text,
                  "cedula_viajero": selectedSpinnerItem,
                };
                try {
                  ApiService.actualizarViaje(body).then((response) {
                    print('updateRegistry response: ' + response.toString());
                    if (response['R'] == '0') {
                      getCall();
                      enabledBtnAdd = true;
                      enabledBtnUpdate = false;
                    } else {
                      showDialog(
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          content: Container(
                            height: 160,
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
                                    'El viaje no se pudo actualizar',
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
                                    getCall();
                                    enabledBtnUpdate = true;
                                    enabledBtnAdd = false;
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
                //}
              },
        child: Text('Actualizar'),
      ),
    );
  }
}

class Cedulas {
  final int cedula;

  Cedulas(this.cedula);
}
