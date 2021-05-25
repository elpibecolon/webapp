import 'dart:convert';
import 'package:dashboard/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
//--------------------------- USUARIOS -----------------------------------------
  // POST: Login y password
  static Future<dynamic> postLogin(Map<String, dynamic> body) async {
    String putData = jsonEncode(body);
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Methods": "POST"
    };

    var url = Uri.parse(Constants.BASE_URL + Constants.LOGIN);
    //final encoding = Encoding.getByName('utf-8');
    try {
      Utf8Decoder utf8decoder = Utf8Decoder();
      final response = await http.post(url, headers: headers, body: putData);
      print(json.decode(response.body));

      final responseData = json.decode(utf8decoder.convert(response.bodyBytes));
      if (responseData["R"] != '0') {
        print("Api rest: " + responseData.toString());
        return responseData;
      } else {
        return responseData;
      }
    } on Exception catch (error) {
      //manejo de error por conexion http
      print("api rest error: " + error.toString());
      dynamic message = error.toString();
      message = {"R": "3", "M": "Tunnel " + Constants.BASE_URL + " not found"};
      return message;
    }
  }

//------------------------------  VIAJEROS  ------------------------------------

  // POST Registro de Viajero / Ubicacion BotonAdd de Viajero
  static Future<dynamic> registroViajero(body) async {
    String putData = jsonEncode(body);
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Methods": "POST"
    };

    var url = Uri.parse(Constants.BASE_URL + Constants.VIAJEROS);
    //final encoding = Encoding.getByName('utf-8');
    try {
      Utf8Decoder utf8decoder = Utf8Decoder();
      final response = await http.post(url, body: putData, headers: headers);

      print(json.decode(response.body));

      final responseData = json.decode(utf8decoder.convert(response.bodyBytes));
      if (response.statusCode == 200) {
        print("Api rest: " + responseData.toString());
        return response;
      } else {
        return null;
      }
    } on Exception catch (error) {
      //manejo de error por conexion http
      print("api rest error: " + error.toString());
      dynamic message = error.toString();
      message = {"R": "3", "M": "Tunnel " + Constants.BASE_URL + " not found"};
      return message;
    }
  }

  // POST: Actualizar viajero / ubicacion _buttonUpdate del viajero
  static Future<dynamic> actualizarViajero(body) async {
    String putData = jsonEncode(body);
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Methods": "POST"
    };

    var url = Uri.parse(Constants.BASE_URL + Constants.ACTUALIZAR_VIAJERO);
    //final encoding = Encoding.getByName('utf-8');
    try {
      Utf8Decoder utf8decoder = Utf8Decoder();
      final response = await http.post(url, body: putData, headers: headers);

      print(json.decode(response.body));
      final responseData = json.decode(utf8decoder.convert(response.bodyBytes));

      print("Api rest: " + responseData.toString());
      return responseData;
    } on Exception catch (error) {
      //manejo de error por conexion http
      print("api rest error: " + error.toString());
      dynamic message = error.toString();
      message = {"R": "3", "M": "Tunnel " + Constants.BASE_URL + " not found"};
      return message;
    }
  }

  // POST: Eliminar viajero / ubicacion confirm en el listview de viajeros
  static Future<dynamic> eliminarViajero(Map<String, dynamic> body) async {
    String putData = jsonEncode(body);
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Methods": "POST"
    };

    var url = Uri.parse(Constants.BASE_URL + Constants.ELIMINAR_VIAJERO);
    //final encoding = Encoding.getByName('utf-8');
    try {
      Utf8Decoder utf8decoder = Utf8Decoder();
      final response = await http.post(url, headers: headers, body: putData);

      print(json.decode(response.body));

      final responseData = json.decode(utf8decoder.convert(response.bodyBytes));
      if (responseData["R"] == '0') {
        print("Api rest: " + responseData.toString());
        return responseData;
      } else {
        return responseData;
      }
    } on Exception catch (error) {
      //manejo de error por conexion http
      print("api rest error: " + error.toString());
      dynamic message = error.toString();
      message = {"R": "3", "M": "Tunnel " + Constants.BASE_URL + " not found"};
      return message;
    }
  }

//--------------------------------- VIAJES -------------------------------------

  // POST: Agregar Viaje
  static Future<dynamic> agregarViaje(body) async {
    String putData = jsonEncode(body);
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Methods": "POST"
    };

    var url = Uri.parse(Constants.BASE_URL + Constants.AGREGAR_VIAJE);
    //final encoding = Encoding.getByName('utf-8');
    try {
      Utf8Decoder utf8decoder = Utf8Decoder();
      final response = await http.post(url, body: putData, headers: headers);

      print(json.decode(response.body));

      final responseData = json.decode(utf8decoder.convert(response.bodyBytes));
      if (response.statusCode == 200) {
        print("Api rest: " + responseData.toString());
        return response;
      } else {
        return null;
      }
    } on Exception catch (error) {
      //manejo de error por conexion http
      print("api rest error: " + error.toString());
      dynamic message = error.toString();
      message = {"R": "3", "M": "Tunnel " + Constants.BASE_URL + " not found"};
      return message;
    }
  }

  // POST: Eliminar viaje / ubicacion confirm en el listview de viajes
  static Future<dynamic> eliminarViaje(Map<String, dynamic> body) async {
    String putData = jsonEncode(body);
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Methods": "POST"
    };

    var url = Uri.parse(Constants.BASE_URL + Constants.ELIMINAR_VIAJE);
    //final encoding = Encoding.getByName('utf-8');
    try {
      Utf8Decoder utf8decoder = Utf8Decoder();
      final response = await http.post(url, headers: headers, body: putData);

      print(json.decode(response.body));

      final responseData = json.decode(utf8decoder.convert(response.bodyBytes));
      if (responseData["R"] == '0') {
        print("Api rest: " + responseData.toString());
        return responseData;
      } else {
        return responseData;
      }
    } on Exception catch (error) {
      //manejo de error por conexion http
      print("api rest error: " + error.toString());
      dynamic message = error.toString();
      message = {"R": "3", "M": "Tunnel " + Constants.BASE_URL + " not found"};
      return message;
    }
  }

  // POST: Actualizar viaje / ubicacion _buttonUpdate del viaje
  static Future<dynamic> actualizarViaje(body) async {
    String putData = jsonEncode(body);
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Methods": "POST"
    };

    var url = Uri.parse(Constants.BASE_URL + Constants.ACTUALIZAR_VIAJE);
    //final encoding = Encoding.getByName('utf-8');
    try {
      Utf8Decoder utf8decoder = Utf8Decoder();
      final response = await http.post(url, body: putData, headers: headers);

      print(json.decode(response.body));
      final responseData = json.decode(utf8decoder.convert(response.bodyBytes));

      print("Api rest: " + responseData.toString());
      return responseData;
    } on Exception catch (error) {
      //manejo de error por conexion http
      print("api rest error: " + error.toString());
      dynamic message = error.toString();
      message = {"R": "3", "M": "Tunnel " + Constants.BASE_URL + " not found"};
      return message;
    }
  }
}
