import 'dart:math';

import 'package:clinica_app/src/models/data_model.dart';
import 'package:clinica_app/src/pages/Citas/citas_medico_page.dart';
import 'package:clinica_app/src/theme/theme.dart';
import 'package:clinica_app/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CitasPage extends StatelessWidget {
  const CitasPage({Key key}) : super(key: key);

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
                'assets/img/cita.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: responsive.wp(2),
            ),
            Text(
              "Citas",
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
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: medicos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                ),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          opaque: false,
                          transitionDuration: const Duration(milliseconds: 400),
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return CitasMedicoPage(
                              medico: medicos[index]['name'],
                              servicio: medicos[index]['servicio'],
                              icon: medicos[index]['icon'],
                            );
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
                        margin: EdgeInsets.symmetric(horizontal: responsive.wp(1), vertical: responsive.hp(1)),
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
                          child: Column(
                            children: [
                              SizedBox(
                                height: responsive.hp(1),
                              ),
                              Container(
                                height: responsive.hp(15),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                        maxRadius: responsive.ip(6),
                                        backgroundColor: ColorsGrid.colorsDark[Random().nextInt(ColorsGrid.colorsDark.length)],
                                      ),
                                    ),
                                    Positioned(
                                      child: Container(
                                        height: responsive.ip(10),
                                        child: Image.asset(
                                          medicos[index]['icon'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: responsive.hp(3),
                              ),
                              Text(
                                '${medicos[index]['name']}',
                                style: TextStyle(fontSize: responsive.ip(2.1), color: ColorsApp.black, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: responsive.hp(1),
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  Icon(
                                    FontAwesomeIcons.stethoscope,
                                    color: ColorsApp.greenClinica,
                                    size: responsive.ip(2),
                                  ),
                                  SizedBox(
                                    width: responsive.wp(2),
                                  ),
                                  Text(
                                    '${medicos[index]['servicio']}',
                                    style: TextStyle(fontSize: responsive.ip(1.8), color: ColorsApp.grey),
                                  ),
                                  Spacer(),
                                ],
                              )
                            ],
                          ),
                        )),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
