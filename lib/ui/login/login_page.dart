import 'package:dashboard/constants/styles.dart';
import 'package:dashboard/main_login.dart';
import 'package:dashboard/model/res/api_rest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_svg/flutter_svg.dart';

//stf

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_LoginPageState');
  final _usuarioController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    //sm for small screens > 575px and < 768px
    // md for medium screens > 767px and < 992px
    // lg for large screens > 991px and < 1200px
    // xl for extra large screens > 1199px

    return Scaffold(
      body: SingleChildScrollView(
        child: BootstrapContainer(
          fluid: true,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          children: [
            Material(
              elevation: 20,
              child: BootstrapContainer(
                fluid: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BootstrapRow(
                      height:
                          height, //es obligatorio poner una altura al container
                      children: [
                        BootstrapCol(
                          sizes:
                              'col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 col-sm-6', //orders: 'order-4 order-sm-4 order-md-4 order-lg-4 order-xl-4',
                          invisibleForSizes: 'sm',
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(60),
                              //height: _scale.labelDim * 21,
                              height: height - 50,
                              color: Colors.black,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Text(
                                      'Agencia de Viajes',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: _scale.labelDim * 3.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: SvgPicture.asset(
                                      "assets/images/undraw_adventure.svg",
                                      height: height,
                                      width: width,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        BootstrapCol(
                          sizes: 'col-12 col-sm-6 col-md-6 col-lg-6 col-xl-6',
                          child: Form(
                            key: _formKey,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.black,
                                height: height - 50,
                                //height: _scale.labelDim * 21,
                                padding: const EdgeInsets.all(35.0),
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
                                              sizes:
                                                  'col-12 col-sm-8 col-md-12 col-lg-12 col-xl-12',
                                              //invisibleForSizes: 'sm',
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  "assets/images/undraw_Travelers.svg",
                                                  height: 200.0,
                                                  width: 200.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 70,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: BootstrapRow(
                                          height:
                                              60, //es obligatorio poner una altura al container
                                          children: [
                                            BootstrapCol(
                                              sizes:
                                                  'col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12',
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  controller:
                                                      _usuarioController,
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return "El campo no debe estar vacio";
                                                    }
                                                    return null;
                                                  },
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    labelText: 'Usuario',
                                                    icon: Icon(
                                                      Icons.person,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            BootstrapCol(
                                              sizes:
                                                  'col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12',
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  obscureText: true,
                                                  controller:
                                                      _passwordController,
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return "El campo no debe estar vacio";
                                                    }
                                                    return null;
                                                  },
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  decoration: InputDecoration(
                                                    labelText: 'Password',
                                                    icon: Icon(
                                                      Icons.email,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: BootstrapRow(
                                          height:
                                              60, //es obligatorio poner una altura al container
                                          children: [
                                            BootstrapCol(
                                              sizes:
                                                  'col-12 col-sm-6 col-md-6 col-lg-4 col-xl-6',
                                              child: _buttonLogin(context),
                                            ),
                                            BootstrapCol(
                                              sizes:
                                                  'col-12 col-sm-6 col-md-6 col-lg-4 col-xl-6',
                                              child: _buttonCancel(context),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonCancel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.red,
          onSurface: Colors.grey,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MyDashboard(),
            ),
          );
        },
        child: Text('Cancel'),
      ),
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.black,
          onSurface: Colors.grey,
        ),
        onPressed: () {
          if (!_formKey.currentState.validate()) {
            // Invalid!
            return;
          }
          _formKey.currentState.save();
          final Map<String, dynamic> body = {
            "usuario": _usuarioController.text,
            "password": _passwordController.text,
          };
          try {
            ApiService.postLogin(body).then((response) {
              print("response: " + response.toString());
              //Map<String, dynamic> map = json.decode(response.toString());
              if (response["R"] == '0') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyDashboard(),
                  ),
                );
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.redAccent,
                  ),
                );
              } else if (response["R"] == '1') {
                print("response:" + response.toString());
                return showDialog(
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    content: Container(
                      height: 250,
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
                              response["M"],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            child: Text(
                              'Usuario o password invalido!!!',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            height: 25,
                            width: 180,
                            margin: EdgeInsets.only(top: 40),
                            child: TextButton(
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
                                _passwordController.text = '';
                                _usuarioController.text = '';
                              },
                              child: Text(
                                'Cerrar',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
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
            print("loginPageError: " + error);
          }
        },
        child: Text(
          'Login',
        ),
      ),
    );
  }
}
