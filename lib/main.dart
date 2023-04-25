// ignore_for_file: avoid_print, unused_field, prefer_final_fields, prefer_const_constructors
import 'package:camp_brasileiro_app/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:camp_brasileiro_app/tabela_modelo.dart';
import 'package:camp_brasileiro_app/repositorio.dart';
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
      title: 'Brasileirão App - 2023',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Campeonato Brasileiro'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  repositorio _repositorio = repositorio();
  Future<List<modeloTime>>? _timesFuture;

  @override
  void initState() {
    //_timesFuture = _repositorio.carregaDadosEstaticos();
    _timesFuture = _repositorio.callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Tabela Brasileirão - 2023')),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.shade300,
        child: FutureBuilder(
            future: _timesFuture,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Erro: ${snapshot.error}');
              } else {
                List<modeloTime> times = snapshot.data as List<modeloTime>;
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 1,
                    );
                  },
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: times.length + 1,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? ListTile(
                            leading:
                                const SizedBox(width: 60, child: Text('')),
                            title: Row(
                              children: [
                                SizedBox(
                                    width: 100,
                                    child: Text(
                                      'Time',
                                      style: Style.fonte1,
                                    )),
                                SizedBox(
                                    width: 30,
                                    child: Center(
                                        child: Text(
                                      'P',
                                      style: Style.fonte1,
                                    ))),
                                SizedBox(
                                    width: 30,
                                    child: Center(
                                        child: Text(
                                      'J',
                                      style: Style.fonte1,
                                    ))),
                                SizedBox(
                                    width: 30,
                                    child: Center(
                                        child: Text(
                                      'V',
                                      style: Style.fonte1,
                                    ))),
                                SizedBox(
                                    width: 30,
                                    child: Center(
                                        child: Text(
                                      'E',
                                      style: Style.fonte1,
                                    ))),
                                SizedBox(
                                    width: 30,
                                    child: Center(
                                        child: Text(
                                      'D',
                                      style: Style.fonte1,
                                    ))),
                              ],
                            ),
                          )

                                      // child: Image.asset(
                                      //     '${times[index - 1].time['time_id']}.png'))),

                        : Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              leading: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Center(
                                      child: Image(image: AssetImage('${times[index - 1].time['time_id']}.png'),))),
                              title: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                      width: 100,
                                      child: Text(
                                          '${times[index - 1].posicao} - ${times[index - 1].time['nome_popular']}')),
                                  SizedBox(
                                      width: 30,
                                      child: Center(
                                          child: Text(times[index - 1]
                                              .pontos
                                              .toString()))),
                                  SizedBox(
                                    width: 30,
                                    child: Center(
                                      child: Text(
                                          times[index - 1].jogos.toString()),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Center(
                                      child: Text(
                                          times[index - 1].vitorias.toString()),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Center(
                                      child: Text(
                                          times[index - 1].empates.toString()),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Center(
                                      child: Text(
                                          times[index - 1].derrotas.toString()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                  },
                );
              }
            })),
      ),
    );
  }
}
