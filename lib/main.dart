import 'package:clinica_app/src/bloc/provider_bloc.dart';
import 'package:clinica_app/src/pages/inicio_page.dart';
import 'package:clinica_app/src/pages/login_page.dart';
import 'package:clinica_app/src/pages/splash.dart';
import 'package:clinica_app/src/prefences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new Preferences();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderBloc(
      child: MaterialApp(
          title: 'Clinica App',
          debugShowCheckedModeBanner: false,
          builder: (BuildContext context, Widget child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(textScaleFactor: data.textScaleFactor > 2.0 ? 1.2 : data.textScaleFactor),
              child: child,
            );
          },
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('es', 'ES'), // Spanish, no country code
            //const Locale('en', 'EN'), // English, no country code
          ],
          localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
            //print("change language");
            return locale;
          },
          initialRoute: 'splash',
          routes: {
            'splash': (BuildContext context) => Splash(),
            //'homePage': (BuildContext context) => HomePage(),
            'homePage': (BuildContext context) => InicioPage(),
            'login': (BuildContext context) => LoginPage(),
          }),
    );
  }
}
