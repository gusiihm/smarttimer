import 'package:flutter/material.dart';
import 'package:smarttimer/ontap.dart';

class  FinishPage extends StatelessWidget {
 

  
  @override
  Widget build(BuildContext context) {
    final WidgetFinishData arg = ModalRoute.of(context)!.settings.arguments as WidgetFinishData;
    final _duration = arg.duration;
    final  _counter = arg.counter; 
    final _serie = arg.serie; 
    final _totalTime = arg.totaltime;
    final _descanso = arg.descanso;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 109, 109),
      appBar: AppBar(
        title: const Text('Finish Page'),
        backgroundColor: const Color.fromARGB(255, 156, 156, 156),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context,'/',);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(
              'Duration: ${_duration.inSeconds} seconds',
              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold), textAlign: TextAlign.left,
            ),
            Text(
              'Descanso: ${_descanso.inSeconds} seconds',
              style:const  TextStyle(fontSize: 20),textAlign: TextAlign.left,
            ),
            Text(
              'Counter: $_counter',
              style: const TextStyle(fontSize: 20),textAlign: TextAlign.left,
            ),
            Text(
              'Serie: $_serie',
              style: const TextStyle(fontSize: 20),textAlign: TextAlign.left,
            ),
            Text(
              'Total Time: ${formatDuration(_totalTime)}',
              style: const TextStyle(fontSize: 20),textAlign: TextAlign.left,
            ),
            const Text(
              "Bien hecho, un paso más cerca de tu objetivo",
              style:  TextStyle(fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              child: const Text('Back', style: TextStyle(fontSize: 20,color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
