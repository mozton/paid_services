import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paid_services/provider/date_notifier.dart';
import 'package:paid_services/widgets/custom_input_field.dart';
import 'package:paid_services/provider/state_notifier.dart';

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
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final selectedDueDate = ref.watch(dateProvider);
    ref.listen<DateTime>(dateProvider, (previous, next) {
      dateController.text = next.toLocal().toString().split(" ")[0];
    });

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
                //   helperText: "Detail of the service",
                icon: Icons.label_outlined,
                formProperty: '',
                formValues: const {},
                keyboardType: TextInputType.text,
              ),

              CustomInputField(
                  controller: dateController,
                  hintText: "",
                  labelText: "Date",
                  helperText: "Due Date",
                  icon: Icons.date_range_outlined,
                  formProperty: '',
                  formValues: const {},
                  keyboardType: TextInputType.datetime,
                  onTapAlwaysCalled: true,
                  onTap: showModalBottomSheet),

              const SizedBox(height: 20),

              // Botton Save
              ElevatedButton(
                onPressed: () {
                  final name = servicesController.text;
                  final amount = double.tryParse(amountController.text) ?? 0;
                  final date =
                      selectedDueDate.toLocal().toString().split(" ")[0];
                  final detail = detailController.text;

                  if (name.isNotEmpty && amount > 0 && date.isNotEmpty) {
                    ref.read(servicesProvider.notifier).addService(
                        name, amount, date, selectedIcon, _color, detail);

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
