import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Style.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Counter App",
      home: MyHomePage(),
    );
  }

}

class MyHomePage  extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
   return  MyHomePageUI();
  }

}

class MyHomePageUI extends State<MyHomePage>{

  Map<String,double> FromValue={"num1": 0, "num2":0, "num3": 0};
  double SUM=0;

  @override
  Widget build(BuildContext context) {
 // Create Input Onchange to catch the Input Data
    MyInputOnChange(InputKey, InputValue){

      setState(() {
        FromValue.update(InputKey, (value) => double.parse(InputValue));
      });
    }

    AddAllNumber(){
     setState(() {
       SUM=FromValue["num1"]! + FromValue["num2"]!+ FromValue["num3"]!;

     });
     // print(SUM);
    }


   return Scaffold(
      appBar: AppBar(title: Text('Add'),),
    body: Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(SUM.toString(), style: HeadTextStyle(),),
          SizedBox(height: 20,),
          TextFormField(onChanged:(value){
            // Set Valu to Num1
            MyInputOnChange("num1",value);
          }, decoration: AppInputStyle("First NUmber"),),
          SizedBox(height: 20,),
          TextFormField(onChanged:(value){
            // Set Valu to Num2
            MyInputOnChange("num2",value);
          }, decoration: AppInputStyle("Second NUmber"),),
          SizedBox(height: 20,),

          TextFormField(onChanged:(value){
            // Set Valu to Num3
            MyInputOnChange("num3",value);
          }, decoration: AppInputStyle("third NUmber"),),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: AppButtonStyle(),
              child: Text('Add'),
              onPressed: (){
                AddAllNumber();
              },

            ),
          )

        ],
      ),
    ),
   );
  }


}








