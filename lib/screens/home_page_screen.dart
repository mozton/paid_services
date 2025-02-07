import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paid_services/provider/state_notifier.dart';
import 'package:paid_services/widgets/drawer.dart';

class HomePageScreen extends ConsumerWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(servicesProvider);

    // Sumar el total de los servicios pendientes
    final double pendingTotal = services
        .where((s) => !s.isPay) // Filtra solo los pendientes
        .fold(0, (sum, service) => sum + service.amount);

    // Sumar el total de los servicios pagados
    final double paidTotal = services
        .where((s) => s.isPay) // Filtra solo los pagados
        .fold(0, (sum, service) => sum + service.amount);

    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Resumen de Pagos",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            //  Tarjeta para Total Pendiente
            _buildCard("Total Pendiente", pendingTotal, Colors.orange),

            const SizedBox(height: 15),

            //  Tarjeta para Total Pagado
            _buildCard("Total Pagado", paidTotal, Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, double amount, Color color) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "DOP ${amount.toStringAsFixed(2)}", // ✅ Muestra el total
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
