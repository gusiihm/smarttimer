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
      backgroundColor: const Color.fromARGB(255, 109, 109, 109),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 156, 156, 156),
        title: const Text('Configuración Tabata'),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Duración del trabajo ', style: Theme.of(context).textTheme.headlineMedium,),
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
            Text('Duración del descanso ', style: Theme.of(context).textTheme.headlineMedium,),
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
            Text('Número de rondas', style: Theme.of(context).textTheme.headlineMedium,),
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
                if(workDuration.inSeconds != 0 || restDuration.inSeconds != 0 || rounds != 0){
                  Navigator.of(context).pushNamed(
                  '/tabata/timer',
                  arguments: WidgetTabataData(workDuration, restDuration, rounds)
                );
                }
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
