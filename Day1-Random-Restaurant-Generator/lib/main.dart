import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  List<String> restaurants = [
    'Ydidia Mama house',
    'Enat wetet',
    'Cocoon',
    'Tesfu\'s',
    'Join',
    'Fkr Shiro',
    'Fetira at Jidaw',
  ];

  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Where do you want to eat? '),

              if (currentIndex != null)
                Text(
                  restaurants[currentIndex],
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              Padding(padding: EdgeInsets.only(top: 40)),
              TextButton(
                onPressed: (){
                  updateIndex();
                },
                child: Text('Pick Restaurant'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
              )
            ],
          )),
      ),
    );
  }

  void updateIndex(){
    final random = Random();
    final index = random.nextInt(restaurants.length);

    setState(() {
      currentIndex = index;
    });
  }
}