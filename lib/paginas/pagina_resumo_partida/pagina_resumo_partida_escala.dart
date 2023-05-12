import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PaginaResumoPartidaEscalacao extends StatefulWidget {
  const PaginaResumoPartidaEscalacao({super.key});

  @override
  State<PaginaResumoPartidaEscalacao> createState() => _PaginaResumoPartidaEscalacaoState();
}

class _PaginaResumoPartidaEscalacaoState extends State<PaginaResumoPartidaEscalacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escalação'),
      ),
      
    );
  }
}