import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paid_services/router/app_router.dart';
import 'package:paid_services/screens/config_screen.dart';
import 'package:paid_services/screens/services_screen.dart';

import 'package:paid_services/screens/add_services_screen.dart';
import 'package:paid_services/widgets/due_date.dart';

class DrawerScreen extends ConsumerWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController dateController = TextEditingController();

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ServicesScreen()));
                      ref.read(appRouterProvider);
                    },
                    icon: const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 50,
                    )),
                const Text("Home",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddServicesScreen()));
                ref.read(appRouterProvider);
              },
              child: const Text("Add Services")),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ServicesScreen()));
                ref.read(appRouterProvider);
              },
              child: const Text("Services")),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConfigScreen()));
                ref.read(appRouterProvider);
              },
              child: const Text("Configuration")),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DueDatePicker(controller: dateController)));

                ref.read(appRouterProvider);
              },
              child: const Text("Text")),
        ],
      ),
    );
  }
}
