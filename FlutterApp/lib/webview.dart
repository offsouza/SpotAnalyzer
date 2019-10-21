import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web extends StatefulWidget {
  String site;
  String nome;
  Web(this.site, this.nome);

  @override
  _WebState createState() => _WebState(site, nome);
}

class _WebState extends State<Web> {
  String site;
  String nome;
  _WebState(this.site, this.nome);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: Text(
          '$nome',
          style: TextStyle(
            fontFamily: 'Roboto Mono',
            fontSize: 19,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: WebView(
        initialUrl: site,
        //javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
