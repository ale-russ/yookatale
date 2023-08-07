import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yookatale/app.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'Cabin',
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.normal),
          bodyLarge: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal),
          bodySmall: TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
        ),
        primaryColor: const Color.fromRGBO(
            24, 95, 45, 1), // Set the color as primary color
        colorScheme: ColorScheme.fromSeed(
          background: const Color.fromRGBO(0, 0, 0, 0.5),
          seedColor: const Color.fromARGB(99, 3, 39, 14),
        ),
        useMaterial3: true,
      ),
      home: const App(),
    );
  }
}
