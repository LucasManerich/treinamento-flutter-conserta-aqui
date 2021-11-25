import 'package:conserta_aqui/utils/ColorUtil.dart';
import 'package:flutter/material.dart';

class DescricaoOcorrencia extends StatelessWidget {
  const DescricaoOcorrencia({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Descreva sua solicitação...',
          hintStyle: TextStyle(
            color: ColorUtil.COR_03,
            fontSize: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtil.COR_05, width: 1),
          ),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(10),
        ),
        minLines: 3,
        maxLines: null, 
        keyboardType: TextInputType.multiline,
      )
    );
  }
}