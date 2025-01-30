import 'package:flutter/material.dart';

class ServicesCard extends StatelessWidget {
   ServicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( 
      width: double.infinity,
      height: 80, 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(
          color: Colors.blueGrey.withOpacity(0.5),
          offset: const Offset(0, 0),
          blurRadius: 5,
        )]),
        child:const Row(
       
          
          
          children: [
              SizedBox(width:  15,),
              Icon(Icons.lightbulb, color: Colors.yellow,
              size: 35,),
              SizedBox(width: 10 , ),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Luz", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey),),
                  Text("Luz Casa ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),
                ],
              ),
              Spacer(),
              
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("S/ 100.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.indigo),),
                  Text("expires", style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),
                  Text("10/10/21", style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),
                ],
              ),

  SizedBox(width: 10,),

          ],

          
        ) ,




    );



    
  }
}