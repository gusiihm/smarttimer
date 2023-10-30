import 'package:flutter/material.dart';
import 'package:smarttimer/ontap.dart';

class TimmerButton extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const TimmerButton({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
          ),
          onPressed: onClicked,
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(30),
            primary: Colors.white,
            onPrimary: Colors.black,
          ),);
  
}