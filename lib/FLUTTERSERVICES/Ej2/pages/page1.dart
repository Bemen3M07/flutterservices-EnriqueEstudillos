import 'package:P3B_Estudillos/FLUTTERSERVICES/Ej2/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(context.watch<CounterProvider>().counter.toString(),style: const TextStyle(fontSize:50)),
        ElevatedButton(onPressed:() {
          context.read<CounterProvider>().increment();
        }, child: const Text('Suma'))
      ],
    ),
    );
  }
}
