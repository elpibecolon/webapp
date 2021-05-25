import 'package:dashboard/routes/routes.dart';
import 'package:dashboard/widgets/navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationDevice extends StatefulWidget {
  @override
  _NavigationDeviceState createState() => _NavigationDeviceState();
}

class _NavigationDeviceState extends State<NavigationDevice> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width > size.height ? size.height : size.width;

    setState(() {
      print(width);
    });

    if (width < 590) {
      return menuScreenPhone(context);
    } else if (width > 591 && width < 700) {
      return menuScreenTablet(context);
    } else if (width > 700) {
      return menuScreenDesktop(context);
    } else {
      return menuScreenDesktop(context);
    }
  }

  Container menuScreenPhone(BuildContext context) {
    return Container(
      width: 60,
      height: MediaQuery.of(context).size.height * 1.5,
      color: Colors.black,
      //color: Color(0x1C2833).withOpacity(0.8),
      //color: Color(0x1C2833).withOpacity(0.5),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          IconButton(
            icon: new FaIcon(
              FontAwesomeIcons.tachometerAlt,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () => navKey.currentState.pushNamed('/dashboard'),
          ),
          Divider(color: Colors.grey[300]),
          IconButton(
            icon: new FaIcon(
              FontAwesomeIcons.idBadge,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () => navKey.currentState.pushNamed('/client'),
          ),
          Divider(color: Colors.grey[300]),
          IconButton(
            icon: Icon(
              Icons.airplanemode_active,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () => navKey.currentState.pushNamed('/invoice'),
          ),
          Divider(color: Colors.grey[300]),
          IconButton(
            icon: new FaIcon(
              FontAwesomeIcons.tasks,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () => navKey.currentState.pushNamed('/task'),
          ),
          Divider(color: Colors.grey[300]),
          IconButton(
            icon: new FaIcon(
              FontAwesomeIcons.ccAmazonPay,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () => navKey.currentState.pushNamed('/pays'),
          ),
          Divider(color: Colors.grey[300]),
          IconButton(
            icon: new FaIcon(
              FontAwesomeIcons.chartPie,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () => navKey.currentState.pushNamed('/reports'),
          ),
          Divider(color: Colors.grey[300]),
        ],
      ),
    );
  }

  Container menuScreenTablet(BuildContext context) {
    return Container(
      width: 60,
      height: MediaQuery.of(context).size.height * 2.0,
      color: Colors.black,
      //color: Color(0xFF808080).withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      //backgroundColor: Colors.black,
                      onSurface: Colors.yellow,
                    ),
                    onPressed: () => {
                      navKey.currentState.pushNamed('/dashboard'),
                    },
                    //color: Colors.transparent,
                    //padding: EdgeInsets.only(top: 10.0),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // Replace with a Row for horizontal icon + text
                      children: [
                        FaIcon(
                          FontAwesomeIcons.tachometerAlt,
                          size: 19,
                          color: Colors.white,
                        ),
                        Text(
                          "Disponibles",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Divider(color: Colors.grey[300]),
          Row(
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      //backgroundColor: Colors.black,
                      onSurface: Colors.purple,
                    ),
                    onPressed: () => {
                      navKey.currentState.pushNamed('/client'),
                    },
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.idBadge,
                          size: 20,
                          color: Colors.white,
                        ),
                        Text(
                          "Viajeros",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Divider(color: Colors.grey[300]),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      //backgroundColor: Colors.black,
                      onSurface: Colors.purple,
                    ),
                    onPressed: () => {
                      navKey.currentState.pushNamed('/invoice'),
                    },
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(
                          Icons.airplanemode_active,
                          size: 20,
                          color: Colors.white,
                        ),
                        Text(
                          "Viajes",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Divider(color: Colors.grey[300]),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      //backgroundColor: Colors.black,
                      onSurface: Colors.purple,
                    ),
                    onPressed: () => {
                      navKey.currentState.pushNamed('/task'),
                    },
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.tasks,
                          size: 15,
                          color: Colors.white,
                        ),
                        Text(
                          "Tickets",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Divider(color: Colors.grey[300]),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      //backgroundColor: Colors.black,
                      onSurface: Colors.purple,
                    ),
                    onPressed: () => {
                      navKey.currentState.pushNamed('/pays'),
                    },
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.ccAmazonPay,
                          size: 15,
                          color: Colors.white,
                        ),
                        Text(
                          "Pagos",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Divider(color: Colors.grey[300]),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      //backgroundColor: Colors.black,
                      onSurface: Colors.purple,
                    ),
                    onPressed: () => {
                      navKey.currentState.pushNamed('/reports'),
                    },
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.chartPie,
                          size: 15,
                          color: Colors.white,
                        ),
                        Text(
                          "Reportes",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Divider(color: Colors.grey[300]),
        ],
      ),
    );
  }

  Container menuScreenDesktop(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0, right: 0),
      alignment: Alignment.centerLeft,
      width: 150,
      height: MediaQuery.of(context).size.height * 2.0,
      //color: Colors.pink,
      //color: Color(0xFF808080).withOpacity(0.9),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              SizedBox(
                width: 7,
              ),
              FaIcon(
                FontAwesomeIcons.tachometerAlt,
                size: 25,
                color: Colors.white,
              ),
              SizedBox(
                width: 7,
              ),
              NavigationItem(
                selected: index == 0,
                title: 'Disponibles',
                routeName: routeDashboard,
                onHighlight: onHighlight,
              ),
            ],
          ),
          Divider(color: Colors.grey[300]),
          Row(
            children: [
              SizedBox(
                width: 12,
              ),
              FaIcon(
                FontAwesomeIcons.idBadge,
                size: 25,
                color: Colors.white,
              ),
              SizedBox(
                width: 12,
              ),
              NavigationItem(
                selected: index == 2,
                title: 'Viajeros',
                routeName: routeClient,
                onHighlight: onHighlight,
              ),
            ],
          ),
          Divider(color: Colors.grey[300]),
          Row(
            children: [
              SizedBox(
                width: 7,
              ),
              Icon(
                Icons.airplanemode_active,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(
                width: 7,
              ),
              NavigationItem(
                selected: index == 3,
                title: 'Viajes',
                routeName: routeInvoice,
                onHighlight: onHighlight,
              ),
            ],
          ),
          Divider(color: Colors.grey[300]),
          Row(
            children: [
              SizedBox(
                width: 7,
              ),
              FaIcon(
                FontAwesomeIcons.tasks,
                size: 25,
                color: Colors.white,
              ),
              SizedBox(
                width: 7,
              ),
              NavigationItem(
                selected: index == 5,
                title: 'Tickets',
                routeName: routeTask,
                onHighlight: onHighlight,
              ),
            ],
          ),
          Divider(
            color: Colors.grey[300],
          ),
          Row(
            children: [
              SizedBox(
                width: 7,
              ),
              FaIcon(
                FontAwesomeIcons.ccAmazonPay,
                size: 25,
                color: Colors.white,
              ),
              SizedBox(
                width: 7,
              ),
              NavigationItem(
                selected: index == 4,
                title: 'Pagos',
                routeName: routePays,
                onHighlight: onHighlight,
              ),
            ],
          ),
          Divider(color: Colors.grey[300]),
          Row(
            children: [
              SizedBox(
                width: 7,
              ),
              FaIcon(
                FontAwesomeIcons.chartPie,
                size: 25,
                color: Colors.white,
              ),
              SizedBox(
                width: 7,
              ),
              NavigationItem(
                selected: index == 6,
                title: 'Reportes',
                routeName: routeReports,
                onHighlight: onHighlight,
              ),
            ],
          ),
          Divider(
            color: Colors.grey[300],
            height: 20,
          ),
        ],
      ),
    );
  }

  void onHighlight(String route) {
    switch (route) {
      case routeDashboard:
        changeHighlight(0);
        break;
      case routeClient:
        changeHighlight(2);
        break;
      case routeInvoice:
        changeHighlight(3);
        break;
      case routePays:
        changeHighlight(4);
        break;
      case routeTask:
        changeHighlight(5);
        break;
      case routeReports:
        changeHighlight(6);
        break;
    }
  }

  void changeHighlight(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }
}
