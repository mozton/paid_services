import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paid_services/db/database_helper.dart';

// 📌 Modelo de Servicio con copyWith
class Service {
  final int? id;
  final String name;
  final double amount;
  final String date;
  final IconData icon;
  final bool isPay;
  final Color colors;
  final String? detail;
  final bool expire;

  Service({
    this.id,
    required this.icon,
    required this.name,
    required this.amount,
    required this.date,
    this.isPay = false,
    this.expire = false,
    required this.colors,
    this.detail,
  });

  // 📌 Método copyWith para modificar solo ciertos valores sin perder los demás
  Service copyWith({
    int? id,
    String? name,
    double? amount,
    String? date,
    IconData? icon,
    bool? isPay,
    Color? colors,
    String? detail,
    bool? expire,
  }) {
    return Service(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      icon: icon ?? this.icon,
      colors: colors ?? this.colors,
      isPay: isPay ?? this.isPay,
      expire: expire ?? this.expire,
      detail: detail ?? this.detail,
    );
  }

  // 📌 Convertir objeto a Mapa para SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'date': date,
      'icon': icon.codePoint,
      'color': colors.value,
      'detail': detail,
      'isPay': isPay ? 1 : 0,
      'expire': expire ? 1 : 0,
    };
  }

  // 📌 Crear objeto desde Mapa
  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      id: map['id'],
      name: map['name'],
      amount: map['amount'],
      date: map['date'],
      // icon: IconData(map['icon'], fontFamily: 'MaterialIcons')
      icon: IconData(map['icon'],fontFamily: "Remix",fontPackage: "remixicon" ),
      colors: Color(map['color']),
      detail: map['detail'],
      isPay: map['isPay'] == 1,
      expire: map['expire'] == 1,
    );
  }
}

// 📌 Notifier para manejar la lista de servicios
class ServiceNotifier extends StateNotifier<List<Service>> {
  ServiceNotifier() : super([]) {
    loadServices(); // Carga los servicios al iniciar
  }

  // 📌 Cargar los servicios desde SQLite
  Future<void> loadServices() async {
    final dbServices = await DatabaseHelper.instance.getServices();
    state = dbServices;
  }

  // 📌 Agregar un servicio a la base de datos y actualizar la lista
  Future<void> addService(Service service) async {
    final id = await DatabaseHelper.instance.insertService(service);
    final newService = service.copyWith(id: id);
    state = [...state, newService];
  }

  // 📌 Eliminar un servicio de la base de datos y actualizar la lista
  Future<void> deleteService(int id) async {
    await DatabaseHelper.instance.deleteService(id);
    state = state.where((service) => service.id != id).toList();
  }

  // 📌 Marcar un servicio como pagado o pendiente
  Future<void> togglePaymentStatus(int id) async {
    final index = state.indexWhere((s) => s.id == id);
    if (index == -1) return;

    final oldService = state[index];

    // 📌 Verificar si el servicio ha expirado
    final now = DateTime.now();
    final dueDate = DateTime.parse(oldService.date);
    final isExpired = !oldService.isPay && dueDate.isBefore(now);

    final updatedService = oldService.copyWith(
      isPay: !oldService.isPay,
      expire: isExpired,
    );

    await DatabaseHelper.instance.updateService(updatedService);

    final updatedList = [...state];
    updatedList[index] = updatedService;
    state = updatedList;
  }
}

// 📌 Proveedor de estado de los servicios en Riverpod
final servicesProvider =
    StateNotifierProvider<ServiceNotifier, List<Service>>((ref) {
  return ServiceNotifier();
});

// 📌 Provider para la fecha de vencimiento seleccionada
final dueDateProvider = StateProvider<DateTime?>((ref) => null);

// 📌 Provider para el controlador de fecha
final dateControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});
