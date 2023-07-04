import 'package:flutter/material.dart';

import 'btn_widget.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = '';
  String lhs = '';
  String operator = '';

  //HomePage({required this.result});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      
      body: Column(
        children: [
          ///output.
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    result,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),

          ///first row of btn.
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // BtnWidget(btnText: '7' , onBtnClicked: (text)
                // {
                //   result+=text;
                // }),
                ///when the system  draw the widget take the onDigitClickedMethod()
                ///to the second screen BtnWidget and it done there when btn clicked.
                BtnWidget(btnText: '7', onBtnClicked: onDigitClickedMethod),
                BtnWidget(btnText: '8', onBtnClicked: onDigitClickedMethod),
                BtnWidget(btnText: '9', onBtnClicked: onDigitClickedMethod),
                BtnWidget(btnText: '*', onBtnClicked: onOperatorClickedMethod),
              ],
            ),
          ),

          ///second row of btn.
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BtnWidget(btnText: '4', onBtnClicked: onDigitClickedMethod),
                BtnWidget(btnText: '5', onBtnClicked: onDigitClickedMethod),
                BtnWidget(btnText: '6', onBtnClicked: onDigitClickedMethod),
                BtnWidget(btnText: '/', onBtnClicked: onOperatorClickedMethod),
              ],
            ),
          ),

          ///third row of btn.
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BtnWidget(btnText: '1', onBtnClicked: onDigitClickedMethod),
                BtnWidget(btnText: '2', onBtnClicked: onDigitClickedMethod),
                BtnWidget(btnText: '3', onBtnClicked: onDigitClickedMethod),
                BtnWidget(btnText: '+', onBtnClicked: onOperatorClickedMethod),
              ],
            ),
          ),

          ///forth row of btn.
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BtnWidget(btnText: '.', onBtnClicked: onDigitClickedMethod),
                BtnWidget(btnText: '0', onBtnClicked: onDigitClickedMethod),
                BtnWidget(btnText: '=', onBtnClicked: onEqualClickedMethod),
                BtnWidget(btnText: '-', onBtnClicked: onOperatorClickedMethod),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///method that achieve action of onDigitClickedMethod()
  // BtnWidget(btnText: '7' , onBtnClicked: (text)
  // {
  //   result+=text;
  // }),
  void onDigitClickedMethod(text) {
    result += text;
    setState(() {});

    ///flag
    //print(text);
  }

  void onOperatorClickedMethod(String clickedOperator)
  {
    ///clickedOperator === text.
    if(operator.isEmpty) ///for example 12 only.
      {
        lhs = result;
        /// 12   +
        /// lhs op
        operator = clickedOperator;
        result='';
      }
    else{
      /// 12   +   5
      /// lhs op  rhs
      /// result contain text from onDigitClickedMethod()  ///result === text clicked
      String rhs = result;
      ///old data
      lhs = calculate(rhs , lhs , operator);
      operator = clickedOperator;
      result='';
    }
  }

  String calculate(String rhs, String lhs, String operator) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    double res = 0;
    if(operator== '+')
      {
        res = num1 + num2 ;
      }
    else if(operator== '-')
    {
      res = num1 - num2 ;
    }
    else if(operator== '*')
    {
      res = num1 * num2 ;
    }
    else if(operator== '/')
    {
      res = num1 / num2 ;
    }
    return res.toString();
  }

  void onEqualClickedMethod(text)
  {
    String rhs = result;
    lhs = calculate(rhs, lhs, operator);
    result = lhs;
    lhs= '';
    operator='';
    setState(() {

    });
  }
}
