import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remixicon/remixicon.dart';


// Estado para gestionar el icono y el color seleccionados
class IconNotifier extends StateNotifier<({IconData icon, Color color})> {
  IconNotifier() : super((icon: Icons.star, color: Colors.blue)); // Valores iniciales

  void changeIcon(IconData newIcon) {
    state = (icon: newIcon, color: state.color);
  }

  void changeColor(Color newColor) {
    state = (icon: state.icon, color: newColor);
  }
}

final iconProvider = StateNotifierProvider<IconNotifier, ({IconData icon, Color color})>((ref) {
  return IconNotifier();
});

// Notifier para gestionar la lista de servicios
class ServiceNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  ServiceNotifier() : super([]);

  void addService(String name, IconData icon, Color colors) {
    state = [
      ...state,
      {"name": name, "icon": icon, "color": colors}
    ];
  }

  void updateService(Service updatedService) {}
}

final serviceProvider = StateNotifierProvider<ServiceNotifier, List<Map<String, dynamic>>>((ref) {
  return ServiceNotifier();
});

// Función para mostrar el selector de iconos y colores
dynamic showIconSelector(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder( // <-- Permite actualizar el estado dentro del diálogo
        builder: (context, setState) {
          final selectedIcon = ref.watch(iconProvider).icon;
          final selectedColor = ref.watch(iconProvider).color;

          return AlertDialog(
            title: const Text("Selecciona un icono y un color"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 150,
                  width: double.maxFinite,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _icons.length,
                    itemBuilder: (context, index) {
                      return IconButton(
                        icon: Icon(_icons[index]),
                        onPressed: () {
                          ref.read(iconProvider.notifier).changeIcon(_icons[index]);
                          setState(() {
                            
                            //  print([selectedColor,selectedIcon]);// <-- Refresca el diálogo
                             
                             
                             }); 
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  children: _colors.map((color) {
                    return GestureDetector(
                      onTap: () {
                        ref.read(iconProvider.notifier).changeColor(color);
                        setState(() {}); // <-- Refresca el diálogo
                      },
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 15,
                        child: selectedColor == color ? const Icon(Icons.check, color: Colors.white) : null,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    ref.read(serviceProvider.notifier).addService(
                      "Nuevo Servicio",
                      selectedIcon,
                      selectedColor,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("Guardar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cerrar"),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}


const List<IconData> _icons = [
    Remix.home_9_fill,
    Remix.home_2_fill,
    Remix.community_line,
    Remix.wallet_fill,
    Remix.bank_fill,
    Remix.bank_card_fill,
    Remix.government_fill,
    Remix.store_3_fill,
    Remix.shopping_bag_fill,
    Remix.shopping_cart_fill,
    Remix.hospital_fill,
    Remix.lightbulb_flash_fill,
    Remix.lightbulb_fill,
    Remix.drop_fill,
    Remix.home_wifi_fill,
    Remix.base_station_fill,
    Remix.wifi_fill,
    Remix.global_fill,
    Remix.gas_station_fill,
    Remix.bill_fill,
    Remix.graduation_cap_fill,
    Remix.school_fill,
    Remix.cellphone_fill,
    Remix.smartphone_fill,
    Remix.phone_fill,
    

    Remix.apple_fill,
    Remix.amazon_fill,
    Remix.netflix_fill,
    Remix.playstation_fill,
    Remix.spotify_fill,
   

   
];
const List<Color> _colors = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.redAccent,
    Colors.blueAccent,
    Colors.blue,
    Colors.green,
    Colors.greenAccent,
    Colors.yellow,
    Colors.indigo,
    Colors.indigoAccent,
    Colors.purple,
    Colors.pink,
    Colors.pinkAccent,
    Colors.grey,
    Colors.blueGrey,
    Colors.orange,
    Colors.teal,
 
];