import 'package:flutter/material.dart';

@immutable
class Answar extends StatelessWidget {
  final String answarText;
  void Function() ansFun;

  Answar(this.ansFun, this.answarText);

  @override
  Widget build(BuildContext context) {
    final styl = ElevatedButton.styleFrom(
      primary: Colors.blue,
      padding: const EdgeInsets.all(15.0),
    );
    return Container(
      margin: const EdgeInsets.all(15.0),
      width: double.infinity,
      child: ElevatedButton(
          style: styl,
          onPressed: ansFun,
          child: Text(
            answarText,
            style: const TextStyle(fontSize: 25),
          )),
    );
  }
}
