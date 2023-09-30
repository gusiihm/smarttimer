import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:smarttimer/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_picker/flutter_picker.dart';

class emom_c_page extends StatefulWidget {
  const emom_c_page({Key? key}) : super(key: key);

  @override
  _emom_c_pageState createState() => _emom_c_pageState();
}

class _emom_c_pageState extends State<emom_c_page> {
  
  Duration _duration = const Duration(minutes: 1, seconds: 0);
  int _counter =  1;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración del EMOM'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Center(
                child: Text(
                  'Duracion',
                  style: Theme.of(context).textTheme.headline4,
                )
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      onTapTimer(context);
                      
                      Text(_duration.toString());
                    });
                  },
                  
                  child:  Text(_duration.toString()),
              ),
              ),
            ],
          ),
          Row(
            children: [
              Center(
                child: Text(
                  'Repeticiones',
                  style: Theme.of(context).textTheme.headline4,
                )
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      onTapCounter(context);
                    });
                  },
                  child: Text(_counter.toString() + ' Rounds'),
              ),
              ),
            ],
          ),
          
          Center(
            child: ElevatedButton(
            child: const Text('Go'),
            onPressed: () {
             Navigator.pop(
                context
              );
           },
            ),
          ),
          
        ],
      ),
    );
    
  }
  void onTapTimer(BuildContext context) {
  
  Picker(
    adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
      const NumberPickerColumn(begin: 0, end: 999, suffix: Text(' Minutes')),
      const NumberPickerColumn(begin: 0, end: 60, suffix: Text(' Seconds'), jump: 5),
    ]),
    delimiter: <PickerDelimiter>[
      PickerDelimiter(
        child: Container(
          width: 30.0,
          alignment: Alignment.center,
          child:  const Icon(Icons.more_vert),
        ),
      )
    ],
    hideHeader: true,
    confirmText: 'OK',
    confirmTextStyle:  const TextStyle(inherit: false, color: Colors.red, fontSize: 22),
    title: const Text('Select duration'),
    selectedTextStyle: const TextStyle(color: Colors.blue),
    onConfirm: (Picker picker, List<int> value) {
      // You get your duration here
     setState(() { 
      _duration = Duration(minutes: picker.getSelectedValues()[0], seconds: picker.getSelectedValues()[1]);
             
      });
    },
    
  ).showDialog(context);
   
}
void onTapCounter(BuildContext context) {
  Picker(
    adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
      const NumberPickerColumn(begin: 0, end: 999, suffix: Text(' Rounds')),
      
    ]),
    delimiter: <PickerDelimiter>[
      PickerDelimiter(
        child: Container(
          width: 30.0,
          alignment: Alignment.center,
          child: const Icon(Icons.more_vert),
        ),
      )
    ],
    hideHeader: true,
    confirmText: 'OK',
    confirmTextStyle: const TextStyle(inherit: false, color: Colors.red, fontSize: 22),
    title: const Text('Select duration'),
    selectedTextStyle: const TextStyle(color: Colors.blue),
    onConfirm: (Picker picker, List<int> value) {
      // You get your duration here
      setState(() {
        _counter = picker.getSelectedValues()[0];
      });
    },
  ).showDialog(context);
}
}