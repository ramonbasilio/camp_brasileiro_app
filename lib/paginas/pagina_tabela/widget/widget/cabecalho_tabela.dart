import 'package:camp_brasileiro_app/formatacao/style.dart';
import 'package:flutter/material.dart';

class CabecalhoTabela extends StatelessWidget {
  const CabecalhoTabela({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: ListTile(
        leading: const SizedBox(width: 60, child: Text('')),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
