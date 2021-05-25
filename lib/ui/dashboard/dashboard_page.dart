import 'dart:convert';
import 'package:dashboard/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//stf

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Map data;
  List travelsData;
  getViajeros() async {
    Utf8Decoder utf8decoder = Utf8Decoder();
    final response = await http
        .get(Uri.parse(Constants.BASE_URL + Constants.VIAJES_SIN_ASIGNAR));
    final data = json.decode(utf8decoder.convert(response.bodyBytes));
    debugPrint(response.body);

    setState(() {
      travelsData = data['viajes'];
    });
  }

  @override
  void initState() {
    super.initState();
    getViajeros();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    //sm for small screens > 575px and < 768px
    // md for medium screens > 767px and < 992px
    // lg for large screens > 991px and < 1200px
    // xl for extra large screens > 1199px

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Viajes Disponibles",
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black87,
          padding: EdgeInsets.all(30),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
            itemBuilder: (context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    cards(
                      "images/cities/${travelsData[index]["destino"]}.jpg",
                      "${travelsData[index]["destino"]}",
                      "No. Plazas: ${travelsData[index]["numero_plazas"]}",
                      "${travelsData[index]["precio"]}",
                    ),
                  ],
                ),
              );
            },
            itemCount: travelsData == null ? 0 : travelsData.length,
          ),
        ),
      ),
    );
  }

  Widget cards(image, title, place, price) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 150,
      width: 300,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "images/cities/$title.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    //margin: EdgeInsets.only(left: 5.0),
                    child: Text(
                      place,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(left: 5.0, bottom: 10, right: 5),
              child: Text(
                "\$" + price,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          //Icons,
        ],
      ),
    );
  }
}

// SizedBox(height: 8),
// Divider(color: Colors.purple, height: 50,),
