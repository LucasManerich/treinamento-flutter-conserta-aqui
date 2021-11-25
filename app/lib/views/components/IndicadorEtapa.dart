import 'package:conserta_aqui/utils/ColorUtil.dart';
import 'package:flutter/material.dart';

class IndicadorEtapa extends StatelessWidget {
  final int totalEtapas;
  final int etapaAtual;

  const IndicadorEtapa({ 
    Key? key, 
    required this.etapaAtual, 
    required this.totalEtapas
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 10,
          color: ColorUtil.COR_05,
        ),
        FractionallySizedBox(
          widthFactor: (( 100 / this.totalEtapas) / 100) * this.etapaAtual,
          child: Container(
            height: 10,
            decoration: BoxDecoration(
              color: ColorUtil.COR_01,
              borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}