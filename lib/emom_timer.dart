import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:smarttimer/ontap.dart';
import 'button.dart';

class EmomTimer extends StatefulWidget {
  const EmomTimer({Key? key}) : super(key: key);

  @override
  EmomTimerState createState() => EmomTimerState();
}
class EmomTimerState extends State<EmomTimer>{
  AudioPlayer audioPlugin = AudioPlayer();
  Duration _duration = const Duration(hours: 0);
  int _counter = 0;
  Duration _elapsed = const Duration(seconds: 10);
  int _serie = 0; 
  Timer? timer;
  Duration _totaltime = const Duration(hours: 0);
  
  void startTimer(){
    timer =Timer.periodic(const Duration(seconds: 1), (_) {
       
      if(_elapsed.inSeconds > 0){
       setState((){
        if(_serie > 0){
         _totaltime = _totaltime + const Duration(seconds: 1);
         
        }
        _elapsed = _elapsed - const Duration(seconds: 1);
        
        if(_elapsed.inSeconds == 0){
          soundtime0();
          if(_counter > _serie){
            _serie++;
            _elapsed = _duration;
          }else{
            timer!.cancel();
            gotofinishpage();
          }
        }
       }
       
      );
      if(_elapsed.inSeconds == 1 || _elapsed.inSeconds == 2 || _elapsed.inSeconds == 3){
         soundtime();
        }

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('Te quieres rendir?'),
                actions: [
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                    child: const Text('No')
                    ),
                  TextButton(
                    onPressed: (){
                      if(timer!.isActive){
                        timer!.cancel();
                       }
                      Navigator.pushNamed(
                        context,
                        '/',
                        );
                    }, 
                    child: const Text('Yes')
                    ),
                ],
              )
               );
            
          },
        )
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              formatDuration( _totaltime),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
              ),
            buildTimer(),
            buildSeries(),
            buildTimmerButon(),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 109, 109, 109),
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
        if(_serie == 0){
          setState(() {
            _elapsed = const Duration(seconds: 10);
          });

        }
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
        value: 1-(_elapsed.inSeconds-1) / _duration.inSeconds,
        valueColor:  const AlwaysStoppedAnimation(Color.fromARGB(255, 71, 233, 30)),
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
  return 
   
     Text(
      '$_serie/$_counter',
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  
}

  Future<void> soundtime()  async {
    final player = AudioPlayer();
    await player.play(AssetSource('sonidos/beeps-bonks-boinks19.mp3'));
  }
  
   Future<void> soundtime0()  async {
    final player = AudioPlayer();
    await player.play(AssetSource('sonidos/beeps-bonks-boinks8.mp3'));
  }
  void gotofinishpage(){
    Navigator.pushNamed(
      context,
      '/finishtimer',
      arguments: WidgetFinishData(_duration, _counter, _serie, _totaltime, const Duration(seconds: 0)),
      
      );
  }
  
}