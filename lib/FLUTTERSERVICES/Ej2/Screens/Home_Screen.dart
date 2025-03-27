import 'package:P3B_Estudillos/FLUTTERSERVICES/Ej2/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/page1.dart';
import '../pages/page2.dart';
import '../pages/page3.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex =0;
    final List<Widget> _pages = <Widget>[
      const page1(),
      const page2(),
      const page3(),

    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Material App Bar"),
        actions: [
          TextButton(
            onPressed:null,
           child: Text(
        context.watch<CounterProvider>().counter.toString(), style: TextStyle(color: Colors.blue),

          ))
        ],
      ),

      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index){
          setState(() {
            _selectedIndex = index;  
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.business),
            label :'bussiness'
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.school),
            label :'school'
          )
        ]
      ),
    );
  }
}