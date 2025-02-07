// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// class ServicesPay extends StatelessWidget {
//   final String id; // Agregamos el ID del servicio
//   final String name;
//   final double amount;
//   final String date;
//   final IconData icon;
//   final bool isPay; // Nuevo campo para estado de pago
//   final VoidCallback onDelete; // Función para eliminar servicio
//   final VoidCallback onTogglePay; // Función para cambiar estado de pago

//   const ServicesPay({
//     super.key,
//     required this.id,
//     required this.name,
//     required this.amount,
//     required this.date,
//     required this.icon,
//     required this.isPay,
//     required this.onDelete,
//     required this.onTogglePay,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Slidable(
//       key: Key(id), // Se usa el ID del servicio como Key
//       endActionPane: ActionPane(
//         motion: const ScrollMotion(),
//         dismissible: DismissiblePane(onDismissed: onDelete),
//         children: [
//           SlidableAction(
//             borderRadius: BorderRadius.circular(20),
//             backgroundColor: const Color(0xFFFE4A49),
//             foregroundColor: Colors.white,
//             icon: Icons.delete,
//             label: 'Eliminar',
//             onPressed: (context) => onDelete(),
//           ),
//         ],
//       ),
//       child: Container(
//         width: double.infinity - 5,
//         height: 90,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.blueGrey.withOpacity(0.3),
//               offset: const Offset(0, 2),
//               blurRadius: 3,
//             )
//           ],
//         ),
//         child: Row(
//           children: [
//             const SizedBox(width: 15),
//             Icon(
//               icon,
//               color:
//                   isPay ? Colors.green : Colors.blueGrey, // Color según estado
//               size: 35,
//             ),
//             const SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   name,
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: isPay ? Colors.green : Colors.blueGrey,
//                   ),
//                 ),
//                 Text(
//                   isPay ? "Pagado" : "Pendiente",
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.normal,
//                     color: isPay ? Colors.green : Colors.red,
//                   ),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "DOP. ${amount.toStringAsFixed(2)}",
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.indigo,
//                   ),
//                 ),
//                 const Text(
//                   "Vence el",
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
//                 ),
//                 Text(
//                   date,
//                   style: const TextStyle(
//                       fontSize: 15, fontWeight: FontWeight.normal),
//                 ),
//               ],
//             ),
//             const SizedBox(width: 10),
//             IconButton(
//               icon: Icon(
//                 isPay ? Icons.check_circle : Icons.circle_outlined,
//                 color: isPay ? Colors.green : Colors.grey,
//               ),
//               onPressed: onTogglePay,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
