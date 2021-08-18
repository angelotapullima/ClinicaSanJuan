import 'dart:math';

import 'package:clinica_app/src/models/data_model.dart';
import 'package:clinica_app/src/theme/theme.dart';
import 'package:clinica_app/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:platform_date_picker/platform_date_picker.dart';

class FormularioHistoriaPage extends StatefulWidget {
  final int index;
  const FormularioHistoriaPage({Key key, @required this.index}) : super(key: key);

  @override
  _FormularioHistoriaPageState createState() => _FormularioHistoriaPageState();
}

class _FormularioHistoriaPageState extends State<FormularioHistoriaPage> {
  final _changeData = ChangeExpanded();
  TextEditingController _presionArterialController = TextEditingController();
  TextEditingController _tallaController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _imcController = TextEditingController();
  TextEditingController _temperaturaController = TextEditingController();
  TextEditingController _frecuenciaCardiacaController = TextEditingController();
  TextEditingController _spo2Controller = TextEditingController();
  TextEditingController _frecuenciaRespiratoriaController = TextEditingController();

  TextEditingController _sintomasController = TextEditingController();
  TextEditingController _tiempoEnfermedadController = TextEditingController();
  TextEditingController _inicioController = TextEditingController();
  TextEditingController _cursoController = TextEditingController();
  TextEditingController _relatoController = TextEditingController();
  TextEditingController _antecedentesController = TextEditingController();

  TextEditingController _diagnosticoController = TextEditingController();
  TextEditingController _cie10Controller = TextEditingController();

  TextEditingController _examenController = TextEditingController();

  TextEditingController _farmacoController = TextEditingController();
  TextEditingController _dosisController = TextEditingController();
  TextEditingController _duracionController = TextEditingController();
  TextEditingController _ananmesisController = TextEditingController();

  TextEditingController _planController = TextEditingController();
  TextEditingController _observacionController = TextEditingController();
  TextEditingController _citaController = TextEditingController();

  FocusNode _focusPresion = FocusNode();
  FocusNode _focusTalla = FocusNode();
  FocusNode _focusPeso = FocusNode();
  FocusNode _focusIMC = FocusNode();
  FocusNode _focusTemperatura = FocusNode();
  FocusNode _focusFC = FocusNode();
  FocusNode _focusSPO2 = FocusNode();
  FocusNode _focusFR = FocusNode();
  FocusNode _focusSintomas = FocusNode();
  FocusNode _focusTiempoEn = FocusNode();
  FocusNode _focusRelato = FocusNode();
  FocusNode _focusAntecedentes = FocusNode();
  FocusNode _focusDiagnostico = FocusNode();
  FocusNode _focusCIE10 = FocusNode();
  FocusNode _focusExamen = FocusNode();
  FocusNode _focusFarmaco = FocusNode();
  FocusNode _focusDosis = FocusNode();
  FocusNode _focusDuracion = FocusNode();
  FocusNode _focusAnanmesis = FocusNode();
  FocusNode _focusPlan = FocusNode();
  FocusNode _focusObservacion = FocusNode();

  String valueEstablecimiento = 'Seleccionar';
  List<String> itemEstablecimiento = [
    'Seleccionar',
    'Clínica San Juan',
    'Servicios Generales',
  ];

  String tipo = 'Seleccionar';
  List<String> itemETipo = [
    'Seleccionar',
    'p',
    'd',
    'r',
  ];

