import 'package:flutter/material.dart';
import 'package:smarttimer/ontap.dart';

class TabataConfigPage extends StatefulWidget {
  @override
  _TabataConfigPageState createState() => _TabataConfigPageState();
}

class _TabataConfigPageState extends State<TabataConfigPage> {
  Duration workDuration =  const Duration(seconds: 60);
  Duration restDuration = const Duration(seconds: 30);
  int rounds = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración Tabata'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Duración del trabajo '),
            ElevatedButton(
                  onPressed: () {
                    OnTap.onTapTimer(context, (Duration duration) {
                      setState(() {
                        workDuration = duration;
                      });
                    });
                    
                  },                  
                  child: Text(workDuration.toString().substring(0, workDuration.toString().length - 7 )),
              ),
            const Text('Duración del descanso '),
            ElevatedButton(
                  onPressed: () {
                    OnTap.onTapTimer(context, (Duration duration) {
                      setState(() {
                       restDuration = duration;
                      });
                    });
                    
                  },                  
                  child:  Text(restDuration.toString().substring(0,restDuration.toString().length - 7 )),
              ),
            const Text('Número de rondas'),
            ElevatedButton(
                  onPressed: () {
                    OnTap.onTapCounter(context, (int counter) {
                      setState(() {
                        rounds = counter;
                      });
                    });
                    
                  },
                  child: Text('$rounds Rounds'),
              ),
           ElevatedButton(
              child: const Text('Iniciar Timer'),
              onPressed: () {
                // Aquí puedes implementar la lógica para iniciar el timer
              },
            ),
          ],
        ),
      ),
    );
  }
}
