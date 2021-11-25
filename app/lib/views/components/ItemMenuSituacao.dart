import 'package:conserta_aqui/utils/ColorUtil.dart';
import 'package:flutter/material.dart';

class ItemMenuSituacao extends StatelessWidget {
  final bool ativo;
  final String titulo;
  final Function() onPressed;

  const ItemMenuSituacao({ 
    Key? key, 
    required this.ativo, 
    required this.titulo,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: this.onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: this.ativo ? ColorUtil.COR_01 : Colors.transparent,
          ),
          height: 50,
          child: Center(
            child: Text(
              '${this.titulo}',
              style: TextStyle(
                color: this.ativo ? ColorUtil.COR_04 : ColorUtil.COR_01
              ),
            )
          ),
        ),
      )
    );
  }
}






