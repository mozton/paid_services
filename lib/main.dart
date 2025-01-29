import 'package:flutter/material.dart';
import 'package:paid_services/router/app_router.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  
  const MyApp({ super.key });


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}