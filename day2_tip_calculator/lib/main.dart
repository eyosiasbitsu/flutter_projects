import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  final controller = TextEditingController();

  List<bool> _selection = [true, false, false];
  
  late String tip = "";

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              if(tip != "")
                Padding(
                  padding: EdgeInsets.all(20), 
                  child: Text(
                    tip,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),


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

              Padding(
                padding: const EdgeInsets.all(20),
                child: ToggleButtons(
                  children: [
                    Text('10%'),
                    Text('15%'),
                    Text('20%'),
                  ], 
                  isSelected: _selection,
                  onPressed: updateSelection,
                ),
              ),

              TextButton(
                onPressed: (){
                  calculateTip();
                }, 
                child: Text('Calculate Tip'),

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateSelection(int selectedIndex){
    setState(() {
      for(int i = 0; i < _selection.length; i++){
        _selection[i] = selectedIndex == i;
      }
    });
    
  }

  void calculateTip(){
    final totalAmount = double.parse(controller.text);
    final selectedIndex = _selection.indexWhere((element) => element);
    final tipPercentage = [0.1, 0.15, 0.2][selectedIndex];

    final tipAmount = (tipPercentage*totalAmount).toStringAsFixed(2);

    setState(() {
      tip = '\$$tipAmount';
    });
  }
}