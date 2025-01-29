import 'package:flutter/material.dart';
import 'package:paid_services/screens/add_paymet.dart';
import 'package:paid_services/screens/manage_services.dart';
import 'package:paid_services/widgets/services_card.dart';

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
      title: const Text(" Services Manager", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white ),),
      actions: [IconButton(color: Colors.white,
                  onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ManageServices() ));
                     // Navega a la pantalla de administración de servicios
                         
                    // Navegar a la pantalla de Configuración
                      }, icon: const Icon(Icons.add_business)
                  ),
      ],
      ),

      body: DecoratedBox (
      decoration:const  BoxDecoration(color: const Color.fromARGB(255, 244, 244, 244),

      ) ,
      child: SafeArea(
        child: Padding(
                  padding: EdgeInsets.all(20),
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                        const Row(
                          children: [

                // Sección de Pagos Pendientes
                          Text("Payments Pending", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),

                // Sección de Pagos Recientes
                        
                          ],
                          

                     
                        ),  
                        const SizedBox(height: 15),
                     ServicesCard ()
           
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


