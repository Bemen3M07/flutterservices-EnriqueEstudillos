import 'package:P3B_Estudillos/Ej2/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.watch<CounterProvider>().counter.toString(),style: const TextStyle(fontSize:50)),

    );
  }
}
