import 'package:clinica_app/src/bloc/validators.dart';
import 'package:clinica_app/src/models/login_model.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _usuarioController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _cargandoLoginController = new BehaviorSubject<bool>();

  //Recuperaer los datos del Stream
  Stream<String> get usuarioStream => _usuarioController.stream.transform(validarUsuario);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);
  Stream<bool> get cargando => _cargandoLoginController.stream;

  Stream<bool> get formValidStream => Rx.combineLatest2(usuarioStream, passwordStream, (e, p) => true);

  //inserta valores al Stream
  Function(String) get changeUsuario => _usuarioController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(bool) get changeCargando => _cargandoLoginController.sink.add;

  //obtener el ultimo valor ingresado a los stream
  String get usuario => _usuarioController.value;
  String get password => _passwordController.value;

  dispose() {
    _usuarioController?.close();
    _passwordController?.close();
    _cargandoLoginController?.close();
  }

  void cargandoFalse() {
    _cargandoLoginController.sink.add(false);
  }

  Future<LoginModel> login(String user, String pass) async {
    _cargandoLoginController.sink.add(true);
    final LoginModel resp = LoginModel();
    if (user == 'admin' && pass == '1234') {
      resp.code = '1';
      resp.message = 'Datos correctos';
    } else {
      resp.code = '2';
      resp.message = 'Datos incorrectos';
    }
    _cargandoLoginController.sink.add(false);

    return resp;
  }
}
