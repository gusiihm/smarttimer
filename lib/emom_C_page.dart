import 'package:flutter/material.dart';



import 'package:smarttimer/ontap.dart';
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
      body: Center(
            child:Column(
        children: [
          Row(
            children: [
              Center(
                child: Text(
                  'Duracion',
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ),
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
            children: [
              Center(
                child: Text(
                  'Repeticiones',
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    OnTap.onTapCounter(context, (int counter) {
                      setState(() {
                        _counter = counter;
                      });
                    });
                    
                  },
                  child: Text('$_counter Rounds'),
              ),
              ),
            ],
          ),
          Row(
            children: [
              Center(
                child: Text(
                  'Tiempo total',
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ),
              Center(
                child: Text(
                   _duration * _counter < const Duration(minutes: 1)
      ? (_duration*_counter).toString().substring(5, _duration.toString().length - 7)
      : (_duration * _counter < const Duration(minutes: 10)
          ? (_duration*_counter).toString().substring(3, _duration.toString().length - 7)
          : (_duration * _counter < const Duration(minutes: 60)
            ? (_duration*_counter).toString().substring(2, _duration.toString().length - 7)
            : (_duration*_counter).toString().substring(0, _duration.toString().length - 7))),
                  
                )
              ),
              
            ],
          ),
          Center(
            child: ElevatedButton(
            child: const Text('Go'),
            onPressed: () {
             Navigator.pushNamed(context,'/emom/timer',
              arguments: WidgetEmomData(_duration, _counter));
           },
            ),
          ),
          
        ],
      ),
    )
    );
    
  }
  

}