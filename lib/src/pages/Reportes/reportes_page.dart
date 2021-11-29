import 'package:clinica_app/src/theme/theme.dart';
import 'package:clinica_app/src/utils/responsive.dart';
import 'package:flutter/material.dart';

class ReportesPage extends StatelessWidget {
  const ReportesPage({Key key}) : super(key: key);

  get medicos => null;

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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: responsive.wp(3), vertical: responsive.hp(1.5)),
                        width: double.infinity,
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
                          padding: EdgeInsets.symmetric(horizontal: responsive.wp(4), vertical: responsive.hp(1)),
                          child: Column(
                            children: [
                              Text('Citas por Clientes',
                                  style: TextStyle(fontSize: responsive.ip(2.5), color: Colors.black, fontWeight: FontWeight.w700)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: EdgeInsets.symmetric(horizontal: responsive.wp(1)),
                                      height: responsive.hp(50),
                                      width: responsive.wp(20),
                                      child: Column(
                                        children: [
                                          Spacer(),
                                          Text('30',
                                              style:
                                                  TextStyle(fontSize: responsive.ip(3), color: ColorsApp.greenClinica, fontWeight: FontWeight.w700)),
                                          Container(
                                            height: responsive.hp(20),
                                            width: responsive.wp(20),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: ColorsApp.yellowDeep,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 5,
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 1,
                                                  offset: Offset(0, 1),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: responsive.hp(1),
                                          ),
                                          Text('Particular', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                                        ],
                                      )),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: responsive.wp(1)),
                                    height: responsive.hp(50),
                                    width: responsive.wp(20),
                                    child: Column(
                                      children: [
                                        Spacer(),
                                        Text('40',
                                            style: TextStyle(fontSize: responsive.ip(3), color: ColorsApp.greenClinica, fontWeight: FontWeight.w700)),
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: responsive.wp(1)),
                                          height: responsive.hp(30),
                                          width: responsive.wp(20),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: ColorsApp.greenClinica,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 1,
                                                offset: Offset(0, 1),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: responsive.hp(1),
                                        ),
                                        Text('Convenio', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: responsive.wp(1)),
                                    height: responsive.hp(50),
                                    width: responsive.wp(20),
                                    child: Column(
                                      children: [
                                        Spacer(),
                                        Text('50',
                                            style: TextStyle(fontSize: responsive.ip(3), color: ColorsApp.greenClinica, fontWeight: FontWeight.w700)),
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: responsive.wp(1)),
                                          height: responsive.hp(40),
                                          width: responsive.wp(20),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: ColorsApp.redOrange,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 1,
                                                offset: Offset(0, 1),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: responsive.hp(1),
                                        ),
                                        Text('Asegurado', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: responsive.wp(3),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: responsive.wp(3), vertical: responsive.hp(1)),
                        width: double.infinity,
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
                          padding: EdgeInsets.symmetric(horizontal: responsive.wp(4), vertical: responsive.hp(1)),
                          child: Column(
                            children: [
                              Text('Citas por Médicos',
                                  style: TextStyle(fontSize: responsive.ip(2.5), color: Colors.black, fontWeight: FontWeight.w700)),
                              SizedBox(
                                height: responsive.wp(3),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: responsive.wp(1)),
                                    height: responsive.hp(5),
                                    width: responsive.wp(60),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: ColorsApp.greenGrey,
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
                                        child: Text('Araceli Pardo',
                                            style: TextStyle(fontSize: responsive.ip(2), color: Colors.white, fontWeight: FontWeight.w700))),
                                  ),
                                  Spacer(),
                                  Text('60', style: TextStyle(fontSize: responsive.ip(3), color: ColorsApp.blueClinica, fontWeight: FontWeight.w700)),
                                ],
                              ),
                              SizedBox(
                                height: responsive.wp(1.5),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: responsive.wp(1)),
                                    height: responsive.hp(5),
                                    width: responsive.wp(45),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: ColorsApp.redOrange,
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
                                        child: Text('Cesar Vilchez',
                                            style: TextStyle(fontSize: responsive.ip(2), color: Colors.white, fontWeight: FontWeight.w700))),
                                  ),
                                  Spacer(),
                                  Text('40', style: TextStyle(fontSize: responsive.ip(3), color: ColorsApp.blueClinica, fontWeight: FontWeight.w700)),
                                ],
                              ),
                              SizedBox(
                                height: responsive.wp(1.5),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: responsive.wp(1)),
                                    height: responsive.hp(5),
                                    width: responsive.wp(35),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: ColorsApp.greenLemon,
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
                                        child: Text('María Lopez',
                                            style: TextStyle(fontSize: responsive.ip(2), color: Colors.white, fontWeight: FontWeight.w700))),
                                  ),
                                  Spacer(),
                                  Text('35', style: TextStyle(fontSize: responsive.ip(3), color: ColorsApp.blueClinica, fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
