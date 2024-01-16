import 'package:flutter/material.dart';
import 'package:smarttimer/emom_C_page.dart';
import 'package:smarttimer/emom_timer.dart';
import 'package:smarttimer/finishpage.dart';
import 'package:smarttimer/ontap_config_timer.dart';
import 'package:smarttimer/ontap_timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstRute(),
        '/emom/configuration': (context) => const emom_c_page(),
        '/emom/timer':(context) => const EmomTimer(),
        '/finishtimer':(context) =>  FinishPage(),
        '/ontap/configuration':(context) =>  TimerConfigPage_onTap(),
        '/ontap/timer':(context) => const  OnTapTimer(),
      },
    );
  }
}

class FirstRute extends StatelessWidget {
  const FirstRute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 109, 109),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 156, 156, 156),
        title: const Text('Timer App'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shadowColor: Colors.red,
                elevation: 5
              ),
              child: const Text('EMOM',style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/emom/configuration',
                );
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Cambiar el color de fondo
                shadowColor: Colors.red,
                elevation: 5
              ),
              child: const Text('For Time',style: TextStyle(color: Colors.white)),
              onPressed: () {
                // Acción para el botón 2
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Cambiar el color de fondo
                shadowColor: Colors.red,
                elevation: 5
              ),
              child: const Text('AMRAP',style: TextStyle(color: Colors.white)),
              onPressed: () {
                // Acción para el botón 3
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Cambiar el color de fondo
                shadowColor: Colors.red,
                elevation: 5
              ),
              child: const Text('TABATA',style: TextStyle(color: Colors.white)),
              onPressed: () {
                // Acción para el botón 4
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink, // Cambiar el color de fondo
                shadowColor: Colors.red,
                elevation: 5
              ),
              child: const Text('ON Tap',style: TextStyle(color: Colors.white)),
              onPressed: () {
                 Navigator.pushNamed(
                  context,
                  '/ontap/configuration',
                );
              },
            ),
          ],
        ),
        ),     
    );
  }
}