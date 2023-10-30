import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smarttimer/ontap.dart';
import 'button.dart';

class EmomTimer extends StatefulWidget {
  const EmomTimer({Key? key}) : super(key: key);

  @override
  EmomTimerState createState() => EmomTimerState();
}
class EmomTimerState extends State<EmomTimer>{
 
  Duration _duration = const Duration(hours: 0);
  int _counter = 0;
  Duration _elapsed = const Duration(seconds: 10);
  int _serie = 0; 
  Timer? timer;

  void startTimer(){
    timer =Timer.periodic(const Duration(seconds: 1), (_) {
      if(_elapsed.inSeconds > 0){
       setState(()=> _elapsed = _elapsed - const Duration(seconds: 1));
      }else if(_counter > _serie){
        setState(() {
          _serie++;
          _elapsed = _duration;
        });
      }else{
        timer!.cancel();
      }
      
      
      });
  }
  @override
  Widget build(BuildContext context){
    final WidgetEmomData arg = ModalRoute.of(context)!.settings.arguments as WidgetEmomData;
    _duration = arg.duration ;
    _counter = arg.counter;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMOM'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 156, 156, 156),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            buildTimer(),
            buildSeries(),
            const SizedBox(height: 80),
            buildTimmerButon(),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 109, 109, 109),
    );
  }
  Widget buildTimmerButon(){
    final isRuning = timer == null ? false : timer!.isActive;
    
    
    return isRuning ? 
      TimmerButton(
        text: 'Pause',
        onClicked:(){
          timer!.cancel();
          setState(() {
 
          });
        },
        
        ) :
    
    TimmerButton(
      
      text: 'Start',
      onClicked: (){
        
        startTimer();
      },
    );
  }
  Widget buildTimer() => SizedBox(
  width: 300,
  height: 300,
  child: Stack(
    fit: StackFit.expand,
    children: [
      CircularProgressIndicator(
        value: 1-_elapsed.inSeconds / _duration.inSeconds,
        valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 71, 233, 30)),
        backgroundColor: Colors.white,
        strokeWidth: 20,
      ),
      Center(
        child: buildTime(),
      ),  ],
  ),
  );
  Widget buildTime(){
      
    return Text(
      
      formatDuration(_elapsed),
      
      style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
    );
  }
 Widget buildSeries() {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Text(
      '$_serie/$_counter',
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  );
}
}