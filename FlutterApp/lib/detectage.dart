import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:camera2/alert.dart';
import 'package:camera2/ordenar.dart';
import 'package:camera2/webview.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image/image.dart' as prefix0;
//import 'package:url_launcher/url_launcher.dart';
//import 'package:webview_flutter/webview_flutter.dart';

class Detect extends StatefulWidget {
  final File file;
  Detect(this.file);

  @override
  _State createState() => _State(file);
}

class _State extends State<Detect> {
  Map _webdic = {
    "akiec":
        "https://www.sbd.org.br/dermatologia/pele/doencas-e-problemas/cancer-da-pele/64/",
    "bcc":
        "https://www.sbd.org.br/dermatologia/pele/doencas-e-problemas/cancer-da-pele/64/",
    "bkl":
        "https://www.sbd.org.br/dermatologia/pele/doencas-e-problemas/nevos-displasicos/15/",
    "df":
        "https://www.sbd.org.br/dermatologia/pele/doencas-e-problemas/dermatofibroma/77/",
    "mel":
        "https://www.sbd.org.br/dermatologia/pele/doencas-e-problemas/cancer-da-pele/64/",
    "nv":
        "https://www.sbd.org.br/dermatologia/pele/doencas-e-problemas/nevos-displasicos/15/",
    "vasc2":
        "https://www.sbd.org.br/dermatologia/pele/doencas-e-problemas/hemangioma/85/",
    "vasc":
        "https://www.sbd.org.br/dermatologia/pele/doencas-e-problemas/granuloma-piogenico/50/",
  };

  Map _dicts = {
    "akiec": "Carcinoma espinocelular",
    "bcc": "Carcinoma basocelular",
    "bkl": "Queratoses actínicas/seborreicas",
    "df": "Dermatofibroma",
    "mel": "Melanoma",
    "nv": "Nevos melanocítico",
    "vasc": "Lesões vasculares de pele"
  };
  File file;
  _State(this.file);
  String class1;
  Map jsondata = {};

  List _keys = [];
  List _values = [];

  double valor1;
  String chave1;
  double valor2;
  String chave2;
  double valor3;
  String chave3;

  //get http => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gett().then((data) {
      setState(() {
        _values = data.values.toList();
        _keys = data.keys.toList();

        compare(_values, _keys);
        //print("########################");
        //print(valor1);
        //print(valor2);
        //print(valor3);
        //print("########################");
        //print(_values);
        //print(_keys);
      });
    });
  }

  Future gett() async {
    var data = await http.get('Put URL');
    var jsondata2 = json.decode(data.body);
    print(jsondata2);
    print(jsondata2.runtimeType);

    //otavio(jsondata);
    return jsondata2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: Text(
          'Análise',
          style: TextStyle(
            fontFamily: 'Roboto Mono',
            fontSize: 19,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: gett(),
          builder: (context, snap) {
            switch (snap.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Dialog(
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      new CircularProgressIndicator(),
                      new Text("Loading"),
                    ],
                  ),
                );
              default:
                if (snap.hasError)
                  return Container();
                else
                  return printResult(context, snap);
            }
          },
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        height: 50.0,
        width: 50.0,
        child: FittedBox(
            child: FloatingActionButton(
                backgroundColor: Colors.greenAccent,
                child: Icon(
                  Icons.help_outline,
                  color: Colors.white,
                  size: 40,
                  semanticLabel: "help",
                ),
                onPressed: () {
                  showAlertDialog(context);
                  //gett();
                })),
      ),
    );
  }

  Widget printResult(BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: <Widget>[
          Container(
            //padding: EdgeInsets.only(top: 100.0),
            height: 200,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: FileImage(
                  file,
                ),
                fit: BoxFit.contain,
              ),

              // child: Image.file(file,
              // ),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(17, 5, 17, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    //height: 40,
                    width: 500,

                    child: RaisedButton(
                      color: Colors.grey[50],
                      //colorBrightness: Brightness.dark,
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        String site = _webdic[chave1];
                        String nome = _dicts[chave1];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Web(site, nome)));
                      },
                      child: Text(
                        "${_dicts[chave1]}: ${valor1}%",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto Mono',
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(15, 60, 105, 0.9)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    //height: 40,
                    width: 500,
                    child: RaisedButton(
                      color: Colors.grey[50],
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () {
                        String site = _webdic[chave2];
                        String nome = _dicts[chave2];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Web(site, nome)));
                      },
                      child: Text(
                        "${_dicts[chave2]}: ${valor2}%",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto Mono',
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(15, 60, 105, 0.9)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    //height: 40,
                    width: 500,
                    child: RaisedButton(
                      color: Colors.grey[50],
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () {
                        String site = _webdic[chave3];
                        String nome = _dicts[chave3];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Web(site, nome)));
                      },
                      child: Text(
                        "${_dicts[chave3]}:${valor3}%",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto Mono',
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(15, 60, 105, 0.9)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Clique no nome para saber mais\n sobre o diagnóstico",
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color.fromRGBO(15, 60, 105, 0.9),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  void compare(valors, chave) {
    //print("****************************************8");
    double valores0 = double.parse(valors[0]);
    double valores1 = double.parse(valors[1]);
    double valores2 = double.parse(valors[2]);

    if (valores0 > valores1 && valores0 > valores2) {
      valor1 = valores0;
      chave1 = chave[0];

      if (valores1 > valores2) {
        valor2 = valores1;
        chave2 = chave[1];
        valor3 = valores2;
        chave3 = chave[2];
      } else {
        valor2 = valores2;
        chave2 = chave[2];
        valor3 = valores1;
        chave3 = chave[1];
      }
    } else if (valores1 > valores0 && valores1 > valores2) {
      valor1 = valores1;
      chave1 = chave[1];

      if (valores0 > valores2) {
        valor2 = valores0;
        chave2 = chave[0];
        valor3 = valores2;
        chave3 = chave[2];
      } else {
        valor2 = valores2;
        chave2 = chave[2];
        valor3 = valores0;
        chave3 = chave[0];
      }
    } else if (valores2 > valores0 && valores2 > valores1) {
      valor1 = valores2;
      chave1 = chave[2];

      if (valores0 > valores1) {
        valor2 = valores0;
        chave2 = chave[0];
        valor3 = valores1;
        chave3 = chave[1];
      } else {
        valor2 = valores1;
        chave2 = chave[1];
        valor3 = valores0;
        chave3 = chave[0];
      }
    }
  }
}
