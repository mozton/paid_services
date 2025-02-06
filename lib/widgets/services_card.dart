import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ServicesCard extends StatelessWidget {
  final String name;
  final double amount;
  final String date;
  final IconData icon; // Cambié de Icons a IconData

  const ServicesCard({
    super.key,
    required this.name,
    required this.amount,
    required this.date,
    required this.icon, // Recibimos el icono seleccionado
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const Key("slidable"),
      endActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
                borderRadius: BorderRadius.circular(20),
                backgroundColor: (Colors.purple),
                foregroundColor: Colors.white,
                icon: Icons.paid_rounded,
                label: 'Paid',
                onPressed: (
                  context,
                ) async {}),
            SlidableAction(
                borderRadius: BorderRadius.circular(20),
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                onPressed: (
                  context,
                ) {}),
          ]),
      child: Container(
        width: double.infinity - 5,
        height: 90,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.3),
                offset: const Offset(0, 2),
                blurRadius: 3,
              )
            ]),
        child: Row(
          children: [
            const SizedBox(width: 15),
            Icon(
              icon, // Usamos el icono que hemos pasado
              color: Colors.blueGrey, // Asegúrate de que el color sea válido
              size: 35,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name, // Mostramos el nombre del servicio recibido
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                const Text(
                  "Detaill", // Puedes reemplazarlo por una descripción si la tienes
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "DOP ${amount.toStringAsFixed(2)}", // Mostramos el monto
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
                const Text(
                  "expires",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                Text(
                  date, // Mostramos la fecha
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal),
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
