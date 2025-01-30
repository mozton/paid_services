import 'package:flutter/material.dart';
import 'package:paid_services/screens/dashboard_screen.dart';

import 'package:paid_services/screens/screens.dart';
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
      

      drawer: const DrawerScreen(),

     appBar: AppBar(//backgroundColor: Colors.blue, 
      title: const Text(" Services Manager", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red ),),
    //   actions: [IconButton(color: Colors.white,
    //               onPressed: () {
    //               Navigator.push(context, MaterialPageRoute(builder: (context) => const ManageServices() ));
    //                  // Navega a la pantalla de administración de servicios
                         
    //                 // Navegar a la pantalla de Configuración
    //                   }, icon: const Icon(Icons.add_business)
    //               ),
    //  ],
      ),

      body: DecoratedBox (
      decoration: const  BoxDecoration(color:  Color.fromARGB(255, 244, 244, 244),

      ) ,
      child: SafeArea(
      
        child: Padding(
                  padding: const EdgeInsets.all(20),
                   
                   
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                       // Sección de Pagos Pendientes
                       children: [
                              const Text("Payments Pending", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                             
                             
                              const SizedBox(height: 15),


                                // Frist Container                     
                        Container(
                        height: 120,
                        width: double.infinity,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: const [BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(0, 2),
                            blurRadius: 5,
                          )],
                          ),
                          child: Row(
                           
                            
                            children: [
                            const SizedBox(width: 15, ),
                            
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              
                              children: [
                                
                                Text("Total", style: TextStyle(fontSize: 20,  color: Colors.blueGrey),),
                                Text("5000 ", style: TextStyle(fontSize: 30, color: Colors.blueGrey),),
                                Text("debit ", style: TextStyle(fontSize: 20, color: Colors.blueGrey),),
                                
                                ],
                              
                            ),
                            const Spacer(),

                            Column(
                              
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                
                                  
                                  FloatingActionButton(
                                    shape: const CircleBorder(),
                                    backgroundColor: Colors.indigoAccent,
                                    onPressed: ( ){Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPaymetScreen() )); }, 
                                    child: const Icon(Icons.add, 
                                    
                                    color: Colors.black, size: 35,),
                                  ),
                                 
                              ],
                            ),
                            const SizedBox(width: 20, ),
                          ],)

                          ),


                              const  SizedBox(height: 10),

                        Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                            const Row(
                              children: [
                        
                                
                              // Sección de Pagos Recientes
                            
                              ],
                              
                        
                         
                            ),  
                            const SizedBox(height: 15),
                         ServicesCard (),
                            const SizedBox(height: 15),
                      
                         ServicesCard (),
                            const SizedBox(height: 15),
   ServicesCard (),
                            const SizedBox(height: 15),
   ServicesCard (),
                            const SizedBox(height: 15),
 

                                   
                           ]
                                           ),
                      ],
                    ),       
          ),
        ),
        
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPaymetScreen() ));},
       
      //   shape: const CircleBorder(),
      //   backgroundColor: Colors.indigoAccent,
      //   child: const Icon(Icons.add),
        

      // ),

      bottomNavigationBar: BottomNavigationBar(items: const [

        
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_customize_outlined, ),
          label: 'Dashboard',backgroundColor: Colors.blue,
          activeIcon: Icon(Icons.dashboard_customize, color: Colors.blue),
            
        
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory_2_outlined,  color: Colors.blue),
          label: 'inventory',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help, color: Colors.blue),
          label: 'help',
        ),
      ],
    //  backgroundColor: Colors.blueGrey,
      
      
      ),
    );
  }
}


