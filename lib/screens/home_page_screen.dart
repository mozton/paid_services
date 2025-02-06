import 'package:flutter/material.dart';
import 'package:paid_services/screens/screens.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(10),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Colors.blueGrey,
                  offset: Offset(0, 1),
                  blurRadius: 3,
                )
              ], borderRadius: BorderRadius.circular(10), color: Colors.red),
              child: const Center(child: Column())),
        ],
      ),
    );
  }
}
