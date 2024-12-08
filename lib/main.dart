import 'package:flutter/material.dart';
import 'package:flutter_pi_demo/features/component/presentation/pages/components_screen.dart';
import 'package:flutter_pi_demo/features/panel/presentation/pages/panel_screen.dart';
import 'features/login/presentation/pages/login_page.dart';
// Import other pages as needed

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Initial route set to the login page
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/components': (context) => const ComponentsScreen(),
        '/panel': (context) => const PanelScreen(),
      },
    );
  }
}
