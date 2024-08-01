
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_sample/respository/auth_repository.dart';
import 'package:mvvm_sample/utils/utils.dart';

class AuthViewModel  with ChangeNotifier{

  final _myRepo= AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext) async{
    _myRepo.loginApi(data).then((value){
      if(kDebugMode){
        print(value.toString());
      }
     
    }).onError((error, stackTrace){
       if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), BuildContext);
        print(error.toString());
      }
    });
  }
}