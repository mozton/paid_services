import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paid_services/widgets/custom_input_field.dart';
import 'package:paid_services/provider/state_notifier.dart';
import 'package:paid_services/widgets/due_date.dart';
import 'package:paid_services/provider/state_notifier.dart' as state;

class AddServicesScreen extends ConsumerStatefulWidget {
  const AddServicesScreen({super.key});

  @override
  _AddServicesScreenState createState() => _AddServicesScreenState();
}

class _AddServicesScreenState extends ConsumerState<AddServicesScreen> {
  IconData selectedIcon = Icons.business; // Icono por defecto
  Color _color = Colors.blue; // Color por defecto

  final TextEditingController servicesController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dueDate = ref.watch(state.dueDateProvider);

    // Actualizamos el controller de fecha para que se muestre la fecha actual de dueDate
    dateController.text = "${dueDate?.day}/${dueDate?.month}/${dueDate?.year}";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Campos de entrada
              CustomInputField(
                controller: servicesController,
                hintText: "Service Name",
                labelText: "Service",
                helperText: "Name of the service",
                icon: Icons.business_rounded,
                formProperty: 'name',
                formValues: const {},
                keyboardType: TextInputType.text,
              ),
              CustomInputField(
                controller: amountController,
                hintText: "Amount",
                labelText: "Amount",
                helperText: "Amount of the service",
                icon: CupertinoIcons.money_dollar,
                formProperty: '',
                formValues: const {},
                keyboardType: TextInputType.number,
              ),

              CustomInputField(
                controller: detailController,
                hintText: "Detail",
                labelText: "Detail",
                helperText: "Detail of the service",
                icon: Icons.label_outlined,
                formProperty: '',
                formValues: const {},
                keyboardType: TextInputType.text,
              ),
              DueDatePicker(controller: dateController),

              const SizedBox(height: 20),

              // Botón de guardar
              ElevatedButton(
                onPressed: () {
                  final name = servicesController.text;
                  final amount = double.tryParse(amountController.text) ?? 0;
                  final date = dateController.text;

                  if (name.isNotEmpty && amount > 0 && date.isNotEmpty) {
                    ref.read(servicesProvider.notifier).addService(
                          name,
                          amount,
                          date,
                          selectedIcon,
                          _color,
                        );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Service Added")),
                    );
                  }
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
