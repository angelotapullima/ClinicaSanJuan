import 'package:clinica_app/src/theme/theme.dart';
import 'package:clinica_app/src/utils/responsive.dart';
import 'package:flutter/material.dart';

class ReportesPage extends StatelessWidget {
  const ReportesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: ColorsApp.blueClinica,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: responsive.ip(5),
              width: responsive.ip(5),
              child: Image.asset(
                'assets/img/estadisticas.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: responsive.wp(2),
            ),
            Text(
              "Reportes",
              style: TextStyle(fontSize: responsive.ip(5), color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: responsive.hp(2),
          ),
          Expanded(
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: responsive.hp(3)),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)), color: Colors.white),
                child: Text('En proceso')),
          ),
        ],
      ),
    );
  }
}
