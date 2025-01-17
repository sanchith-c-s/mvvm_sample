
import 'package:mvvm_sample/data/network/BaseApiServices.dart';
import 'package:mvvm_sample/data/network/NetworkApiService.dart';
import 'package:mvvm_sample/res/app_url.dart';

class AuthRepository{
  BaseApiServices _apiServices=NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async{

    try{
      dynamic response =await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async{

    try{
      dynamic response =await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}