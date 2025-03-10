import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:paid_services/screens/edit_services_screen.dart';

class ServicesCard extends StatelessWidget {
  final int id;
  final String name;
  final double amount;
  final String date;
  final IconData icon;
  final Color color;
  final bool isPay;
  final String? detail;
  final bool expire;
  final VoidCallback onDelete;
  final VoidCallback onTogglePay;
//  final VoidCallback onChanged;


  const ServicesCard({
    super.key,
    required this.id,
    required this.name,
    required this.amount,
    required this.date,
    required this.icon,
    required this.color,
    required this.isPay,
    required this.onDelete,
    required this.onTogglePay,
    this.detail,
    this.expire = false, 
    // required this.onChanged,
  });

  // 📌 Verificar estado de pago y expiración
  String getPaymentStatus() {
    DateTime dueDateTime = DateTime.parse(date);
    DateTime now = DateTime.now();

     return isPay ? "Pagado" : (dueDateTime.isBefore(now) ? "Retrasado" : "Activo");
  }
  

  @override
  Widget build(BuildContext context) {
    return Slidable(
      
      key: Key(id.toString()), 
      
      // Modificar Servicio
      startActionPane: ActionPane(
        motion: const ScrollMotion(), 
       
        children:[
          SlidableAction(
            
            borderRadius: BorderRadius.circular(20),
            backgroundColor: Colors.indigoAccent,
            foregroundColor: Colors.white,
            icon: Icons.edit_calendar_outlined,
            label: 'Editar',
            onPressed: (context) => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditServicesScreen()),
            ),
    )]),
      


      
      // Se usa el ID del servicio como Key


      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: onDelete),
        children: [
          
          SlidableAction(
            borderRadius: BorderRadius.circular(20),
            backgroundColor: isPay ? Colors.indigo: Colors.greenAccent,
            foregroundColor: Colors.white,
            icon: isPay ? Icons.check_circle : Icons.paid_rounded,
            label: isPay ? 'Pagado' : 'Pagar',
            onPressed: (context) => onTogglePay(),
          ),
          SlidableAction(
            borderRadius: BorderRadius.circular(20),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete_outline_outlined,
            label: 'Eliminar',
            onPressed: (context) => onDelete(),
          ),
        ],
      ),
      child: Container(
        
        width: double.infinity - 5,
        height: 90,
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const[
            BoxShadow(
              color: Colors.blueGrey,
              offset:  Offset(0, 2),
              blurRadius: 3,
            )
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 15),
            Icon(icon, color: color, size: 30),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // Nombre del servicio 
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 15,
                    
                    fontWeight: FontWeight.bold,
                    color: isPay ? Colors.green : Colors.indigo,
                  ),
                ),
                Text(
                  getPaymentStatus(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: isPay
                        ? Colors.green
                        : (DateTime.parse(date).isBefore(DateTime.now()) ? Colors.red : Colors.orange),
                  ),
                ),
                Text(detail?.isNotEmpty == true ? detail! : ""),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "DOP ${amount.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
      
    );
  }
}
