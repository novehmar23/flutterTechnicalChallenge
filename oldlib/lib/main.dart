import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/post_viewmodel.dart';
import 'views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Proveedor para el PostViewModel
        ChangeNotifierProvider(
          create: (_) => PostViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Technical Challenge',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        // Pantalla inicial
        home: HomeScreen(),
      ),
    );
  }
}
