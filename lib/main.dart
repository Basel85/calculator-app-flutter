import 'package:calculator/Widgets/calculator_buttons.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int first_num = 0;
  int second_num = 0;
  String history="";
  String text_to_display="";
  String res = "";
  String operation = "";
  void op(String btnvalue){
      //print(btnvalue);
    if(btnvalue=='C'){
      first_num=0;
      second_num=0;
      text_to_display="";
      res="";
    }else if(btnvalue=='AC'){
      first_num=0;
      second_num=0;
      text_to_display="";
      res="";
      history="";
    }else if(btnvalue=='+/_'){
      if(text_to_display[0]!='-'){
        res='-'+text_to_display;
      }
      else{
        res=text_to_display.substring(1);
      }
    }else if(btnvalue=='<'){
      res=text_to_display.substring(0,text_to_display.length - 1);
    }else if(btnvalue=='+' || btnvalue=='-' || btnvalue=='X' || btnvalue=='/'){
      first_num=int.parse(text_to_display);
      res="";
      operation=btnvalue;
    }else if(btnvalue=='='){
      second_num=int.parse(text_to_display);
      if(operation=='+'){
        res=(first_num+second_num).toString();
        history=first_num.toString()+operation.toString()+second_num.toString();
      }
      if(operation=='-'){
        res=(first_num-second_num).toString();
        history=first_num.toString()+operation.toString()+second_num.toString();
      }
      if(operation=='X'){
        res=(first_num*second_num).toString();
        history=first_num.toString()+operation.toString()+second_num.toString();
      }
      if(operation=='/'){
        res=(first_num/second_num).toString();
        history=first_num.toString()+operation.toString()+second_num.toString();
      }
    }
    else{
      res=int.parse(text_to_display+btnvalue).toString();
    }
    setState(() {
      text_to_display=res;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Calculator"),
      ),
      backgroundColor: Colors.black54,
      body: Container(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(history,style: TextStyle(fontSize: 20,color: Colors.white),),
              alignment: Alignment.bottomRight,
            ),
            Container(
            padding: EdgeInsets.all(12),
            child: Text(text_to_display,style: TextStyle(fontSize: 20,color: Colors.white),),
            alignment: Alignment.bottomRight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Calculator_Buttons("+/_",Colors.blueGrey,Colors.black,24,op),
                Calculator_Buttons("0",Colors.blueGrey,Colors.black,24,op),
                Calculator_Buttons("00",Colors.blueGrey,Colors.black,24,op),
                Calculator_Buttons("=",Colors.yellow,Colors.black,24,op),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Calculator_Buttons("3",Colors.blueGrey,Colors.black,24,op),
                Calculator_Buttons("2",Colors.blueGrey,Colors.black,24,op),
                Calculator_Buttons("1",Colors.blueGrey,Colors.black,24,op),
                Calculator_Buttons("+",Colors.yellow,Colors.black,24,op),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Calculator_Buttons("6",Colors.blueGrey,Colors.black,24,op),
                Calculator_Buttons("5",Colors.blueGrey,Colors.black,24,op),
                Calculator_Buttons("4",Colors.blueGrey,Colors.black,24,op),
                Calculator_Buttons("-",Colors.yellow,Colors.black,24,op),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Calculator_Buttons("9",Colors.blueGrey,Colors.black,24,op),
                Calculator_Buttons("8",Colors.blueGrey,Colors.black,24,op),
                Calculator_Buttons("7",Colors.blueGrey,Colors.black,24,op),
                Calculator_Buttons("X",Colors.yellow,Colors.black,24,op),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Calculator_Buttons("AC",Colors.blueGrey,Colors.black,24,op),
                Calculator_Buttons("C",Colors.blueGrey,Colors.black,24,op),
                Calculator_Buttons("<",Colors.yellow,Colors.black,24,op),
                Calculator_Buttons("/",Colors.yellow,Colors.black,24,op),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
