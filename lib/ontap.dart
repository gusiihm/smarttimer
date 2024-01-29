import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

class OnTap {
  static void  onTapCounter(BuildContext context,Function(int) onrepeatSelected) {
  Picker(
    adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
      const NumberPickerColumn(begin: 0, end: 999, suffix: Text(' Rounds')),
      
    ]),
   
    hideHeader: true,
    confirmText: 'OK',
    confirmTextStyle: const TextStyle(inherit: false, color: Colors.red, fontSize: 22),
    title: const Text('Select duration'),
    selectedTextStyle: const TextStyle(color: Colors.blue),
    onConfirm: (Picker picker, List<int> value) {
      // You get your duration here
      
        onrepeatSelected(picker.getSelectedValues()[0]);
      
    },
  ).showDialog(context);
  }
  static void onTapTimer(BuildContext context, Function(Duration) onDurationSelected) {
    Picker(
    adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
      const NumberPickerColumn(begin: 0, end: 999, suffix: Text(' Minutes')),
      const NumberPickerColumn(begin: 0, end: 60, suffix: Text(' Seconds'), jump: 5),
    ]),
    delimiter: <PickerDelimiter>[
      PickerDelimiter(
        child: Container(
          width: 30.0,
          alignment: Alignment.center,
          child:  const Icon(Icons.more_vert),
        ),
      )
    ],
    hideHeader: true,
    confirmText: 'OK',
    confirmTextStyle:  const TextStyle(inherit: false, color: Colors.red, fontSize: 22),
    title: const Text('Select duration'),
    selectedTextStyle: const TextStyle(color: Colors.blue),
      onConfirm: (Picker picker, List<int> value) {
        // Puedes pasar la duración seleccionada a través de un callback
        onDurationSelected(Duration(minutes: picker.getSelectedValues()[0], seconds: picker.getSelectedValues()[1]));
      },
    ).showDialog(context);
  }
  

}
class WidgetEmomData{
  final Duration duration;
  final int counter;
  WidgetEmomData(this.duration, this.counter);
}
class WidgetonTapData{
  final Duration duration;
  final int counter;
  final bool startAfterCompletion;
  WidgetonTapData(this.duration, this.counter, this.startAfterCompletion);
}
class WidgetForTimeData{
  final Duration duration;
  final bool nonlimit;
  WidgetForTimeData(this.duration, this.nonlimit);
}
class WidgetTabataData{
  final Duration workDuration;
  final Duration restDuration;
  final int rounds;
  WidgetTabataData(this.workDuration, this.restDuration, this.rounds);
}


class WidgetFinishData {
    final Duration duration;
    final int  counter;
    final int  serie;
    final Duration  totaltime;
    final Duration descanso;
    WidgetFinishData(this.duration, this.counter, this.serie, this.totaltime, this.descanso);
  
}
String formatDuration(Duration duration) {
  final hours = duration.inHours;
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);
  

  if (hours > 0) {
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  } else if (minutes > 0) {
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  } else if (seconds > 0) {
    return '${seconds.toString().padLeft(2, '0')}';
  } else {
    return '0';
  }
}