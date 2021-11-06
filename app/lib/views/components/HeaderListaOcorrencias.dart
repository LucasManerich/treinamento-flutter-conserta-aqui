import 'package:conserta_aqui/utils/ColorUtil.dart';
import 'package:flutter/material.dart';

class HeaderListaOcorrencias extends StatelessWidget {
  const HeaderListaOcorrencias({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.list, color: ColorUtil.COR_01, size: 25),
            Icon(Icons.list, color: ColorUtil.COR_01, size: 25),
          ],
        ),
        SizedBox(height: 20),
        Text(
          "Olá, Aluno!", 
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: ColorUtil.COR_02,
          ),
        ),
        Text(
          "Andamento dos Serviços Públicos",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: ColorUtil.COR_03,
          ),
        )
      ],
    );
  }
}