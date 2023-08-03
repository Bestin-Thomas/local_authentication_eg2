import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
class LocalAuth{
  static final _auth=LocalAuthentication();

  static Future<bool>_canAuthenticate()async=>
      await _auth.canCheckBiometrics||await _auth.isDeviceSupported();

  static Future<bool> authenticate() async{
    try{
      if(!await _canAuthenticate()){return false;}
      else{
        return await _auth.authenticate(
          localizedReason: "Use Face Id to authenticate",
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ),
          authMessages: const[
            AndroidAuthMessages(
              signInTitle:"Sign In",
              cancelButton:"No Thanks"
            )
          ]
        );
      }
      }
      catch(e){
      debugPrint("erroe $e");
      return false;
    }
  }
}