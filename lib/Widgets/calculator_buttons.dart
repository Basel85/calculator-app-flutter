import 'package:flutter/material.dart';

class Calculator_Buttons extends StatelessWidget {
  final String value;
  final Color fillcolor;
  final Color textcolor;
  final double textsize;
  final Function call;
  Calculator_Buttons(
      this.value, this.fillcolor, this.textcolor, this.textsize, this.call);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 67,
        height: 67,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            backgroundColor:
                MaterialStateColor.resolveWith((states) => fillcolor),
          ),
          child: Text(value,style: TextStyle(fontSize: textsize,),),
          onPressed:()=>{
            call(value),
          },
        ),
      ),
    );
  }
}
