import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/pages/home_page.dart';
import 'package:task/providers/products_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  
  runApp(ChangeNotifierProvider<ProductsProvider>(
    create: (_) => ProductsProvider(),
    child:const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 62, 184, 111),
          background: const Color.fromARGB(255, 245, 245, 245),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 245, 245, 245),
        ),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const HomePage(),
    );
  }
}
