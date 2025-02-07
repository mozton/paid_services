import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:uuid/uuid.dart";

const Uuid uuid = Uuid();

class Service {
  final String id;
  final String name;
  final double amount;
  final String date;
  final IconData icon;
  final bool isPay;

  Service({
    required this.id,
    required this.icon,
    required this.name,
    required this.amount,
    required this.date,
    this.isPay = false,
  });

  // Metodo para crear copia de valores modificados

  Service copyWith({bool? isPay}) {
    return Service(
      id: id,
      icon: icon,
      name: name,
      amount: amount,
      date: date,
      isPay: isPay ?? this.isPay,
    );
  }
}
// Notifier para manejar lista de servicio

class ServiceNotifier extends StateNotifier<List<Service>> {
  ServiceNotifier() : super([]);

// Metodo para agregar nuevo servicio

  void addService(
    String name,
    double amount,
    String date,
    IconData iconData,
  ) {
    state = [
      ...state,
      Service(
        id: uuid.v4(),
        name: name,
        amount: amount,
        date: date,
        icon: iconData,
      ),
    ];
  }

// Método para eliminar un servicio por ID
  void removeService(String serviceId) {
    state = state.where((service) => service.id != serviceId).toList();
  }

// Marcar como Pagado o no pagado
  void togglePayStatus(String serviceId) {
    state = state.map((service) {
      if (service.id == serviceId) {
        return service.copyWith(isPay: !service.isPay);
      }
      return service;
    }).toList();
  }
}

// Providers

final servicesProvider =
    StateNotifierProvider<ServiceNotifier, List<Service>>((ref) {
  return ServiceNotifier();
});

// Provider para controlar el texto de la fecha
final dueDateProvider = StateProvider<DateTime?>((ref) => null);

// Provider para el controlador de fecha
final dateControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});
