import 'package:clinica_app/src/models/data_model.dart';
import 'package:clinica_app/src/theme/theme.dart';
import 'package:clinica_app/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class CitasMedicoPage extends StatelessWidget {
  final String medico;
  final String servicio;
  final String icon;
  const CitasMedicoPage({Key key, @required this.medico, @required this.servicio, @required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: ColorsApp.blueClinica,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Citas",
          style: TextStyle(fontSize: responsive.ip(3), color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(4)),
            child: Row(
              children: [
                Container(
                  height: responsive.ip(4),
                  width: responsive.ip(4),
                  child: Image.asset(
                    '${this.icon}',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: responsive.wp(2),
                ),
                Text(
                  "${this.medico}",
                  style: TextStyle(fontSize: responsive.ip(2.5), color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          TableCalendar(
            calendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            locale: 'es_ES',
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: responsive.ip(2.3)),
              leftChevronIcon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: responsive.ip(2),
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: responsive.ip(2),
              ),
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(shape: BoxShape.circle, color: ColorsApp.greenClinica),
              selectedDecoration: BoxDecoration(shape: BoxShape.circle, color: ColorsApp.greenClinica),
              weekendTextStyle: TextStyle(
                color: Colors.white,
              ),
              defaultTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(weekendStyle: TextStyle(color: Colors.white), weekdayStyle: TextStyle(color: Colors.white)),
          ),
          SizedBox(
            height: responsive.hp(1),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: responsive.hp(3), right: responsive.wp(3), left: responsive.wp(3)),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)), color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "17 agosto 2021",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: horasCitas.length,
                        itemBuilder: (_, index) {
                          return _cita(responsive, "${horasCitas[index]['horaIncio']}", "${pacientes[index]['name']}",
                              "${horasCitas[index]['horario']}", "${pacientes[index]['idPrefactura']}", "${pacientes[index]['sexo']}");
                        }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _cita(Responsive responsive, String time, String name, String horario, String id, String sexo) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: responsive.wp(20),
          child: Text(
            time,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsApp.greenWhite,
            ),
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(color: ColorsApp.blueClinica, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${this.servicio}',
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.timer,
                      color: ColorsApp.blueClinica,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "$horario",
                      style: TextStyle(color: ColorsApp.blueClinica, fontSize: 13, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Prefactura: $id",
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: ColorsApp.blueClinica,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.mail_outline,
                      color: ColorsApp.blueClinica,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Icon(
                      (sexo == '1') ? FontAwesomeIcons.male : FontAwesomeIcons.female,
                      color: (sexo == '1') ? Colors.blueAccent : Colors.pinkAccent,
                      size: responsive.ip(3.5),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
