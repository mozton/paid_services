import 'package:flutter/material.dart';
import 'package:paid_services/widgets/custom_input_field.dart';


class ManageServices extends StatefulWidget {

  const ManageServices({super.key});

  @override
  State<ManageServices> createState() => _ManageServicesState();
  
}
class _ManageServicesState extends State<ManageServices> {

final TextEditingController _servicesController = TextEditingController();
final TextEditingController _amountController = TextEditingController();
final TextEditingController _dateController = TextEditingController();

  @override
  
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Oculta el teclado
      },
      child: Scaffold(
         appBar: AppBar(
          title: const Text('Add Services'),
      
        ),
          body:Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [
      
                  CustomInputField(
                    controller: _servicesController,
                    hintText: "Service Name",
                    labelText: "Service",
                    helperText: "Name of the service",
                    icon: Icons.business,
                    formProperty: 'name',
                    formValues:  {},
                    keyboardType: TextInputType.text,
                    
                  ),
                  CustomInputField(
                    hintText: "Amount",
                    controller: _amountController,
                    labelText: "amount",
                    helperText: "amount of the service",
                    intText: 0,
                    icon: Icons.monetization_on,
                    formProperty: '',
                    formValues: {},
                    keyboardType: TextInputType.number,
                  ),
                      CustomInputField(
                    controller: _dateController,
                    hintText: "Date",
                    labelText: "date",
                    helperText: "date of the service",
                    icon: Icons.calendar_today,
                    formProperty: '',
                    formValues: {},
                    keyboardType: TextInputType.datetime,
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: (){print([_servicesController.text, _amountController.text, _dateController.text]);},
                     child:const Text("save")),
      
      
      
      
      
                ],
              ),
            ),
      ),
      ),
    );
  }
}