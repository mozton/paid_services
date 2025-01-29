import 'package:flutter/material.dart';
import 'package:paid_services/screens/add_paymet.dart';
import 'package:paid_services/screens/manage_services.dart';

class HomePage extends StatefulWidget {
   
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(backgroundColor: Colors.blue, 
      title: const Text(" Services Manager"),
      actions: [IconButton(color: Colors.white,
                  onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ManageServices() ));
                     // Navega a la pantalla de administración de servicios
                         
                    // Navegar a la pantalla de Configuración
                      }, icon: const Icon(Icons.add_business)
                  ),
      ],
      ),

      body:const DecoratedBox (
          decoration:  BoxDecoration(
          gradient: LinearGradient(begin:Alignment.topCenter,
          colors: [Colors.blue,Colors.red])

      ) ,
      child: SafeArea(
        child: Padding(
                  padding: EdgeInsets.all(20),
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                        Row(
                          children: [

                // Sección de Pagos Pendientes
                          Text("Payments Pending", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),),
                          SizedBox(height: 10),

                     
                // Sección de Pagos Recientes
                        
                          ],
                          

                     
                        ),  
           
                       ]
                   ),       
          ),
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPaymetScreen() ));},
       
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
        

      ),
    );
  }
}


