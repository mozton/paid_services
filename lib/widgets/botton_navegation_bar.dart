import 'package:flutter/material.dart';

class BottonNavegationBar extends StatelessWidget {
   
  const BottonNavegationBar({super.key, required List<BottomNavigationBarItem> items});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottonNavegationBar( 
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ], 

      ),
    );
  }
}