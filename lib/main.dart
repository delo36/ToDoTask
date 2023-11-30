import 'package:flutter/material.dart';
import 'app/route_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ToDo App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const RouteApp());
  }
}
