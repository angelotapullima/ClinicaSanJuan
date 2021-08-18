import 'package:after_layout/after_layout.dart';
import 'package:clinica_app/src/bloc/provider_bloc.dart';
import 'package:clinica_app/src/prefences/preferences.dart';
import 'package:clinica_app/src/theme/theme.dart';
import 'package:clinica_app/src/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  @override
  void afterFirstLayout(BuildContext context) async {}

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final preferences = Preferences();

      if (preferences.idUser.toString().isEmpty || preferences.idUser == null || preferences.idUser == '0') {
        Navigator.pushReplacementNamed(context, 'login');
      } else {
        final bottomBloc = ProviderBloc.bottomNavigator(context);
        bottomBloc.changePage(0);
        Navigator.pushReplacementNamed(context, 'login');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            color: ColorsApp.blueClinica,
            child: Stack(
              children: [
                Positioned(
                  bottom: responsive.ip(-25),
                  top: responsive.ip(-25),
                  left: responsive.ip(-25),
                  right: responsive.ip(-25),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(-20),
                  top: responsive.ip(-20),
                  left: responsive.ip(-20),
                  right: responsive.ip(-20),
                  child: CircleAvatar(
                    backgroundColor: ColorsApp.blueClinica,
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(-15),
                  top: responsive.ip(-15),
                  left: responsive.ip(-15),
                  right: responsive.ip(-15),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(-10),
                  top: responsive.ip(-10),
                  left: responsive.ip(-10),
                  right: responsive.ip(-10),
                  child: CircleAvatar(
                    backgroundColor: ColorsApp.blueClinica,
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(-5),
                  top: responsive.ip(-5),
                  left: responsive.ip(-5),
                  right: responsive.ip(-5),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(0),
                  top: responsive.ip(0),
                  left: responsive.ip(0),
                  right: responsive.ip(0),
                  child: CircleAvatar(
                    backgroundColor: ColorsApp.blueClinica,
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(5),
                  top: responsive.ip(5),
                  left: responsive.ip(5),
                  right: responsive.ip(5),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(10),
                  top: responsive.ip(10),
                  left: responsive.ip(10),
                  right: responsive.ip(10),
                  child: CircleAvatar(
                    backgroundColor: ColorsApp.blueClinica,
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(15),
                  top: responsive.ip(15),
                  left: responsive.ip(15),
                  right: responsive.ip(15),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(20),
                  top: responsive.ip(20),
                  left: responsive.ip(20),
                  right: responsive.ip(20),
                  child: CircleAvatar(
                    backgroundColor: ColorsApp.blueClinica,
                  ),
                ),
                Positioned(
                  bottom: responsive.ip(25),
                  top: responsive.ip(25),
                  left: responsive.ip(25),
                  right: responsive.ip(25),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
              ],
            ),
          ),
          // Center(
          //   child: Container(
          //     height: responsive.hp(25),
          //     width: responsive.wp(90),
          //     margin: EdgeInsets.all(10),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(40),
          //       boxShadow: [
          //         BoxShadow(
          //           blurRadius: 5,
          //           color: Colors.white.withOpacity(0.5),
          //           spreadRadius: 1,
          //           offset: Offset(0, 1),
          //         ),
          //         BoxShadow(
          //           blurRadius: 5,
          //           color: Colors.grey.withOpacity(0.5),
          //           spreadRadius: 1,
          //           offset: Offset(0, 1),
          //         ),
          //       ],
          //     ),
          //     child: Padding(
          //       padding: EdgeInsets.all(15),
          //       child: Image.asset(
          //         'assets/img/LOGO.png',
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
