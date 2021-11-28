import 'dart:typed_data';

import 'package:conserta_aqui/utils/ColorUtil.dart';
import 'package:conserta_aqui/views/components/DescricaoOcorrencia.dart';
import 'package:conserta_aqui/views/components/IndicadorEtapa.dart';
import 'package:conserta_aqui/views/components/MapaLocalizacao.dart';
import 'package:conserta_aqui/views/components/UploadImagem.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/material.dart';

class IncluirOcorrenciaView extends StatefulWidget {
  const IncluirOcorrenciaView({ Key? key }) : super(key: key);

  @override
  _IncluirOcorrenciaViewState createState() => _IncluirOcorrenciaViewState();
}

class _IncluirOcorrenciaViewState extends State<IncluirOcorrenciaView> {

  DioForNative api = DioForNative(BaseOptions(baseUrl: 'http://10.5.101.248:3131'));
  
  int etapaAtual = 1;

  double? latitude;
  double? longitude;
  Uint8List? imagem;
  String? descricao;

  String getTituloEtapa() {
    switch(etapaAtual) {
      case 1:
        return 'Selecione a localização';
      case 2:
        return 'Adicione imagens a solicitação';
      case 3:
        return 'Informe a descrição da solicitação';
    }
    return '';
  }

  Future<void> processaInclusao() async {
    FormData formData = FormData.fromMap({
      "descricao": this.descricao,
      "latitude": this.latitude,
      "longitude": this.longitude,
      "imagem": await MultipartFile.fromBytes(
        List.from(this.imagem!),
        filename: 'imagem.jpg'
      )
    });

    Response response = await this.api.post('/ocorrencia', data: formData);

    if(response.statusCode == 200) {
      Navigator.of(context).pop();
    }
  }

  Widget getWidgetEtapaAtual() {
    switch(etapaAtual) {
      case 1:
        return MapaLocalizacao(
          onSelecionaLocalizacao: (latitude, longitude) {
            this.latitude = latitude;
            this.longitude = longitude;
          },
        );
      case 2:
        return UploadImagem(
          onSelecionaImagem: (imagem) {
            this.imagem = imagem;
          },
        );
      case 3:
        return DescricaoOcorrencia(
          onDigitaDescricao: (descricao) {
            this.descricao = descricao;
          },
        );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.COR_06,
      body: Container(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () {
                                if(this.etapaAtual > 1) {
                                  setState(() {
                                    this.etapaAtual--;
                                  });
                                } else {
                                  Navigator.of(context).pop();
                                }
                              }, 
                              icon: Icon(
                                Icons.chevron_left, 
                                color: ColorUtil.COR_01, 
                                size: 32,
                              ),
                            ),
                            Icon(
                              Icons.person_outline,
                              color: ColorUtil.COR_01,
                              size: 26,
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          this.getTituloEtapa(),
                          style: TextStyle(
                            color: ColorUtil.COR_02,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Passo ${this.etapaAtual}/3',
                           style: TextStyle(
                              color: ColorUtil.COR_03,
                              fontSize: 14, 
                           ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  IndicadorEtapa(
                    totalEtapas: 3,
                    etapaAtual: this.etapaAtual,
                  ),
                  this.getWidgetEtapaAtual(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                widthFactor: this.etapaAtual == 3 ? 0.60 : 0.40,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(ColorUtil.COR_01),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.all(15)
                      )
                    ),
                    onPressed: () {
                      setState(() {
                        if(this.etapaAtual <= 2) {
                          this.etapaAtual++;
                        } else {
                          // processamento da inclusão
                          this.processaInclusao();
                        }
                      });
                    },
                    child: Text(this.etapaAtual == 3 ? 'Finalizar Solicitação' : 'Avançar'),
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}