import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galaxy/MainScreen.dart';
import 'Model.dart';

class Click extends StatefulWidget {
  Model model =Model(name: '', position: '', image: '', velocity: '', distance: '', description: '');
  Click({Key, key,});

  @override
  State<Click> createState() => _ClickState();
}
List<Model> modelList = [];

class _ClickState extends State<Click> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[ 
          Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvFXmzdLSOCOijC1mSY7_wIS7RlCT5vJVv_Q&usqp=CAU'),fit: BoxFit.fill,height: 820,width: 400,),
          Center(
          child: ElevatedButton(
            onPressed: () async {
              String dataString =
              await rootBundle.loadString('assets/planet.json');
              List jsonData = jsonDecode(dataString);
              modelList = Model.parseList(jsonData);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>MainScreen()));
            },
            child: Icon(
            Icons.play_arrow
              ,
            )
          ),
        ),
    ]
      ),
    );
  }
}
