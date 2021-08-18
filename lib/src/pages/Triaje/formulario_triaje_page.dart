import 'dart:math';

import 'package:clinica_app/src/models/data_model.dart';
import 'package:clinica_app/src/theme/theme.dart';
import 'package:clinica_app/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class FormularioTriajePage extends StatefulWidget {
  final int index;
  const FormularioTriajePage({Key key, @required this.index}) : super(key: key);

  @override
  _FormularioTriajePageState createState() => _FormularioTriajePageState();
}

class _FormularioTriajePageState extends State<FormularioTriajePage> {
  TextEditingController _presionArterialController = TextEditingController();
  TextEditingController _tallaController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _temperaturaController = TextEditingController();
  TextEditingController _frecuenciaCardiacaController = TextEditingController();
  TextEditingController _spo2Controller = TextEditingController();
  TextEditingController _frecuenciaRespiratoriaController = TextEditingController();
  TextEditingController _perimetroAbdominalController = TextEditingController();
  TextEditingController _otrosController = TextEditingController();

  FocusNode _focusPresion = FocusNode();
  FocusNode _focusTalla = FocusNode();
  FocusNode _focusPeso = FocusNode();
  FocusNode _focusTemperatura = FocusNode();
  FocusNode _focusFC = FocusNode();
  FocusNode _focusSPO2 = FocusNode();
  FocusNode _focusFR = FocusNode();
  FocusNode _focusPA = FocusNode();
  FocusNode _focusOtros = FocusNode();
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: ColorsApp.greenClinica,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: responsive.ip(5),
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
              "Registrar triaje",
              style: TextStyle(fontSize: responsive.ip(2.5), color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: responsive.hp(3), left: responsive.wp(3), right: responsive.wp(3)),
        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)), color: Colors.white),
        child: KeyboardActions(
          config: KeyboardActionsConfig(keyboardSeparatorColor: Colors.white, keyboardBarColor: Colors.white, actions: [
            KeyboardActionsItem(focusNode: _focusPresion),
            KeyboardActionsItem(focusNode: _focusTalla),
            KeyboardActionsItem(focusNode: _focusPeso),
            KeyboardActionsItem(focusNode: _focusTemperatura),
            KeyboardActionsItem(focusNode: _focusFC),
            KeyboardActionsItem(focusNode: _focusSPO2),
            KeyboardActionsItem(focusNode: _focusFR),
            KeyboardActionsItem(focusNode: _focusPA),
            KeyboardActionsItem(focusNode: _focusOtros),
          ]),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(4)),
                  child: Text(
                    'Pre Factura ${pacientes[widget.index]['idPrefactura']}',
                    style: TextStyle(fontSize: responsive.ip(1.7)),
                  ),
                ),
                Container(
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
                          child: Image.asset(
                            (pacientes[widget.index]['sexo'] == '1') ? 'assets/img/chico.png' : 'assets/img/mujer.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${pacientes[widget.index]['name']}',
                              style: TextStyle(fontSize: responsive.ip(2.1), color: ColorsApp.black, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: responsive.hp(1),
                            ),
                            Text(
                              'DNI: ${pacientes[widget.index]['dni']} | ${pacientes[widget.index]['age']} años',
                              style: TextStyle(fontSize: responsive.ip(1.7), color: ColorsApp.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              (pacientes[widget.index]['sexo'] == '1') ? FontAwesomeIcons.male : FontAwesomeIcons.female,
                              color: (pacientes[widget.index]['sexo'] == '1') ? Colors.blueAccent : Colors.pinkAccent,
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
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Presión Arterial'),
                            _presionArterial(responsive),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Talla'),
                            _talla(responsive),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
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
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Peso'),
                            _peso(responsive),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Temperatura'),
                            _temperatura(responsive),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
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
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Frecuencia Cardiaca'),
                            _frecuenciaCardiaca(responsive),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('SPO2 %'),
                            _spo2(responsive),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
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
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Frecuencia Respiratoria'),
                            _frecuenciaRespiratoria(responsive),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Perímetro Abdominal'),
                            _perimetro(responsive),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
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
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Otros'),
                        _otros(responsive),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: responsive.wp(3), vertical: responsive.hp(1)),
                  width: double.infinity,
                  height: responsive.hp(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
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
                  child: Center(
                      child: Text(
                    'Guardar',
                    style: TextStyle(fontSize: responsive.ip(2.5), color: Colors.white, fontWeight: FontWeight.w700),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _presionArterial(Responsive responsive) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.wp(2),
      ),
      width: responsive.wp(38),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      height: responsive.hp(4),
      child: TextField(
        focusNode: _focusPresion,
        cursorColor: Colors.transparent,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: responsive.ip(1.7),
            ),
            hintText: '00'),
        enableInteractiveSelection: false,
        controller: _presionArterialController,
        //controller: montoPagarontroller,
      ),
    );
  }

  Container _talla(Responsive responsive) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.wp(2),
      ),
      width: responsive.wp(38),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      height: responsive.hp(4),
      child: TextField(
        focusNode: _focusTalla,
        cursorColor: Colors.transparent,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: responsive.ip(1.7),
            ),
            hintText: '00'),
        enableInteractiveSelection: false,
        controller: _tallaController,
        //controller: montoPagarontroller,
      ),
    );
  }

  Container _peso(Responsive responsive) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.wp(2),
      ),
      width: responsive.wp(38),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      height: responsive.hp(4),
      child: TextField(
        focusNode: _focusPeso,
        cursorColor: Colors.transparent,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: responsive.ip(1.7),
            ),
            hintText: '00'),
        enableInteractiveSelection: false,
        controller: _pesoController,
        //controller: montoPagarontroller,
      ),
    );
  }

  Container _temperatura(Responsive responsive) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.wp(2),
      ),
      width: responsive.wp(38),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      height: responsive.hp(4),
      child: TextField(
        focusNode: _focusTemperatura,
        cursorColor: Colors.transparent,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: responsive.ip(1.7),
            ),
            hintText: '00'),
        enableInteractiveSelection: false,
        controller: _temperaturaController,
        //controller: montoPagarontroller,
      ),
    );
  }

  Container _frecuenciaCardiaca(Responsive responsive) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.wp(2),
      ),
      width: responsive.wp(38),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      height: responsive.hp(4),
      child: TextField(
        focusNode: _focusFC,
        cursorColor: Colors.transparent,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: responsive.ip(1.7),
            ),
            hintText: '00'),
        enableInteractiveSelection: false,
        controller: _frecuenciaCardiacaController,
        //controller: montoPagarontroller,
      ),
    );
  }

  Container _spo2(Responsive responsive) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.wp(2),
      ),
      width: responsive.wp(38),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      height: responsive.hp(4),
      child: TextField(
        focusNode: _focusSPO2,
        cursorColor: Colors.transparent,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: responsive.ip(1.7),
            ),
            hintText: '00'),
        enableInteractiveSelection: false,
        controller: _spo2Controller,
        //controller: montoPagarontroller,
      ),
    );
  }

  Container _frecuenciaRespiratoria(Responsive responsive) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.wp(2),
      ),
      width: responsive.wp(38),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      height: responsive.hp(4),
      child: TextField(
        focusNode: _focusFR,
        cursorColor: Colors.transparent,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: responsive.ip(1.7),
            ),
            hintText: '00'),
        enableInteractiveSelection: false,
        controller: _frecuenciaRespiratoriaController,
        //controller: montoPagarontroller,
      ),
    );
  }

  Container _perimetro(Responsive responsive) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.wp(2),
      ),
      width: responsive.wp(38),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      height: responsive.hp(4),
      child: TextField(
        focusNode: _focusPA,
        cursorColor: Colors.transparent,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: responsive.ip(1.7),
            ),
            hintText: '00'),
        enableInteractiveSelection: false,
        controller: _perimetroAbdominalController,
        //controller: montoPagarontroller,
      ),
    );
  }

  Container _otros(Responsive responsive) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.wp(2),
      ),
      width: responsive.wp(80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      height: responsive.hp(10),
      child: TextField(
        focusNode: _focusOtros,
        cursorColor: Colors.transparent,
        keyboardType: TextInputType.text,
        maxLines: 3,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: responsive.ip(1.7),
            ),
            hintText: 'Ingrese información'),
        enableInteractiveSelection: false,
        controller: _otrosController,
        //controller: montoPagarontroller,
      ),
    );
  }
}
