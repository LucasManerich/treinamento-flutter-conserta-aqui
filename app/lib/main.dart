import 'package:conserta_aqui/views/ListaOcorrenciasView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppConsertaAqui());
}

class AppConsertaAqui extends StatelessWidget {
  const AppConsertaAqui({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conserta Aqui',
      theme: ThemeData(
        fontFamily: 'Inter'
      ),
      home: ListaOcorrenciasView(),
    );
  }
}