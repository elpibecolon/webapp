import 'dart:convert';
import 'package:dashboard/model/res/api_rest.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:http/http.dart' as http;
import 'package:dashboard/routes/routes.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List viajesData;

  getViajesAsignado() async {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Methods": "GET"
    };
    var url = Uri.parse(Constants.BASE_URL + Constants.VIAJES_ASIGNADOS);
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

  @override
  void initState() {
    super.initState();
    getViajesAsignado();
  }

  getCall() {
    VoidCallback onpressed = () => navKey.currentState.pushNamed('/task');
    return onpressed();
  }

  @override
  Widget build(BuildContext context) {
    //AppScale _scale = AppScale(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Viajes Asignados",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey,
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
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
                        sizes: 'col-12 col-sm-10 col-md-14 col-lg-34 col-xl-36',
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
    );
  }

  ListView updateListView(context) {
    return ListView.builder(
      padding: const EdgeInsets.all(2),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          elevation: 40.0,
          color: Colors.black,
          child: ListTile(
            onTap: () {},
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    'Viajero: ${viajesData[index]['cedula_viajero']}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  'Codigo de Viaje: ${viajesData[index]['codigo_viajes']}  N° de Plazas Disponibles: ${(viajesData[index]['numero_plazas'])}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
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
}
