import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String  output  = "0";
  String _output= "0";
  double num1=0.0;
  double num2=0.0;
  String operand= "";


  operation(String btntext){
    if(btntext== "C"){
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand =  "";

    }
    else if(btntext  == "+" || btntext  == "-" || btntext  == "x" ||  btntext  == "/") {
      num1 = double.parse(output);
      operand = btntext;
      _output = "0";
    }
    else if(btntext == "="){
        num2  = double.parse(output);

        if(operand ==  "+" ){
          _output = (num1+num2).toString();
        }
        if(operand ==  "-" ){
          _output = (num1-num2).toString();
        }
        if(operand ==  "x" ){
          _output = (num1*num2).toString();
        }
        if(operand ==  "/" ){
          _output = (num1/num2).toString();
        }
        num1= 0.0;
        num2= 0.0;
        operand= "";

    }
    else{
      _output = _output+ btntext;

    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });

  }

  Widget button(String btntext){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: RawMaterialButton(
          shape: Border.all(color:Colors.black12,width: 1.5),
          fillColor: Colors.transparent,
          padding: EdgeInsets.all(30.0),
          splashColor: Colors.blueGrey,
          child: Text(
              "$btntext",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
          ),
          ),
          onPressed: (){
            operation(btntext);
          },

        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          margin: EdgeInsets.only(bottom: 3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child:Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black54,width: 2.0
                    ),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.only(bottom: 2.0),
                  child: Text(
                      "$output",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                      ),
                ),
              ),
              Row(
                children: [
                  button("9"),
                  button("8"),
                  button("7"),
                  button("/"),


                ],
              ),
              Row(
                children: [
                  button("4"),
                  button("5"),
                  button("6"),
                  button("x"),


                ],
              ),

              Row(
                children: [
                  button("3"),
                  button("2"),
                  button("1"),
                  button("-"),


                ],
              ),

              Row(
                children: [
                  button("0"),
                  button("C"),
                  button("="),
                  button("+"),


                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}

