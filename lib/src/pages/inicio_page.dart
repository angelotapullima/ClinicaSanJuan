import 'package:clinica_app/src/pages/Citas/citas_page.dart';
import 'package:clinica_app/src/pages/HistoriasClinica/historia_page.dart';
import 'package:clinica_app/src/pages/InfoUser/info_user.page.dart';
import 'package:clinica_app/src/pages/Reportes/reportes_page.dart';
import 'package:clinica_app/src/pages/Triaje/triaje_page.dart';
import 'package:clinica_app/src/theme/theme.dart';
import 'package:clinica_app/src/utils/responsive.dart';
import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: responsive.hp(29),
            decoration: BoxDecoration(
              color: ColorsApp.blueClinica,
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: responsive.ip(-20),
                  top: responsive.ip(-12),
                  left: responsive.ip(-16),
                  right: responsive.ip(-16),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(-16),
                  top: responsive.ip(-8),
                  left: responsive.ip(-12),
                  right: responsive.ip(-12),
                  child: CircleAvatar(
                    backgroundColor: ColorsApp.blueClinica,
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(-12),
                  top: responsive.ip(-4),
                  left: responsive.ip(-8),
                  right: responsive.ip(-8),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(-8),
                  top: responsive.ip(0),
                  left: responsive.ip(-4),
                  right: responsive.ip(-4),
                  child: CircleAvatar(
                    backgroundColor: ColorsApp.blueClinica,
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(-4),
                  top: responsive.ip(4),
                  left: responsive.ip(0),
                  right: responsive.ip(0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(0),
                  top: responsive.ip(8),
                  left: responsive.ip(4),
                  right: responsive.ip(4),
                  child: CircleAvatar(
                    backgroundColor: ColorsApp.blueClinica,
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(4),
                  top: responsive.ip(12),
                  left: responsive.ip(8),
                  right: responsive.ip(8),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(8),
                  top: responsive.ip(16),
                  left: responsive.ip(12),
                  right: responsive.ip(12),
                  child: CircleAvatar(
                    backgroundColor: ColorsApp.blueClinica,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: responsive.hp(29.1),
            right: 0,
            left: 0,
            child: Container(
              height: responsive.hp(0.1),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.white.withOpacity(0.9),
                    spreadRadius: 5,
                    offset: Offset(0, -1),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive.hp(3)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: responsive.hp(1)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              opaque: false,
                              transitionDuration: const Duration(milliseconds: 400),
                              pageBuilder: (context, animation, secondaryAnimation) {
                                return InfoUserPage();
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bienvenido",
                              style: TextStyle(fontSize: responsive.ip(2), color: Colors.white, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Patricio Lopez",
                              style: TextStyle(fontSize: responsive.ip(2.5), color: Colors.white, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              opaque: false,
                              transitionDuration: const Duration(milliseconds: 400),
                              pageBuilder: (context, animation, secondaryAnimation) {
                                return InfoUserPage();
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
                          height: responsive.ip(6),
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                          child: Image.asset(
                            'assets/img/chico.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: responsive.hp(4),
                ),
                Center(
                  child: Container(
                    height: responsive.hp(20),
                    width: responsive.wp(80),
                    margin: EdgeInsets.all(10),
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
                  height: responsive.hp(3),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: responsive.hp(2), horizontal: responsive.wp(2)),
                        child: Row(
                          children: [
                            InkWell(
                              child: Container(
                                height: responsive.hp(23),
                                width: responsive.wp(40),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                          height: responsive.hp(17),
                                          width: responsive.wp(39),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.lightBlueAccent,
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
                                          child: _circulos(responsive, Colors.lightBlueAccent)),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        height: responsive.hp(7),
                                        width: responsive.wp(39),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Triaje',
                                            style: TextStyle(fontSize: responsive.ip(2.5), fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: responsive.wp(3),
                                      child: Container(
                                        height: responsive.ip(15),
                                        child: Image.asset(
                                          'assets/img/informe-medico.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    opaque: false,
                                    transitionDuration: const Duration(milliseconds: 400),
                                    pageBuilder: (context, animation, secondaryAnimation) {
                                      return TriajePage();
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
                            ),
                            Spacer(),
                            InkWell(
                              child: Container(
                                height: responsive.hp(23),
                                width: responsive.wp(40),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                          height: responsive.hp(17),
                                          width: responsive.wp(39),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: ColorsApp.greenLemon,
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
                                          child: _circulos(responsive, ColorsApp.greenLemon)),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        height: responsive.hp(7),
                                        width: responsive.wp(39),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Citas',
                                            style: TextStyle(fontSize: responsive.ip(2.5), fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: responsive.wp(3),
                                      child: Container(
                                        height: responsive.ip(15),
                                        child: Image.asset(
                                          'assets/img/cita.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    opaque: false,
                                    transitionDuration: const Duration(milliseconds: 400),
                                    pageBuilder: (context, animation, secondaryAnimation) {
                                      return CitasPage();
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
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: responsive.hp(2), horizontal: responsive.wp(2)),
                        child: Row(
                          children: [
                            InkWell(
                              child: Container(
                                height: responsive.hp(23),
                                width: responsive.wp(40),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                          height: responsive.hp(17),
                                          width: responsive.wp(39),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: ColorsApp.yellowDeep,
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
                                          child: _circulos(responsive, ColorsApp.yellowDeep)),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        height: responsive.hp(7),
                                        width: responsive.wp(39),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Historias',
                                            style: TextStyle(fontSize: responsive.ip(2.5), fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: responsive.wp(3),
                                      child: Container(
                                        height: responsive.ip(14.5),
                                        child: Image.asset(
                                          'assets/img/seguro-de-salud.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    opaque: false,
                                    transitionDuration: const Duration(milliseconds: 400),
                                    pageBuilder: (context, animation, secondaryAnimation) {
                                      return HistoriaPage();
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
                            ),
                            Spacer(),
                            InkWell(
                              child: Container(
                                height: responsive.hp(23),
                                width: responsive.wp(40),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                          height: responsive.hp(17),
                                          width: responsive.wp(39),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: ColorsApp.blueApp,
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
                                          child: _circulos(responsive, ColorsApp.blueApp)),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        height: responsive.hp(7),
                                        width: responsive.wp(39),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Reportes',
                                            style: TextStyle(fontSize: responsive.ip(2.5), fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: responsive.wp(3),
                                      child: Container(
                                        height: responsive.ip(15),
                                        child: Image.asset(
                                          'assets/img/estadisticas.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    opaque: false,
                                    transitionDuration: const Duration(milliseconds: 400),
                                    pageBuilder: (context, animation, secondaryAnimation) {
                                      return ReportesPage();
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _circulos(Responsive responsive, Color color) {
    return Stack(
      children: [
        Positioned(
          bottom: responsive.ip(-2),
          top: responsive.ip(-2),
          left: responsive.ip(-2),
          right: responsive.ip(-2),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
        Positioned(
          bottom: responsive.ip(-1),
          top: responsive.ip(-1),
          left: responsive.ip(-1),
          right: responsive.ip(-1),
          child: CircleAvatar(
            backgroundColor: color,
          ),
        ),
        Positioned(
          bottom: responsive.ip(0),
          top: responsive.ip(0),
          left: responsive.ip(0),
          right: responsive.ip(0),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
        Positioned(
          bottom: responsive.ip(1),
          top: responsive.ip(1),
          left: responsive.ip(1),
          right: responsive.ip(1),
          child: CircleAvatar(
            backgroundColor: color,
          ),
        ),
        Positioned(
          bottom: responsive.ip(2),
          top: responsive.ip(2),
          left: responsive.ip(2),
          right: responsive.ip(2),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
        Positioned(
          bottom: responsive.ip(3),
          top: responsive.ip(3),
          left: responsive.ip(3),
          right: responsive.ip(3),
          child: CircleAvatar(
            backgroundColor: color,
          ),
        ),
        Positioned(
          bottom: responsive.ip(4),
          top: responsive.ip(4),
          left: responsive.ip(4),
          right: responsive.ip(4),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
        Positioned(
          bottom: responsive.ip(5),
          top: responsive.ip(5),
          left: responsive.ip(5),
          right: responsive.ip(5),
          child: CircleAvatar(
            backgroundColor: color,
          ),
        ),
        Positioned(
          bottom: responsive.ip(6),
          top: responsive.ip(6),
          left: responsive.ip(6),
          right: responsive.ip(6),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}

class MyCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    // var controlPoint = Offset(50, size.height);
    // var endpoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(size.width / 2, size.height - 100, size.width, size.height);
    //path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
