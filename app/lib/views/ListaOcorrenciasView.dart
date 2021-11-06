import 'package:conserta_aqui/utils/ColorUtil.dart';
import 'package:conserta_aqui/views/components/HeaderListaOcorrencias.dart';
import 'package:conserta_aqui/views/components/ItemListaOcorrencias.dart';
import 'package:flutter/material.dart';

class ListaOcorrenciasView extends StatefulWidget {
  const ListaOcorrenciasView({ Key? key }) : super(key: key);

  @override
  _ListaOcorrenciasViewState createState() => _ListaOcorrenciasViewState();
}

class _ListaOcorrenciasViewState extends State<ListaOcorrenciasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.COR_06,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              HeaderListaOcorrencias(),
              ItemListaOcorrencias(descricao: "Buraco na Pista",),
              ItemListaOcorrencias(descricao: "Lamapada Queimada",),
              ItemListaOcorrencias(descricao: "Boca de Lobo entupida",),
            ],
          ),
        ),
      ),
    );
  }
}