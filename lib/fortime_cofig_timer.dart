import 'package:flutter/material.dart';
import 'package:smarttimer/ontap.dart';

class TimerConfigPage extends StatefulWidget {
  @override
  _TimerConfigPageState createState() => _TimerConfigPageState();
}

class _TimerConfigPageState extends State<TimerConfigPage> {
 Duration _duration =  const Duration(seconds: 0);
 bool nonlimit = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 109, 109),
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 156, 156, 156),
        title: const Text('Timer Configuration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          
          children: [
          Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             Text(
                'Duracion',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
             ElevatedButton(
                  onPressed: nonlimit ? null :() {
                    OnTap.onTapTimer(context, (Duration duration) {
                      setState(() {
                        _duration = duration;
                      });
                    });
                    
                  },                  
                  child: nonlimit ? const Text("No limite"): Text(_duration.toString().substring(0, _duration.toString().length - 7 )),
              )

              ],
          ),
          Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             Text(
                'Con limite?',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            
            Checkbox(
              value: nonlimit, // Provide a value for the checkbox
              onChanged: (bool? value) {
                // Define the onChanged function
                if (value != null) {
                  setState(() {
                    nonlimit = value;
                    if (nonlimit == true) {
                      _duration = const Duration(seconds: 0);

                    }
                  });
                }
              },
            ),
          
            ],
            ),
            ElevatedButton(
            onPressed: () {
                Navigator.pushNamed(context,'/fortime/timer', arguments: WidgetForTimeData(_duration, nonlimit));
              },
              child: const Text('Go!'),),

          ],
        ),
      ),
    );
  }
}
