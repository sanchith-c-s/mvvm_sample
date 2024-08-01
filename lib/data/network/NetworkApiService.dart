import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm_sample/data/app_exceptions.dart';
import 'package:mvvm_sample/data/network/BaseApiServices.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJSON;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
          responseJSON = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJSON;
  }
   @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJSON;
    try {
      Response response=await post(
        Uri.parse(url),
        body:data
      ).timeout(Duration(seconds: 10));
      responseJSON = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJSON;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJSON = jsonDecode(response.body);
        return responseJSON;
      case 400:
        throw BadResquestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default :
        throw FetchDataException('Error occured while communication with server'+'with status code'+response.statusCode.toString());
    }
  }
}
