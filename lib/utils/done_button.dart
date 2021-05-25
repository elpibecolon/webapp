import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({
    Key key,
    this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 360,
      margin: EdgeInsets.only(top: 40),
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // ignore: deprecated_member_use
        color: Theme.of(context).accentColor,
        child: Text(
          'Close',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
