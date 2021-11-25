import 'dart:typed_data';

import 'package:conserta_aqui/utils/ColorUtil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImagem extends StatefulWidget {
  const UploadImagem({ Key? key }) : super(key: key);

  @override
  _UploadImagemState createState() => _UploadImagemState();
}

class _UploadImagemState extends State<UploadImagem> {
  
  Uint8List? imagem;

  List<Widget> getConteudoUpload() {
    if(this.imagem == null) {
      return [
        Icon(
          Icons.file_upload_outlined, 
          size: 80, 
          color: ColorUtil.COR_01,
        ),
        Text(
          'Toque para selecionar um arquivo',
          style: TextStyle(
            color: ColorUtil.COR_03,
          ),
        ),
      ];
    } else {
      return [
        Image.memory(this.imagem!, height: 200)
      ];
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(12),
        strokeWidth: 1,
        dashPattern: [ 5 ],
        child: GestureDetector(
          onTap: () async {
            final ImagePicker _picker = ImagePicker();
            final XFile? image = await _picker.pickImage(source: ImageSource.camera);

            if(image != null) {
              Uint8List dadosImagem = await image.readAsBytes();
              setState(() {
                this.imagem = dadosImagem;
              });
            }
          },
          child: Container(
            height: 200,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: this.getConteudoUpload(),
            ),
          ),
        )
      ),
    );
  }
}