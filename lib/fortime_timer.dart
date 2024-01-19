import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:smarttimer/ontap.dart';
import 'button.dart';
//TODO esta copiado y pegado de emom_timer.dart 
// TODO cambiar el contenido completo de esta pagina
class ForTimeTimer extends StatefulWidget {
  const ForTimeTimer({Key? key}) : super(key: key);

  @override
  ForTimeTimerState createState() => ForTimeTimerState();
}
class ForTimeTimerState extends State<ForTimeTimer>{
  AudioPlayer audioPlugin = AudioPlayer();
  Duration _duration = const Duration(hours: 0);
  bool _nonlimit = false;
  bool _isRunning = false;
  Duration _elapsed = const Duration(hours: 0);
  Timer? timer;
  Duration _totaltime = const Duration(hours: 0);
  
  void startTimer(){
    timer =Timer.periodic(const Duration(seconds: 1), (_) {
       
      if(_elapsed.inSeconds > 0){
       setState((){
        if(_isRunning ){
         _totaltime = _totaltime + const Duration(seconds: 1);
         
        }
        if (_nonlimit == false || _isRunning== false ){
        _elapsed = _elapsed - const Duration(seconds: 1);
        }
        if(_elapsed.inSeconds == 0){
          soundtime0();
          if(_nonlimit== false && _isRunning == false){
            _elapsed = _duration;
            _isRunning = true;
          }
          else if(_nonlimit == false && _isRunning ==true){
            timer!.cancel();
            gotofinishpage();
          }
          else if (_nonlimit == true && _isRunning == false){
            _elapsed = const Duration(minutes: 1);
            _isRunning = true;
          }
          
        }
         if(_elapsed.inSeconds == 1 || _elapsed.inSeconds == 2 || _elapsed.inSeconds == 3){
         soundtime();
        }
       }
       
      );
     

      }  
        
      
      
      });
  }
  @override
  Widget build(BuildContext context){
    final WidgetForTimeData arg = ModalRoute.of(context)!.settings.arguments as WidgetForTimeData;
    _duration = arg.duration ;
    _nonlimit = arg.nonlimit;
    
    
    return PopScope(
      canPop:  false,
      child: Scaffold(
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
                        if( timer != null || timer!.isActive ){
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
              buildTimmerButon(),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 109, 109, 109),
      ),
    );
  }
  Widget buildTimmerButon(){
    final isRuning = timer == null ? false : timer!.isActive;
    if(_nonlimit == false && isRuning){
      return  TimmerButton(text: 'Pause', onClicked:(){timer!.cancel(); setState(() { });},) ;
    }else if(_nonlimit == true && isRuning){
      return  TimmerButton(
        text: 'Finish',
        onClicked:(){
          timer!.cancel();
           setState(() {            
              gotofinishpage();
           });},) ;
    }
    else {
      return TimmerButton(
      
      text: 'Start',
      onClicked: (){
        if(_isRunning == false){
          setState(() {
            _elapsed = const Duration(seconds: 10);
          });

        }
        startTimer();
      },
    );   }
    
    
  }
  Widget buildTimer() => SizedBox(
  width: 300,
  height: 300,
  child: Stack(
    fit: StackFit.expand,
    children: [
      CircularProgressIndicator(
        value:radio(),
        valueColor:  const AlwaysStoppedAnimation(Color.fromARGB(255, 71, 233, 30)),
        backgroundColor: Colors.white,
        strokeWidth: 20,
      ),
      Center(
        child: buildTime(),
      ),  ],
  ),
  );
  String tiempoMuestra(){
    if(_nonlimit == true && _isRunning ==true){
      return formatDuration(_totaltime);
    }
    
    else{
      return formatDuration(_elapsed);
    }
    
  }
  Widget buildTime(){
      
    return Text(
      
      tiempoMuestra(),
      
      style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
    );
  }
double radio(){
if(_nonlimit== true && _isRunning == true){
  return 1-(_totaltime.inSeconds % 60) / const Duration(minutes: 1).inSeconds;
  }
if(_nonlimit== true && _isRunning == false){
  return 1-_elapsed.inSeconds / const Duration(minutes: 1).inSeconds;
  }
else {
return 1-(_elapsed.inSeconds-1) / _duration.inSeconds;
}
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
    Navigator.pushNamed(context, '/finishtimer', arguments: WidgetFinishData(_duration,0, 0, _totaltime, const Duration(seconds: 0))
      );
  }
  
}