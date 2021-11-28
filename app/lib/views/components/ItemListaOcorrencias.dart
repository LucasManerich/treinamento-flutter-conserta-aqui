import 'package:conserta_aqui/utils/ColorUtil.dart';
import 'package:flutter/material.dart';

class ItemListaOcorrencias extends StatelessWidget {
  final String? descricao;
  final String? data;
  final double? latitude;
  final double? longitude;
  final String? imagem;

  const ItemListaOcorrencias({ 
    Key? key, 
    this.descricao,
    this.data,
    this.latitude,
    this.longitude,
    this.imagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: ColorUtil.COR_04,
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "O que aconteceu?", 
                      style: TextStyle(
                        color: ColorUtil.COR_03,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                    "${this.descricao}",
                      style: TextStyle(
                        color: ColorUtil.COR_02,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Quando?", 
                      style: TextStyle(
                        color: ColorUtil.COR_03,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "${this.data}",
                      style: TextStyle(
                        color: ColorUtil.COR_02,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 0))
                      ),
                      onPressed: () {}, 
                      child: Row(
                        children: [
                          Icon(Icons.location_on),
                          Text("Ver no mapa")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "${this.imagem}", 
                  width: 120,
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}