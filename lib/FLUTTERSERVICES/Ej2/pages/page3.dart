import 'package:P3B_Estudillos/FLUTTERSERVICES/Ej2/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class page3 extends StatefulWidget {
  const page3({super.key});

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.watch<CounterProvider>().counter.toString(),style: const TextStyle(fontSize:50)),

    );    
  }
}
