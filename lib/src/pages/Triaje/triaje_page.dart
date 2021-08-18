import 'dart:math';

import 'package:clinica_app/src/models/data_model.dart';
import 'package:clinica_app/src/pages/Triaje/formulario_triaje_page.dart';
import 'package:clinica_app/src/theme/theme.dart';
import 'package:clinica_app/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TriajePage extends StatelessWidget {
  const TriajePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: ColorsApp.blueClinica,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: responsive.ip(6),
              width: responsive.ip(5),
              child: Image.asset(
                'assets/img/informe-medico.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: responsive.wp(2),
            ),
            Text(
              "Triaje",
              style: TextStyle(fontSize: responsive.ip(5), color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(height: responsive.hp(1)),
          Expanded(
              child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: responsive.hp(3)),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)), color: Colors.white),
            child: ListView.builder(
                itemCount: pacientes.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          opaque: false,
                          transitionDuration: const Duration(milliseconds: 400),
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return FormularioTriajePage();
                          },
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: responsive.wp(3), vertical: responsive.hp(1.5)),
                      height: responsive.hp(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              maxRadius: responsive.ip(5),
                              backgroundColor: ColorsGrid.colorsDark[Random().nextInt(ColorsGrid.colorsDark.length)],
                              child: Icon(
                                pacientes[index]['icon'],
                                color: Colors.white,
                                size: responsive.ip(3),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${pacientes[index]['name']}',
                                  style: TextStyle(fontSize: responsive.ip(2.1), color: ColorsApp.black, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: responsive.hp(1),
                                ),
                                Text(
                                  'DNI: ${pacientes[index]['dni']} | ${pacientes[index]['age']} años',
                                  style: TextStyle(fontSize: responsive.ip(1.7), color: ColorsApp.grey),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Icon(
                                  (pacientes[index]['sexo'] == '1') ? FontAwesomeIcons.male : FontAwesomeIcons.female,
                                  color: (pacientes[index]['sexo'] == '1') ? Colors.blueAccent : Colors.pinkAccent,
                                  size: responsive.ip(3.5),
                                ),
                                SizedBox(
                                  width: responsive.wp(1),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: ColorsApp.grey,
                                  size: responsive.ip(2),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }
}
