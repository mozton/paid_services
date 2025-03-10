import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class EditServicesScreen extends StatelessWidget {
   
  const EditServicesScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        title: const Text(" Editar Servicio"),
        actions: [IconButton(
          onPressed: (){}, 
          icon: const  Icon(Remix.save_3_fill),
          color: Colors.black,
          style:const  ButtonStyle(
          
          
          ),
        )],
      ),
      body: const Expanded(
         child: Placeholder(),
      ),
    );
  }
}