  bool change = false;
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
                'assets/img/seguro-de-salud.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: responsive.wp(2),
            ),
            Text(
              "Historia Clínica",
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
            KeyboardActionsItem(focusNode: _focusPeso),
            KeyboardActionsItem(focusNode: _focusTalla),
            KeyboardActionsItem(focusNode: _focusIMC),
            KeyboardActionsItem(focusNode: _focusPresion),
            KeyboardActionsItem(focusNode: _focusFC),
            KeyboardActionsItem(focusNode: _focusFR),
            KeyboardActionsItem(focusNode: _focusTemperatura),
            KeyboardActionsItem(focusNode: _focusSPO2),
          ]),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: responsive.wp(5),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pre Factura',
                                  style: TextStyle(fontSize: responsive.ip(1.7), color: ColorsApp.grey),
                                ),
                                Text(
                                  '${pacientes[widget.index]['idPrefactura']}',
                                  style: TextStyle(fontSize: responsive.ip(2.1), color: ColorsApp.black, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'RENAES',
                                  style: TextStyle(fontSize: responsive.ip(1.7), color: ColorsApp.grey),
                                ),
                                Text(
                                  '${pacientes[widget.index]['renaes']}',
                                  style: TextStyle(fontSize: responsive.ip(2.1), color: ColorsApp.black, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: responsive.wp(5),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: responsive.hp(1),
                        ),
                        Column(
                          children: [
                            Text(
                              'Establecimiento',
                              style: TextStyle(fontSize: responsive.ip(1.7), color: ColorsApp.grey),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: responsive.wp(3),
                              ),
                              width: responsive.wp(80),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[200],
                              ),
                              height: responsive.hp(4),
                              child: DropdownButton<String>(
                                dropdownColor: Colors.white,
                                value: valueEstablecimiento,
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(
                                  color: ColorsApp.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: responsive.ip(2.1),
                                ),
                                underline: Container(),
                                onChanged: (String data) {
                                  setState(() {
                                    valueEstablecimiento = data;
                                  });
                                },
                                items: itemEstablecimiento.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: responsive.wp(3), vertical: responsive.hp(1)),
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
                AnimatedBuilder(
                    animation: _changeData,
                    builder: (context, _) {
                      return Column(
                        children: [
                          ExpansionTile(
                            onExpansionChanged: (valor) {
                              _changeData.onChangeValue(valor, false, false, false, false, false);
                            },
                            title: Text(
                              'Funciones Vitales',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: responsive.ip(1.8),
                              ),
                            ),
                            trailing: Container(
                              margin: EdgeInsets.symmetric(vertical: responsive.hp(.5)),
                              child: Icon(
                                _changeData.vitales ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                color: ColorsApp.blueClinica,
                              ),
                            ),
                            children: [_funcionesVitales(responsive)],
                          ),
                          ExpansionTile(
                            onExpansionChanged: (valor) {
                              _changeData.onChangeValue(false, valor, false, false, false, false);
                            },
                            title: Text(
                              'Enfermedad Actual',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: responsive.ip(1.8),
                              ),
                            ),
                            trailing: Container(
                              margin: EdgeInsets.symmetric(vertical: responsive.hp(.5)),
                              child: Icon(
                                _changeData.enfermedad ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                color: ColorsApp.blueClinica,
                              ),
                            ),
                            children: [_enfermedadActual(responsive)],
                          ),
                          ExpansionTile(
                            onExpansionChanged: (valor) {
                              _changeData.onChangeValue(false, false, valor, false, false, false);
                            },
                            title: Text(
                              'Diagnóstico',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: responsive.ip(1.8),
                              ),
                            ),
                            trailing: Container(
                              margin: EdgeInsets.symmetric(vertical: responsive.hp(.5)),
                              child: Icon(
                                _changeData.diagnostico ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                color: ColorsApp.blueClinica,
                              ),
                            ),
                            children: [_diagnostico(responsive)],
                          ),
                          ExpansionTile(
                            onExpansionChanged: (valor) {
                              _changeData.onChangeValue(false, false, false, valor, false, false);
                            },
                            title: Text(
                              'Exámenes',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: responsive.ip(1.8),
                              ),
                            ),
                            trailing: Container(
                              margin: EdgeInsets.symmetric(vertical: responsive.hp(.5)),
                              child: Icon(
                                _changeData.examenes ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                color: ColorsApp.blueClinica,
                              ),
                            ),
                            children: [_examenes(responsive)],
                          ),
                          ExpansionTile(
                            onExpansionChanged: (valor) {
                              _changeData.onChangeValue(false, false, false, false, valor, false);
                            },
                            title: Text(
                              'Medicamentos y Tratamiento',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: responsive.ip(1.8),
                              ),
                            ),
                            trailing: Container(
                              margin: EdgeInsets.symmetric(vertical: responsive.hp(.5)),
                              child: Icon(
                                _changeData.medicamentos ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                color: ColorsApp.blueClinica,
                              ),
                            ),
                            children: [_medicamentos(responsive)],
                          ),
                          ExpansionTile(
                            onExpansionChanged: (valor) {
                              _changeData.onChangeValue(false, false, false, false, false, valor);
                            },
                            title: Text(
                              'Plan de trabajo y Tratamiento',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: responsive.ip(1.8),
                              ),
                            ),
                            trailing: Container(
                              margin: EdgeInsets.symmetric(vertical: responsive.hp(.5)),
                              child: Icon(
                                _changeData.trabajo ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                color: ColorsApp.blueClinica,
                              ),
                            ),
                            children: [_plan(responsive)],
                          ),
                        ],
                      );
                    }),
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

  Widget _funcionesVitales(Responsive responsive) {
    return Column(
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
                    Text('IMC'),
                    _imputNumber(responsive, _focusIMC, '00', _imcController),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('P/A'),
                    _presionArterial(responsive),
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
                    Text('Frecuencia Respiratoria'),
                    _frecuenciaRespiratoria(responsive),
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
                    Text('Temperatura'),
                    _temperatura(responsive),
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
      ],
    );
  }

  Widget _enfermedadActual(Responsive responsive) {
    return Column(
      children: [
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Síntomas'),
                SizedBox(
                  height: responsive.hp(0.5),
                ),
                _imputTextMultiline(responsive, _focusSintomas, 'Síntomas', _sintomasController, 3, 10),
              ],
            ),
          ),
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tiempo con la enfermedad'),
                SizedBox(
                  height: responsive.hp(0.5),
                ),
                _imputTextMultiline(responsive, _focusTiempoEn, '', _tiempoEnfermedadController, 2, 5),
                SizedBox(
                  height: responsive.hp(1),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Inicio'),
                        SizedBox(
                          height: responsive.hp(0.5),
                        ),
                        _selectDate(responsive, _inicioController, 'Fecha'),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text('Curso'),
                        SizedBox(
                          height: responsive.hp(0.5),
                        ),
                        _selectDate(responsive, _cursoController, 'Fecha'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Relato de la enfermedad'),
                SizedBox(
                  height: responsive.hp(0.5),
                ),
                _imputTextMultiline(responsive, _focusRelato, 'Relato', _relatoController, 3, 10),
              ],
            ),
          ),
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Antecedentes'),
                SizedBox(
                  height: responsive.hp(0.5),
                ),
                _imputTextMultiline(responsive, _focusAntecedentes, '', _antecedentesController, 3, 10),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _diagnostico(Responsive responsive) {
    return Column(
      children: [
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Diagnóstico'),
                SizedBox(
                  height: responsive.hp(0.5),
                ),
                _imputTextMultiline(responsive, _focusDiagnostico, 'Ingrese información', _diagnosticoController, 3, 10),
              ],
            ),
          ),
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
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CIE10'),
                    _imputText(responsive, _focusCIE10, '', _cie10Controller),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      'Tipo',
                      style: TextStyle(fontSize: responsive.ip(1.7), color: ColorsApp.grey),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsive.wp(3),
                      ),
                      width: responsive.wp(38),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      height: responsive.hp(4),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.white,
                        value: tipo,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                          color: ColorsApp.black,
                          fontSize: responsive.ip(1.7),
                        ),
                        underline: Container(),
                        onChanged: (String data) {
                          setState(() {
                            tipo = data;
                          });
                        },
                        items: itemETipo.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _examenes(Responsive responsive) {
    return Column(
      children: [
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Exámenes'),
                SizedBox(
                  height: responsive.hp(0.5),
                ),
                _imputTextMultiline(responsive, _focusExamen, 'Ingrese información', _examenController, 3, 10),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _medicamentos(Responsive responsive) {
    return Column(
      children: [
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fármaco'),
                SizedBox(
                  height: responsive.hp(0.5),
                ),
                _imputTextMultiline(responsive, _focusFarmaco, '', _farmacoController, 1, 5),
              ],
            ),
          ),
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dosis'),
                SizedBox(
                  height: responsive.hp(0.5),
                ),
                _imputTextMultiline(responsive, _focusDosis, '', _dosisController, 1, 5),
              ],
            ),
          ),
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Duración'),
                SizedBox(
                  height: responsive.hp(0.5),
                ),
                _imputTextMultiline(responsive, _focusDuracion, '', _duracionController, 1, 5),
              ],
            ),
          ),
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ANANMESIS'),
                SizedBox(
                  height: responsive.hp(0.5),
                ),
                _imputTextMultiline(responsive, _focusAnanmesis, '', _ananmesisController, 4, 12),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _plan(Responsive responsive) {
    return Column(
      children: [
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Plan de trabajo y tratamiento'),
                SizedBox(
                  height: responsive.hp(0.5),
                ),
                _imputTextMultiline(responsive, _focusPlan, '', _planController, 5, 15),
              ],
            ),
          ),
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Observación'),
                SizedBox(
                  height: responsive.hp(0.5),
                ),
                _imputTextMultiline(responsive, _focusObservacion, '', _observacionController, 3, 10),
              ],
            ),
          ),
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Próxima cita'),
                SizedBox(
                  height: responsive.hp(0.5),
                ),
                _selectDate(responsive, _citaController, 'Fecha'),
              ],
            ),
          ),
        ),
      ],
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

  Container _imputNumber(Responsive responsive, FocusNode focus, String text, TextEditingController controller) {
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
        focusNode: focus,
        cursorColor: Colors.transparent,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: responsive.ip(1.7),
            ),
            hintText: text),
        enableInteractiveSelection: false,
        controller: controller,
      ),
    );
  }

  Container _imputText(Responsive responsive, FocusNode focus, String text, TextEditingController controller) {
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
        focusNode: focus,
        cursorColor: Colors.transparent,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: responsive.ip(1.7),
            ),
            hintText: text),
        enableInteractiveSelection: false,
        controller: controller,
      ),
    );
  }

  Container _imputTextMultiline(Responsive responsive, FocusNode focus, String text, TextEditingController controller, int lines, double tama) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.wp(2),
      ),
      width: responsive.wp(80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      height: responsive.hp(tama),
      child: TextField(
        focusNode: focus,
        cursorColor: Colors.transparent,
        keyboardType: TextInputType.text,
        maxLines: lines,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: responsive.ip(1.7),
            ),
            hintText: text),
        enableInteractiveSelection: false,
        controller: controller,
      ),
    );
  }

  Widget _selectDate(Responsive responsive, TextEditingController controller, String text) {
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
        cursorColor: Colors.transparent,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: responsive.ip(1.7),
            ),
            hintText: text),
        enableInteractiveSelection: false,
        controller: controller,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectdateInicio(context, controller);
        },
      ),
    );
  }

  _selectdateInicio(BuildContext context, TextEditingController controller) async {
    DateTime picked = await PlatformDatePicker.showDate(
      context: context,
      backgroundColor: Colors.white,
      firstDate: DateTime(DateTime.now().year - 100),
      initialDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    print('date $picked');
    if (picked != null) {
      setState(() {
        controller.text =
            "${picked.year.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";

        print(controller.text);
      });
    }
  }
}

class ChangeExpanded extends ChangeNotifier {
  bool vitales = false;
  bool enfermedad = false;
  bool diagnostico = false;
  bool examenes = false;
  bool medicamentos = false;
  bool trabajo = false;

  void onChangeValue(bool fv, bool ea, bool d, bool e, bool m, bool t) {
    vitales = fv;
    enfermedad = ea;
    diagnostico = d;
    examenes = e;
    medicamentos = m;
    trabajo = t;
    notifyListeners();
  }
}
