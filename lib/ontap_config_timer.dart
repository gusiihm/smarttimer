import 'package:flutter/material.dart';
import 'package:smarttimer/ontap.dart';

class TimerConfigPage_onTap extends StatefulWidget {
  @override
  _TimerConfigPageState createState() => _TimerConfigPageState();
}

class _TimerConfigPageState extends State<TimerConfigPage_onTap> {
  Duration _duration = const Duration(seconds: 0);
  int _repetitions = 0;
  bool _startAfterCompletion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 109, 109),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 156, 156, 156),
        title: Text('Timer Configuration On tap'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Duracion',
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ),
              const SizedBox(width: 10.0, height: 10.0,),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    OnTap.onTapTimer(context, (Duration duration) {
                      setState(() {
                        _duration = duration;
                      });
                    });
                    
                  },
                  
                  child:  Text(_duration.toString().substring(0, _duration.toString().length - 7 )),
              ),
              ),
            ],
          ),
            
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Repeticiones',
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ),
              const SizedBox(width: 10.0, height: 10.0,),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    OnTap.onTapCounter(context, (int counter) {
                      setState(() {
                        _repetitions = counter;
                      });
                    });
                    
                  },
                  child: Text('$_repetitions Rounds'),
              ),
              ),
            ],
          ),
            
            CheckboxListTile(
              title: const Text('Empieza despues de completar el tiempo de preparación'),
              value: _startAfterCompletion,
              
              onChanged: (value) {
                setState(() {
                  _startAfterCompletion = value ?? false;
                });
              },
            ),
            
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,'/ontap/timer', arguments: WidgetonTapData(_duration, _repetitions, _startAfterCompletion));
              },
              child: const Text('Go'),
            ),
          ],
        ),
      ),
    );
  }
}
