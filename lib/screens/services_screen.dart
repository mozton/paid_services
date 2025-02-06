import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons_named/ionicons_named.dart';
import 'package:paid_services/provider/state_notifier.dart';
import 'package:paid_services/screens/screens.dart';
import 'package:paid_services/widgets/icon_pack.dart';
import 'package:paid_services/widgets/services_card.dart';

class ServicesScreen extends ConsumerStatefulWidget {
  const ServicesScreen({super.key});

  @override
  ConsumerState<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends ConsumerState<ServicesScreen> {
  final List<ExampleIcon> icons = [];

  @override
  void initState() {
    super.initState();

    for (var entry in ionicons.entries) {
      icons.add(ExampleIcon(entry.value, entry.key));
    }
  }

  @override
  Widget build(BuildContext context) {
    final services =
        ref.watch(servicesProvider); // Obtiene la lista de servicios

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const DrawerScreen(),
        appBar: AppBar(
          title: const Text(
            "Services ",
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
            DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Payments Pending",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),

                      // Mostrar los servicios en un ListView
                      Expanded(
                        child: ListView.separated(
                          itemCount: services.length,
                          itemBuilder: (context, index) {
                            final service = services[index];

                            return ServicesCard(
                                name: service.name,
                                amount: service.amount,
                                date: service.date,
                                icon: service.icon);
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
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 244, 244, 244),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payments Paid",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      // ServicesCard(), // Aquí puedes filtrar servicios pagados
                    ],
                  ),
                ),
              ),
            ),
            const Center(
              child: Text("Building"),
            ),
          ],
        ),
      ),
    );
  }
}
