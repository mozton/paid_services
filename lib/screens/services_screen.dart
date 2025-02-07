import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paid_services/provider/state_notifier.dart';
import 'package:paid_services/screens/screens.dart';
import 'package:paid_services/widgets/services_card.dart';

class ServicesScreen extends ConsumerWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services =
        ref.watch(servicesProvider); // Obtiene la lista de servicios

    // Filtrar los servicios pendientes y pagados
    final pendingServices = services.where((s) => !s.isPay).toList();
    final paidServices = services.where((s) => s.isPay).toList();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const DrawerScreen(),
        appBar: AppBar(
          title: const Text(
            "Services",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Pending"),
              Tab(text: "Paid"),
              Tab(text: "Building"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildServiceList(
                context, ref, pendingServices, "Payments Pending"),
            _buildServiceList(context, ref, paidServices, "Payments Paid"),
            _buildServiceList(context, ref, services, "All Services"),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceList(BuildContext context, WidgetRef ref,
      List<Service> services, String title) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.separated(
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    final service = services[index];

                    return ServicesCard(
                      id: service.id,
                      name: service.name,
                      amount: service.amount,
                      date: service.date,
                      icon: service.icon,
                      color: service.colors,
                      isPay: service.isPay,
                      onDelete: () {
                        ref
                            .read(servicesProvider.notifier)
                            .removeService(service.id);
                      },
                      onTogglePay: () {
                        ref
                            .read(servicesProvider.notifier)
                            .togglePayStatus(service.id);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 5);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
