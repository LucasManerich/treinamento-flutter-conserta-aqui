import 'package:conserta_aqui/utils/ColorUtil.dart';
import 'package:conserta_aqui/views/IncluirOcorrenciaView.dart';
import 'package:conserta_aqui/views/components/HeaderListaOcorrencias.dart';
import 'package:conserta_aqui/views/components/ItemListaOcorrencias.dart';
import 'package:conserta_aqui/views/components/MenuSituacaoOcorrencia.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/material.dart';

class ListaOcorrenciasView extends StatefulWidget {
  const ListaOcorrenciasView({ Key? key }) : super(key: key);

  @override
  _ListaOcorrenciasViewState createState() => _ListaOcorrenciasViewState();
}

class _ListaOcorrenciasViewState extends State<ListaOcorrenciasView> {

  DioForNative api = DioForNative(BaseOptions(baseUrl: 'http://10.5.101.248:3131'));
  String situacao = 'PENDENTE';

  Future<List> getListaOcorrencia() async {
    Response response = await this.api.get('/ocorrencia');
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.COR_06,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorUtil.COR_01,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => IncluirOcorrenciaView())
          ).then((value) => setState(() {}));
        },
        child: Icon(Icons.add)
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              HeaderListaOcorrencias(),
              SizedBox(height: 15),
              Container(
                height: 1,
                color: ColorUtil.COR_05,
              ),
              SizedBox(height: 15),
              MenuSituacaoOcorrencia(
                onSelecionaItemMenu: (situacao) {
                  setState(() {
                    this.situacao = situacao;
                  });
                },
              ),
              SizedBox(height: 15),
              FutureBuilder<List>(
                future: this.getListaOcorrencia(),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return Column(
                      children: snapshot.data!
                        .where((ocorrencia) => ocorrencia['situacao'] == this.situacao)
                        .map(
                          (ocorrencia) => ItemListaOcorrencias(
                            descricao: ocorrencia['descricao'],
                            data: ocorrencia['data'],
                            latitude: double.parse(ocorrencia['latitude']),
                            longitude: double.parse(ocorrencia['longitude']),
                            imagem: "http://10.5.101.248:3131/imagem/${ocorrencia['imagem']}",
                          )
                        ).toList(),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}