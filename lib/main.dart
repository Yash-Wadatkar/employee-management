// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/employee_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      /// creating instance for employeeProvider and passing it to decendent
      create: (_) => EmployeeProvider(),
      child: MaterialApp(
        title: 'Employee Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
