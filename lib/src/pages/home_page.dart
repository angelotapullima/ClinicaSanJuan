import 'package:clinica_app/src/bloc/provider_bloc.dart';
import 'package:clinica_app/src/pages/Citas/citas_page.dart';
import 'package:clinica_app/src/pages/HistoriasClinica/historia_page.dart';
import 'package:clinica_app/src/pages/Reportes/reportes_page.dart';
import 'package:clinica_app/src/pages/Triaje/triaje_page.dart';
import 'package:clinica_app/src/pages/user/user_page.dart';
import 'package:clinica_app/src/theme/theme.dart';
import 'package:clinica_app/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pageList = [];

  @override
  void initState() {
    pageList.add(TriajePage());
    pageList.add(CitasPage());
    pageList.add(HistoriaPage());
    pageList.add(ReportesPage());
    pageList.add(UserPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bottomBloc = ProviderBloc.bottomNavigator(context);

    final responsive = Responsive.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: bottomBloc.selectPageStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Stack(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: responsive.hp(3)),
                child: IndexedStack(
                  index: bottomBloc.page,
                  children: pageList,
                ),
              ),
              Positioned(
                bottom: responsive.hp(1.5),
                left: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: responsive.wp(2)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    // borderRadius: BorderRadiusDirectional.only(
                    //   topStart: Radius.circular(20),
                    //   topEnd: Radius.circular(20),
                    // ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    selectedItemColor: ColorsApp.greenClinica,
                    unselectedItemColor: ColorsApp.blueClinica,
                    selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
                    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                        label: 'Triaje',
                        icon: Icon(FontAwesomeIcons.notesMedical),
                      ),
                      BottomNavigationBarItem(
                        label: 'Citas',
                        icon: Icon(FontAwesomeIcons.calendarDay),
                      ),
                      BottomNavigationBarItem(
                        label: 'Historia',
                        icon: Icon(FontAwesomeIcons.fileMedical),
                      ),
                      BottomNavigationBarItem(
                        label: 'Reportes',
                        icon: Icon(FontAwesomeIcons.fileInvoice),
                      ),
                      BottomNavigationBarItem(
                        label: 'Info',
                        icon: Icon(FontAwesomeIcons.userMd),
                      ),
                    ],
                    currentIndex: bottomBloc.page,
                    onTap: (index) => {
                      bottomBloc.changePage(index),
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
