import 'package:flutter/material.dart';
import 'package:paid_services/screens/manage_services.dart';

class DrawerScreen extends StatelessWidget {
   
  const DrawerScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration:const  BoxDecoration(
              color: Colors.blue,
            ),
            child: TextButton( onPressed: () {
                  },
            
             child:const  Icon( Icons.account_circle, color: Colors.white, size: 50,)),
          ),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const ManageServices() ));}, child:const  Text("Manage Services")),
          TextButton(onPressed: (){}, child: const Text("History")),
        ],
      ),

    );
  }
}