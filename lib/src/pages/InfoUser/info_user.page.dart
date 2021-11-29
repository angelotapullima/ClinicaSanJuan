import 'dart:math';

import 'package:clinica_app/src/pages/InfoUser/cerrar_sesion.dart';
import 'package:clinica_app/src/theme/theme.dart';
import 'package:clinica_app/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoUserPage extends StatelessWidget {
  const InfoUserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: ColorsApp.greenClinica,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: responsive.hp(20),
              width: responsive.wp(80),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.white.withOpacity(0.5),
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                  ),
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Image.asset(
                  'assets/img/LOGO.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: responsive.hp(1),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.only(top: responsive.hp(3), left: responsive.wp(3), right: responsive.wp(3)),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)), color: Colors.white),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: responsive.wp(3), vertical: responsive.hp(1.5)),
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
                              child: Image.asset(
                                'assets/img/chico.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: responsive.wp(2),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Patricio Lopez Lopez',
                                  style: TextStyle(fontSize: responsive.ip(2.1), color: ColorsApp.black, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: responsive.hp(0.5),
                                ),
                                Text(
                                  'Admin',
                                  style: TextStyle(fontSize: responsive.ip(1.7), color: ColorsApp.grey),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.male,
                                  color: Colors.blueAccent,
                                  size: responsive.ip(3.5),
                                ),
                                SizedBox(
                                  width: responsive.wp(1),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: responsive.wp(3), vertical: responsive.hp(1.5)),
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
                              maxRadius: responsive.ip(3),
                              backgroundColor: ColorsApp.orange,
                              child: Icon(
                                FontAwesomeIcons.cog,
                                color: Colors.white,
                                size: responsive.ip(4),
                              ),
                            ),
                            SizedBox(
                              width: responsive.wp(2),
                            ),
                            Text(
                              'Configuración',
                              style: TextStyle(fontSize: responsive.ip(2.1), color: ColorsApp.black, fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: ColorsApp.grey,
                                  size: responsive.ip(2),
                                ),
                                SizedBox(
                                  width: responsive.wp(1),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: responsive.wp(3), vertical: responsive.hp(1.5)),
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
                              maxRadius: responsive.ip(3),
                              backgroundColor: ColorsApp.greenLemon,
                              child: Icon(
                                FontAwesomeIcons.headset,
                                color: Colors.white,
                                size: responsive.ip(4),
                              ),
                            ),
                            SizedBox(
                              width: responsive.wp(2),
                            ),
                            Text(
                              'Soporte',
                              style: TextStyle(fontSize: responsive.ip(2.1), color: ColorsApp.black, fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: ColorsApp.grey,
                                  size: responsive.ip(2),
                                ),
                                SizedBox(
                                  width: responsive.wp(1),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: responsive.wp(3), vertical: responsive.hp(1.5)),
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
                              maxRadius: responsive.ip(3),
                              backgroundColor: ColorsApp.redOrange,
                              child: Icon(
                                FontAwesomeIcons.mobileAlt,
                                color: Colors.white,
                                size: responsive.ip(4),
                              ),
                            ),
                            SizedBox(
                              width: responsive.wp(2),
                            ),
                            Column(
                              children: [
                                Text(
                                  'App Versión',
                                  style: TextStyle(fontSize: responsive.ip(2.1), color: ColorsApp.black, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '1.00',
                                  style: TextStyle(fontSize: responsive.ip(2.1), color: ColorsApp.black, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            opaque: false,
                            transitionDuration: const Duration(milliseconds: 400),
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return CerrarSession();
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
                        margin: EdgeInsets.symmetric(horizontal: responsive.wp(3), vertical: responsive.hp(1)),
                        width: double.infinity,
                        height: responsive.hp(5),
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
                        child: Center(
                            child: Text(
                          'Cerrar Sesión',
                          style: TextStyle(fontSize: responsive.ip(2.5), color: ColorsApp.greenClinica, fontWeight: FontWeight.w700),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: responsive.hp(2),
                    ),
                    Center(
                        child: Text(
                      'Desarrollado por Bufeo Tec Company',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )),
                    SizedBox(
                      height: responsive.hp(2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
