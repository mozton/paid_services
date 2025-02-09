import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ServicesCard extends StatelessWidget {
  final String id;
  final String name;
  final double amount;
  final String date;
  final IconData icon;
  final Color color;
  final bool isPay;
  final VoidCallback onDelete;
  final VoidCallback onTogglePay;
  final String? detail;

  const ServicesCard(
      {super.key,
      required this.id,
      required this.name,
      required this.amount,
      required this.date,
      required this.icon,
      required this.isPay,
      required this.onDelete,
      required this.onTogglePay,
      required this.color,
      this.detail});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(id), // Se usa el ID del servicio como Key
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: onDelete),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(20),
            backgroundColor: isPay ? Colors.grey : Colors.greenAccent,
            foregroundColor: Colors.white,
            icon: isPay ? Icons.check_circle : Icons.paid_rounded,
            label: isPay ? 'Paid' : 'Pay',
            onPressed: (context) => onTogglePay(),
          ),
          SlidableAction(
            borderRadius: BorderRadius.circular(20),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete_outline_outlined,
            label: 'Delete',
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
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.3),
              offset: const Offset(0, 2),
              blurRadius: 3,
            )
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 15),
            Icon(
              icon,
              color: color,
              size: 35,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isPay ? Colors.green : Colors.blueGrey,
                  ),
                ),
                Text(
                  isPay ? "Paid" : "Pendin",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: isPay ? Colors.green : Colors.red,
                  ),
                ),
                Text(detail!.isEmpty ? "" : detail!)
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "DOP. ${amount.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                const Text(
                  "expire",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                Text(
                  date,
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
