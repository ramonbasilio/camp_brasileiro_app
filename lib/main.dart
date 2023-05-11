// ignore_for_file: avoid_print, unused_field, prefer_final_fields, prefer_const_constructors

import 'package:camp_brasileiro_app/paginas/teste/pagina_teste.dart';
import 'package:camp_brasileiro_app/repositorios/repositorio_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'paginas/pagina_splash/pagina_splash.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => repositorioProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brasileirão App - 2023',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const SplashScreen(),
    );
  }
}
