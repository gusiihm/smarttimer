import 'package:flutter/material.dart';
import 'package:smarttimer/ontap.dart';

class FinishPage extends StatelessWidget {
  Duration _duration=Duration( seconds: 0);
  int _counter =0;
  int _serie=0;
  Duration _totalTime=Duration( seconds: 0);
  Duration _descanso=Duration( seconds: 0);

  
  @override
  Widget build(BuildContext context) {
    final WidgetFinishData arg = ModalRoute.of(context)!.settings.arguments as WidgetFinishData;
    _duration = arg.duration;
    _counter = arg.counter; 
    _serie = arg.serie; 
    _totalTime = arg.totaltime;
    _descanso = arg.descanso;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 109, 109),
      appBar: AppBar(
        title: Text('Finish Page'),
        backgroundColor: const Color.fromARGB(255, 156, 156, 156),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(
              'Duration: ${_duration.inSeconds} seconds',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold), textAlign: TextAlign.left,
            ),
            Text(
              'Descanso: ${_descanso.inSeconds} seconds',
              style: TextStyle(fontSize: 20),textAlign: TextAlign.left,
            ),
            Text(
              'Counter: $_counter',
              style: TextStyle(fontSize: 20),textAlign: TextAlign.left,
            ),
            Text(
              'Serie: $_serie',
              style: TextStyle(fontSize: 20),textAlign: TextAlign.left,
            ),
            Text(
              'Total Time: ${_totalTime.inMinutes} minutes',
              style: TextStyle(fontSize: 20),textAlign: TextAlign.left,
            ),
            Text(
              "Bien hecho, un paso más cerca de tu objetivo",
              style: const TextStyle(fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
