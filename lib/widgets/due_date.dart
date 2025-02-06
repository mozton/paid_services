import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Definir un StateProvider para la fecha de vencimiento
final dueDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

class DueDatePicker extends ConsumerWidget {
  const DueDatePicker({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Leer el valor del StateProvider
    final dueDate = ref.watch(dueDateProvider);

    // Actualizar el controlador con la fecha seleccionada
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.text !=
          "${dueDate.day}/${dueDate.month}/${dueDate.year}") {
        controller.text = "${dueDate.day}/${dueDate.month}/${dueDate.year}";
      }
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.date_range_rounded),
        const Spacer(),
        Text(
          "${dueDate.day}/${dueDate.month}/${dueDate.year}", // Formato de fecha
          style: const TextStyle(fontSize: 16),
        ),
        const Spacer(),
        TextButton(
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: dueDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );

            if (newDate != null) {
              ref.read(dueDateProvider.notifier).state = newDate;
            }
          },
          child: const Text("Select"),
        ),
      ],
    );
  }
}
