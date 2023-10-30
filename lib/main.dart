import 'package:flutter/material.dart';
import 'package:smarttimer/emom_C_page.dart';
import 'package:smarttimer/emom_timer.dart';

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
      },
    );
  }
}

class FirstRute extends StatelessWidget {
  const FirstRute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer App'),
      ),
      body: Center(
        child: ElevatedButton(
        child: const Text('Go to second route'),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/emom/configuration',
          );
        },
        ),
      ),
    );
  }
}