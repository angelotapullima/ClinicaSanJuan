import 'package:clinica_app/src/bloc/bottom_navigator_bloc.dart';
import 'package:clinica_app/src/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class ProviderBloc extends InheritedWidget {
  static ProviderBloc _instancia;

  factory ProviderBloc({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new ProviderBloc._internal(key: key, child: child);
    }

    return _instancia;
  }
  final loginBloc = LoginBloc();
  final bottomNavigatorBloc = BottomNaviBloc();

  ProviderBloc._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>()).loginBloc;
  }

  static BottomNaviBloc bottomNavigator(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>()).bottomNavigatorBloc;
  }
}
