import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:uuid/uuid.dart";

const Uuid uuid = Uuid();

// Modelo Service con copyWith mejorado
class Service {
  final String id;
  final String name;
  final double amount;
  final String date;
  final IconData icon;
  final bool isPay;
  final Color colors;
  final String? detail;

  Service(
      {required this.id,
      required this.icon,
      required this.name,
      required this.amount,
      required this.date,
      this.isPay = false,
      required this.colors,
      this.detail});

  // Método copyWith para actualizar valores dinámicamente
  Service copyWith({
    String? id,
    String? name,
    double? amount,
    String? date,
    IconData? icon,
    bool? isPay,
    Color? colors,
    String? detail,
  }) {
    return Service(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      isPay: isPay ?? this.isPay,
      colors: colors ?? this.colors,
      detail: detail ?? this.detail,
    );
  }
}

// Notifier para manejar lista de servicios
class ServiceNotifier extends StateNotifier<List<Service>> {
  ServiceNotifier() : super([]);

  // Método para agregar un nuevo servicio
  void addService(String name, double amount, String date, IconData iconData,
      Color color, String detail) {
    state = [
      ...state,
      Service(
        id: uuid.v4(),
        name: name,
        amount: amount,
        date: date,
        icon: iconData,
        colors: color,
        detail: detail,
      ),
    ];
  }

  // Método para eliminar un servicio por ID
  void removeService(String serviceId) {
    state = state.where((service) => service.id != serviceId).toList();
  }

  // Método para marcar como Pagado o No Pagado
  void togglePayStatus(String serviceId) {
    state = state.map((service) {
      if (service.id == serviceId) {
        return service.copyWith(isPay: !service.isPay);
      }
      return service;
    }).toList();
  }

  // Método para actualizar el icono de un servicio
  void updateServiceIcon(String serviceId, IconData newIcon) {
    state = state.map((service) {
      if (service.id == serviceId) {
        return service.copyWith(icon: newIcon);
      }
      return service;
    }).toList();
  }

  // Método para actualizar el color de un servicio
  void updateServiceColor(String serviceId, Color newColor) {
    state = state.map((service) {
      if (service.id == serviceId) {
        return service.copyWith(colors: newColor);
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
