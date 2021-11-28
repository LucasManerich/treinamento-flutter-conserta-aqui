import 'package:conserta_aqui/utils/ColorUtil.dart';
import 'package:conserta_aqui/views/components/ItemMenuSituacao.dart';
import 'package:flutter/material.dart';

class MenuSituacaoOcorrencia extends StatefulWidget {
  final Function onSelecionaItemMenu;

  const MenuSituacaoOcorrencia({ 
    Key? key,
    required this.onSelecionaItemMenu,
  }) : super(key: key);

  @override
  _MenuSituacaoOcorrenciaState createState() => _MenuSituacaoOcorrenciaState();
}

class _MenuSituacaoOcorrenciaState extends State<MenuSituacaoOcorrencia> {

  bool pendentes = true;
  bool resolvidos = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: ColorUtil.COR_05,
      ),
      child: Row(
        children: [
          ItemMenuSituacao(
            titulo: 'Pendentes', 
            ativo: this.pendentes,
            onPressed: () {
              setState(() {
                this.widget.onSelecionaItemMenu('PENDENTE');
                this.pendentes = true;
                this.resolvidos = false;
              });
            },
          ),
          ItemMenuSituacao(
            titulo: 'Resolvidos', 
            ativo: this.resolvidos,
            onPressed: () {
              setState(() {
                this.widget.onSelecionaItemMenu('RESOLVIDO');
                this.pendentes = false;
                this.resolvidos = true;
              });
            },
          )
        ],
      ),      
    );
  }
}


