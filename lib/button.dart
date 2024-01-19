import 'package:flutter/material.dart';


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
          style: const TextStyle(fontSize: 25),
          ),
          onPressed: onClicked,
          style: ElevatedButton.styleFrom(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.all(10),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),);
  
}