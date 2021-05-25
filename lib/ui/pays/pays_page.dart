import 'package:dashboard/constants/styles.dart';
import 'package:flutter/material.dart';

class PaysPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);

    return Center(
      child: Container(
        child: Text(
          'Pagos',
          style: TextStyle(color: Colors.black, fontSize: _scale.labelDim * 5),
        ),
      ),
    );
  }
}
