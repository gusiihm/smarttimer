import 'package:flutter/material.dart';
import 'package:smarttimer/emom_C_page.dart';

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
        '/emom_c_page': (context) => const emom_c_page(),
        '/timer_emom':(context) => const emom_c_page(),
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
            '/emom_c_page',
          );
        },
        ),
      ),
    );
  }
}