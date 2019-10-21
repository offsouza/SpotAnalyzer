import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:async/async.dart';
import 'package:camera2/alert.dart';
import 'package:camera2/bottonnavigator.dart';
import 'package:camera2/detectage.dart';
import 'package:camera2/inf.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' show basename, join;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _load;
  bool _alert = true;
  int _selectedIndex = 1;

  File file;
  Widget bbody;
  String appBarTitle = 'Cancer de Pele - Detect';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _load = 0;

    bbody = bodyy();
    // readData().then((data) {
    //   setState(() {
    //     var alertdata = json.decode(data);
    //     _alert = alertdata['alert'];
    //   });
    // });
  }

  void _choose() async {
    file = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 720,
        maxHeight: 1280,
        imageQuality: 85);
    if (file == null) return null;

    uploadImageToServer(file);
    setState(() {
      _load = 1;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        _choose();
        //bbody = gallery();
      } else if (_selectedIndex == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Info()));
      } else if (_selectedIndex == 2) {
        showAlertDialog(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: Text(
          '$appBarTitle',
          style: TextStyle(
            fontFamily: 'Roboto Mono',
            fontSize: 19,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: bbody,
      bottomNavigationBar: bottomNormal(_selectedIndex, _onItemTapped),
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

  uploadImageToServer(File imageFile) async {
    print("attempting to connecto server......");
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    print(length);

    var uri = Uri.parse('http://3.132.160.107:5000/analiser');
    print("connection established.");
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));
    //contentType: new MediaType('image', 'png'));

    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Detect(imageFile)));

    setState(() {
      _load = 0;
    });
  }

  // gett() async {
  //   var data = await http.get('http://192.168.0.17:5000/');
  //   var jsondata = json.decode(data.body);
  //   print(jsondata);
  // }

  Widget bodyy() {
    if (_load == 2) {
      return Text(
        "otaivo",
        style: TextStyle(color: Colors.red),
      );
    } else if (_load == 1) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 250,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage("image/detect.png"),
                fit: BoxFit.contain,
              ),

              // child: Image.file(file,
              // ),
            ),
          ),
          textHome("Tire uma foto e veja o resultado!"),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Icon(
                Icons.camera,
                size: 80,
                color: Color.fromRGBO(15, 60, 105, 1),
              ),
            ),
            onTap: () {
              ImagePicker.pickImage(
                      source: ImageSource.camera,
                      maxWidth: 720,
                      maxHeight: 1280,
                      imageQuality: 85)
                  .then((file) {
                if (file == null) return null;

                uploadImageToServer(file);
                setState(() {
                  _load = 1;
                });

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Detect(file)));
              });
            },
          ),
          //showAlertDialog(context),
        ],
      );
    }
  }

  Widget textHome(String texts) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "$texts",
            style: TextStyle(
                color: Color.fromRGBO(15, 60, 105, 1),
                fontSize: 15,
                fontFamily: 'Roboto Mono',
                fontWeight: FontWeight.w900),
          ),
          Icon(
            Icons.arrow_drop_down,
            size: 30,
            color: Color.fromRGBO(15, 60, 105, 1),
          )
        ],
      ),
    );
  }
}
