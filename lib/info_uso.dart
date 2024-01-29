import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';


class InfoUsoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de Uso'),
      ),
      body: ListView(
        children:const  [
          ListTile(
            title: Text('Inicio'),
            subtitle: Text('En la pantalla de inicio se encuentran los botones para usar diferentes timer, que llevaran a su respectiva configuración y para ver la información de uso de la app.'),
          ),
           ListTile(
            title: Text('EMOM'),
            subtitle: Text('En un entrenamiento EMOM, realizas una serie de ejercicios o repeticiones dentro de un minuto, o el timepo que hayas configurado y, una vez completado, descansas el tiempo restante antes de comenzar la siguiente serie al comienzo del siguiente minuto. Este formato ayuda a mantener un ritmo constante y desafiante durante todo el entrenamiento.'),

          ),
          ListTile(
            title: Text('For Time'),
            subtitle: Text('Es un cronometro nor mal y corriente, puede tener duracion limitada, o no, y se puede pausar y reanudar.'),
          ),
          ListTile(
            title: Text('Tabata'),
            subtitle: Text('Un Tabata configurable es una variante del protocolo Tabata en la que puedes personalizar la duración de los intervalos de trabajo y descanso. A diferencia del Tabata clásico, que consiste en 20 segundos de trabajo seguidos de 10 segundos de descanso durante 4 minutos, el Tabata configurable te permite ajustar estos intervalos según tus necesidades, permitiendo mayor flexibilidad en la planificación del entrenamiento y adaptándolo a objetivos específicos o niveles de condición física.'),
          ),
          ListTile(
            title: Text('AMRAP'),
            subtitle: Text('Proximamente'),
          ),
          ListTile(
            title: Text('OnTap'),
            subtitle: Text('"OnTap" es una aplicación de cronómetro que inicia el conteo de tiempo cada vez que se toca la pantalla, siendo ideal para controlar los tiempos de descanso durante un entrenamiento. Además, registra el tiempo total del entrenamiento al contabilizar el período desde el inicio del cronómetro. Esta funcionalidad proporciona una herramienta práctica para gestionar tanto los intervalos de descanso como el tiempo total dedicado al ejercicio, ofreciendo una solución efectiva para monitorear y optimizar las sesiones de entrenamiento.'),
          ),
          // Agrega más elementos ListTile según sea necesario
        ],
      ),
    );
  }
}


class InfoDesarrolloPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de Desarrollo'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Tecnologías Utilizadas'),
            subtitle: Text('En el desarrollo de esta aplicación se utilizaron las siguientes tecnologías: Flutter para la interfaz de usuario, Dart como lenguaje de programación'),
          ),
          ListTile(
            title: Text('Equipo de Desarrollo'),
            subtitle: Text('Esta aplicación fue desarrollada por Gustavo, de manera completamente independiente. Si tienes alguna sugerencia o comentario, puedes contactarnos a través de la sección de sugerencias de la aplicación.\n Esta aplicación es de codigo abierto, por lo tanto se podra descargar sin publicidad desde mi pagina de github, en el siguiente link: https://github.com/gusiihm/smarttimer, al igual que se tomara en cuenta, se mencionara, y se trabajara con cualquier pesona interesada en aportar en dicho poryecto',),
          ),
          ListTile(
            title: Text('Versión de la Aplicación'),
            subtitle: Text('La versión actual de la aplicación es 0.1.0. Estamos constantemente trabajando en mejoras y actualizaciones para brindar la mejor experiencia a nuestros usuarios.'),
          ),
          ListTile(
            title: Text('Proximas Actualizaciones'),
            subtitle: Text('AR'),
            
               
          )// Agrega más elementos ListTile según sea necesario
        ],
      ),
    );
  }
}




class InfoSugereciasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacto'),
      ),
      body: ListView(
        children:  [
          const ListTile(
            title: Text('Redes Sociales'),
            subtitle: Text('Puedes encontrarnos en las siguientes redes sociales:'),
          ),
          
          ListTile(
            leading:  Image.asset('assets/Imagenes_iconos/25231.png'),
            title: const Text('Github'),
            subtitle: const Text('https://github.com/gusiihm/smarttimer'),
            onTap: () =>
              launchUrlString('https://github.com/gusiihm/smarttimer'),
          ),
          ListTile(
            leading:  Icon(Icons.email),
            title: const Text('Instagram'),
            subtitle: const Text('gustavo@honorescode.com'),
            onTap: () =>
              launchUrlString('gustavo@honorescode.com'),
          ),
          
          // Agrega más elementos ListTile según sea necesario
        ],
      ),
    );
  }
}
