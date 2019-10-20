import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget remindButton = FlatButton(
    child: Text(
      "OK",
      style: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w800, color: Colors.white),
    ),
    onPressed: () {
      Navigator.pop(context, true);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.greenAccent,
    title: Text(
      "Atenção!",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
    ),
    content: Text(
      "Este aplicativo não dever ser usado para um diagnóstico completo e sim como auxilio.\n\nPois existem casos onde o que pode diferenciar uma mancha comum de uma cancerígena é se ela vem crescendo, a idade do paciente e dentro outras razões. E essas variáveis não estão sendo observadas pelo aplicativo.",
      style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
    ),
    actions: [
      remindButton,
    ],
  );

// show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
