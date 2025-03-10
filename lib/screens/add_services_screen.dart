import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paid_services/provider/date_notifier.dart';
import 'package:paid_services/widgets/custom_input_field.dart';
import 'package:paid_services/provider/state_notifier.dart';
import 'package:paid_services/widgets/pack_icon_piker.dart';

class AddServicesScreen extends ConsumerStatefulWidget {
  const AddServicesScreen({super.key});

  

  @override
  _AddServicesScreenState createState() => _AddServicesScreenState();
}

class _AddServicesScreenState extends ConsumerState<AddServicesScreen> {
  IconData selectedIcon = Icons.home_work;
  Color color = Colors.blue;
  



  final TextEditingController servicesController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  
  


  
  @override
  Widget build(BuildContext context) {
    final selectedIcon = ref.watch(iconProvider).icon;
    final selectedColor = ref.watch(iconProvider).color;
    final selectedDueDate = ref.watch(dateProvider);
    
    ref.listen<DateTime>(dateProvider, (previous, next) {
      dateController.text = next.toLocal().toString().split(" ")[0];
    });


    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Servicio'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                
                // 📌 Botón para seleccionar icono y color
                TextButton.icon(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 225, 224, 224)),
                  ),
                  onPressed: () => showIconSelector(context, ref),
                  icon: Icon(selectedIcon, color: selectedColor),
                  label: const Text("Cambiar Icono & Color"),
                ),
                  const SizedBox(height: 15,),
                // 📌 Campos de entrada
                CustomInputField(
                  controller: servicesController,
                  hintText: "Nombre del Servicio",
                  labelText: "Servicio",
                  icon: selectedIcon,
                  formProperty: 'name',
                  formValues: const {},
                  keyboardType: TextInputType.text,
                  
                ),
                
                 const SizedBox(height: 15),
                CustomInputField(
                  controller: amountController,
                  hintText: "Monto",
                  labelText: "Monto",
                  icon: CupertinoIcons.money_dollar,
                  formProperty: '',
                  formValues: const {},
                  keyboardType:const  TextInputType.numberWithOptions(decimal: true),
                  
                ),
                 const SizedBox(height: 15),
                CustomInputField(
                  controller: detailController,
                  hintText: "Detalle",
                  labelText: "Detalle",
                  icon: Icons.label_outlined, colors: Colors.red,
                  formProperty: '',
                  formValues: const {},
                  keyboardType: TextInputType.text,
                ),
                 const SizedBox(height: 15),
                // 📌 Campo de fecha con selector
                CustomInputField(
                  controller: dateController,
                  hintText: "Seleccione una fecha",
                  labelText: "Fecha de Vencimiento",
                  icon: Icons.date_range_outlined,
                  formProperty: '',
                  formValues: const {},
                  keyboardType: TextInputType.datetime,
                  onTapAlwaysCalled: true,
                  
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 250,
                          child: CupertinoDatePicker(
                            
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: selectedDueDate,
                            minimumYear: 2025,
                            maximumYear: 2050,
                            onDateTimeChanged: (DateTime newDate) {
                              ref.read(dateProvider.notifier).setDate(newDate);
                            },
                            
                          ),
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 20),

                // 📌 Botón para guardar en SQLite
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 225, 224, 224))),
                  onPressed: () async {
                    final name = servicesController.text.trim();
                    final amount = double.tryParse(amountController.text) ?? 0;
                    final date = selectedDueDate != null
                        ? selectedDueDate.toLocal().toString().split(" ")[0]
                        : "";
                    final detail = detailController.text.trim();

                    if (name.isEmpty || amount <= 0 || date.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Complete todos los campos"),
                          backgroundColor: Colors.red, 
                        ),
                      );
                      return;
                    }

                    final newService = Service(
                      id: null,
                      name: name,
                      amount: amount,
                      date: date,
                      icon: selectedIcon,
                      colors: selectedColor,
                      detail: detail,
                    );

                    // 📌 Guardar en SQLite y actualizar el estado con Riverpod
                    final notifier = ref.read(servicesProvider.notifier);
                    await notifier.addService(newService);

                    // 📌 Mostrar mensaje de éxito
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Servicio agregado exitosamente"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }

                    // 📌 Limpiar los campos después de guardar
                    servicesController.clear();
                    amountController.clear();
                    detailController.clear();
                    dateController.clear();
                
                    Navigator.pop(context); // Cerrar la pantalla
                  },
                  child: const Text("Guardar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
