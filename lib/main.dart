// ignore_for_file: avoid_print, unused_field, prefer_final_fields, prefer_const_constructors
import 'package:camp_brasileiro_app/Paginas/pagina_tabela.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      title: 'Brasileirão App - 2023',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const PaginaTabela(),
    );
  }
}
