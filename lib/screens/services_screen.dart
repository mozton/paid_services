import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paid_services/provider/state_notifier.dart';
import 'package:paid_services/router/app_router.dart';
import 'package:paid_services/screens/add_services_screen.dart';

import 'package:paid_services/widgets/services_card.dart';
import 'package:paid_services/widgets/drawer.dart';

class ServicesScreen extends ConsumerWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(servicesProvider);

    // 📌 Filtrar los servicios según su estado
    final pendingServices = services.where((s) => !s.isPay).toList();
    final paidServices = services.where((s) => s.isPay).toList();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const DrawerScreen(),
        appBar: AppBar(
          title: const Text(
            "Servicios",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          bottom: const  TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white, 
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: "Pendientes"),
              Tab(text: "Pagados"),
              Tab(text: "Todos"),
            ],
          ),
        ),
        
        body: TabBarView(

          children: [
            _buildServiceList(context, ref, pendingServices, "Servicios Pendientes"),
            _buildServiceList(context, ref, paidServices, "Servicios Pagados"),
            _buildServiceList(context, ref, services, "Todos los Servicios"),
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
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
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
                  child: services.isEmpty
                      ? const Center(child: Text("No hay servicios registrados"))
                      : ListView.separated(
                          itemCount: services.length,
                          itemBuilder: (context, index) {
                            final service = services[index];
            
                            return ServicesCard(
                              id: service.id!,
                              name: service.name,
                              amount: service.amount,
                              date: service.date,
                              icon: service.icon,
                              color: service.colors,
                              isPay: service.isPay,
                              expire: service.expire,
                              detail: service.detail ?? "",
                              onDelete: () {
                                ref.read(servicesProvider.notifier).deleteService(service.id!);
                              },
                              onTogglePay: () {
                                ref.read(servicesProvider.notifier).togglePaymentStatus(service.id!);
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
            
          // floatingActionButton: ElevatedButton.icon(
          // onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const AddServicesScreen()));
          // ref.read(appRouterProvider);
          // }, 
          // label: const Text("Agregar", style: TextStyle(color: Colors.black),),
          // icon: const Icon( Icons.add_business_rounded,
          // color: Colors.blueGrey,),),
          // child:  const Icon(Remix.add_circle_line),
          ),
        ),
      )
    );
  }
}
