import 'package:clinica_app/src/utils/responsive.dart';
import 'package:flutter/material.dart';

class FormularioTriajePage extends StatelessWidget {
  const FormularioTriajePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [_crearAppbar(responsive)],
      ),
    );
  }

  Widget _crearAppbar(Responsive responsive) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.white,
      expandedHeight: responsive.hp(30),
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          'Registrar triaje',
          style: TextStyle(
            color: Colors.black,
            fontSize: responsive.ip(2.3),
          ),
        ),
        background: Padding(
          padding: EdgeInsets.all(1),
          child: Container(
            child: Image(image: AssetImage('assets/img/LOGO.png'), fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
