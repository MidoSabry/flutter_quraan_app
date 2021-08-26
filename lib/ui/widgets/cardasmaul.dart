import 'package:flutter/material.dart';

class CardAsmaul extends StatelessWidget {
  const CardAsmaul({
    Key key,
    @required this.title,
    @required this.arabic,
  }) : super(key: key);
  final String title;
  final String arabic;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              arabic,
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(title),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
