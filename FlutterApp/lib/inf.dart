import 'package:camera2/bottonnavigator.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as prefix0;

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  //int _selectedIndex;
  //Function _onItemTapped;
  //_InfoState(this._selectedIndex, this._onItemTapped);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: Text(
          'Como tirar uma boa foto',
          style: TextStyle(
            fontFamily: 'Roboto Mono',
            fontSize: 19,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: corpo(),
      //bottomNavigationBar: bottomNormal(_selectedIndex, _onItemTapped),
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Colors.greenAccent,
      //     child: Icon(
      //       Icons.help_outline,
      //       color: Colors.white,
      //       size: 40,
      //       semanticLabel: "help",
      //     ),
      //     onPressed: () {
      //       showAlertDialog(context);
      //       //gett();
      //     }),
    );
  }

  Widget corpo() {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 25, 15, 15),
        child: Column(
          children: <Widget>[
            Text(
              "Para um diagnóstico mais preciso siga algumas dicas para tirar a foto:\n\n  - Coloque o zoom da câmera no máximo.\n\n  - Quando maior a foto da mancha mais preciso será o exame.\n    Então busque uma boa aproximação do celular, porém em uma distância que ainda consiga um bom foco",
              style: TextStyle(
                  color: Color.fromRGBO(15, 60, 105, 1),
                  fontSize: 15,
                  fontFamily: 'Roboto Mono',
                  fontWeight: FontWeight.w900),
            ),
            Text(
              "\n\nUma boa foto é algo semelhante a imagem abaixo:\n",
              style: TextStyle(
                  color: Color.fromRGBO(15, 60, 105, 1),
                  fontSize: 15,
                  fontFamily: 'Roboto Mono',
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.only(top: 25),
              height: 90,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage("image/pinta.jpeg"),
                  fit: BoxFit.contain,
                ),

                // child: Image.file(file,
                // ),
              ),
            ),
          ],
        ));
  }
}
