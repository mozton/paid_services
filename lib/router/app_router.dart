import 'package:flutter/material.dart';
import 'package:paid_services/model/menu_option.dart';
import 'package:paid_services/screens/homepage.dart';
// import 'package:paid_services/screens/manage_services.dart';


class AppRoutes {

  static const initialRoute = 'manage_services';

  static final menuOptions = <MenuOption>[
    // TODO: borrar home
    // MenuOption(route: 'home', name: 'Home Screen', screen: const HomeScreen(), icon: Icons.home_max_sharp ),
    // MenuOption(route: 'manager_services', name: 'Manager Services', screen: const ManageServices(), icon: Icons.list_alt ),
   
  ];


  static Map<String, Widget Function(BuildContext)> getAppRoutes() {

    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({ 'home' : ( BuildContext context ) => const HomePage() });

    for (final option in menuOptions ) {
      appRoutes.addAll({ option.route : ( BuildContext context ) => option.screen });
    }

    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'manager_services'     : ( BuildContext context ) => const ManageServices(),
  //   'listview1': ( BuildContext context ) => const Listview1Screen(),
  //   'listview2': ( BuildContext context ) => const Listview2Screen(),
  //   'alert'    : ( BuildContext context ) => const AlertScreen(),
  //   'card'     : ( BuildContext context ) => const CardScreen(),
  // };

  static Route<dynamic> onGenerateRoute( RouteSettings settings) {        
      return MaterialPageRoute(
          builder: (context) => const HomePage(),
      );
  }

}