import 'package:flutter/material.dart';

class BtnWidget extends StatelessWidget {
  String btnText = '';
  Function onBtnClicked;


 BtnWidget({required this.btnText , required this.onBtnClicked});

  @override
  Widget build(BuildContext context) {
    ///return the repeated widget.
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: ElevatedButton(
          onPressed: (){
            ///action
            ///in this line i called the fn that created and send btnText parameter with it.
            onBtnClicked(btnText);
            ///flag (this flag not work without the onBtnClickedMethod() flag)
            //print(btnText);
          },
          child: Text(
            '$btnText',
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
