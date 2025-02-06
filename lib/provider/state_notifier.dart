import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class Service {
  final String name;
  final double amount;
  final String date;
  final IconData icon;

  Service({
    required this.icon,
    required this.name,
    required this.amount,
    required this.date,
  });
}

class ServiceNotifier extends StateNotifier<List<Service>> {
  ServiceNotifier() : super([]);

  void addService(String name, double amount, String date, IconData iconData) {
    state = [
      ...state,
      Service(
        name: name,
        amount: amount,
        date: date,
        icon:
            iconData, // Aquí está la corrección, antes usabas "icon" en lugar de "iconData"
      ),
    ];
  }
}

// Provider para el controlador de fecha
final dateControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final servicesProvider = StateNotifierProvider<ServiceNotifier, List<Service>>(
    (ref) => ServiceNotifier());

// final dueDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

final dueDateProvider = StateProvider<DateTime?>((ref) => null);
