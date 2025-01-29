import 'package:flutter/material.dart';
import 'package:paid_services/widgets/custom_input_field.dart';
import 'package:device_calendar/device_calendar.dart';

class ManageServices extends StatefulWidget {

  const ManageServices({super.key});

  @override
  State<ManageServices> createState() => _ManageServicesState();
  
}
Location _currentLocation = getLocation('Etc/UTC');
class _ManageServicesState extends State<ManageServices> {
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
      
                  const CustomInputField(
                    hintText: "Service Name",
                    labelText: "Service",
                    helperText: "Name of the service",
                    icon: Icons.business,
                    formProperty: 'name',
                    formValues: {},
                    keyboardType: TextInputType.text,
                    
                  ),
                  const CustomInputField(
                    hintText: "Amount",
                    labelText: "amount",
                    helperText: "amount of the service",
                    intText: 0,
                    icon: Icons.monetization_on,
                    formProperty: '',
                    formValues: {},
                    keyboardType: TextInputType.number,
                  ),
                     const CustomInputField(
                   
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
                    onPressed: (){},
                     child:const Text("save")),
      
      
      
      
      
                ],
              ),
            ),
      ),
      ),
    );
  }
}