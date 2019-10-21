import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Widget bottomNormal(_selectedIndex, _onItemTapped) => BottomNavigationBar(
      //backgroundColor: Color.fromRGBO(200, 200, 200, 0.5),
      backgroundColor: Colors.greenAccent,
      items: [
        BottomNavigationBarItem(
          //backgroundColor: Colors.greenAccent,
          //backgroundColor: Color.fromRGBO(200, 200, 200, 0.5),
          icon: Icon(
            Icons.photo_library,
            size: 30,
            color: Color.fromRGBO(240, 240, 240, 1),
          ),
          title: Text(
            "",
            style: TextStyle(
              fontSize: 1,
              color: Color.fromRGBO(240, 240, 240, 1),
            ),
          ),
        ),
        BottomNavigationBarItem(
          //backgroundColor: Colors.greenAccent,
          icon: Icon(
            Icons.info,
            size: 30,
            color: Color.fromRGBO(240, 240, 240, 1),
          ),
          title: Text(
            "",
            style: TextStyle(
              fontSize: 1,
              color: Color.fromRGBO(240, 240, 240, 1),
            ),
          ),
        ),
        BottomNavigationBarItem(
          //backgroundColor: Colors.greenAccent,
          icon: Icon(
            Icons.help,
            size: 30,
            color: Color.fromRGBO(240, 240, 240, 1),
          ),
          title: Text(
            "",
            style: TextStyle(
              fontSize: 1,
              color: Color.fromRGBO(240, 240, 240, 1),
            ),
          ),
        )
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
