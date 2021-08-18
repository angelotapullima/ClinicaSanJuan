import 'dart:io';

import 'package:clinica_app/src/bloc/login_bloc.dart';
import 'package:clinica_app/src/bloc/provider_bloc.dart';
import 'package:clinica_app/src/models/login_model.dart';
import 'package:clinica_app/src/prefences/preferences.dart';
import 'package:clinica_app/src/theme/theme.dart';
import 'package:clinica_app/src/utils/responsive.dart';
import 'package:clinica_app/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final blocLogin = ProviderBloc.of(context);
    blocLogin.cargandoFalse();
    final responsive = Responsive.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondo(),
          _form(context, blocLogin, responsive),
          _cargando(context, blocLogin),
        ],
      ),
    );
  }

  Widget _fondo() {
    final responsive = Responsive.of(context);
    return Container(
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
    );
  }

  Widget _form(BuildContext context, LoginBloc bloc, Responsive responsive) {
    //final bloc = ProviderBloc.of(context);
    final size = MediaQuery.of(context).size;

    //final String assetName = 'assets/img/log.png';
    return SafeArea(
      child: Container(
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.17,
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
              height: size.height * 0.05,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: responsive.wp(7),
              ),
              child: Column(
                children: <Widget>[
                  _textUser(bloc),
                  SizedBox(
                    height: responsive.ip(2),
                  ),
                  _textPass(bloc),
                  SizedBox(
                    height: responsive.ip(2),
                  ),
                  _botonLogin(context, bloc),
                  SizedBox(
                    height: responsive.ip(6),
                  ),
                ],
              ),
            ),

            //TextField(),
          ],
        ),
      ),
    );
  }

  Widget _textUser(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.usuarioStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Theme(
          data: ThemeData(primaryColor: Colors.white, accentColor: Colors.white),
          child: TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: 'Ingrese su Usuario',
                hintStyle: TextStyle(color: Colors.white),
                labelText: 'Usuario',
                errorText: snapshot.error,
                suffixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              onChanged: bloc.changeUsuario),
        );
      },
    );
  }

  Widget _textPass(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Theme(
          data: ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.red,
          ),
          child: TextField(
            obscureText: _passwordVisible,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: 'Ingrese su contraseña',
              hintStyle: TextStyle(color: Colors.white),
              labelText: 'Contraseña',
              errorText: snapshot.error,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    if (_passwordVisible) {
                      _passwordVisible = false;
                    } else {
                      _passwordVisible = true;
                    }
                  });
                },
                icon: _passwordVisible
                    ? Icon(
                        Icons.visibility,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: Colors.white,
                      ),
              ),
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _botonLogin(BuildContext context, LoginBloc bloc) {
    final responsive = Responsive.of(context);
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return SizedBox(
          width: double.infinity,
          height: responsive.ip(4),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(0.0),
            child: Text(
              'Iniciar Sesión',
              style: TextStyle(fontSize: responsive.ip(2), fontWeight: FontWeight.w700),
            ),
            color: ColorsApp.greenClinica,
            textColor: Colors.white,
            onPressed: (snapshot.hasData) ? () => _submit(context, bloc) : () {},
          ),
        );
      },
    );
  }

  _submit(BuildContext context, LoginBloc bloc) async {
    final LoginModel code = await bloc.login('${bloc.usuario}', '${bloc.password}');

    if (code.code == '1') {
      final prefs = Preferences();
      prefs.idUser = '1';
      final bottomBloc = ProviderBloc.bottomNavigator(context);
      bottomBloc.changePage(0);
      Navigator.pushReplacementNamed(context, 'homePage');
    } else if (code.code == '2') {
      showToast2('${code.message}', Colors.red);
    } else if (code.code == '3') {
      showToast2('${code.message}', Colors.red);
    } else {
      showToast2('Hubo un error', Colors.red);
    }
  }

  Widget _cargando(BuildContext context, LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.cargando,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return Container(
          child: snapshot.hasData
              ? (snapshot.data == true)
                  ? _mostrarAlert()
                  : null
              : null,
        );
      },
    );
  }

  Widget _mostrarAlert() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromRGBO(0, 0, 0, 0.5),
      child: Center(
        child: (Platform.isAndroid) ? CircularProgressIndicator() : CupertinoActivityIndicator(),
      ),
    );
  }
}
