import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context){
    final controller = TextEditingController();

    List<bool> _selection = [false, false, false];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Enter the amount'),
              SizedBox(
                width: 75,
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "\$100",
                  ),
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),

              ToggleButtons(
                children: [
                  Text('10%'),
                  Text('15%'),
                  Text('20%'),
                ], 
                isSelected: updateSelection(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateSelection(int selectedIndex){

  }
}