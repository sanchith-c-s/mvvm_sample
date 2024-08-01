
class AppException implements Exception{

  final _message;
  final _prefix;
  AppException([this._message,this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException{
  FetchDataException([String? message]) : super(message,'Error during communication');
}

class BadResquestException extends AppException{
  BadResquestException([String? message]) : super(message,'Invalid Resquest');
}

class UnauthorisedException extends AppException{
  UnauthorisedException([String? message]) : super(message,'Unauthorised Resquest');
}

class InvalidInputException extends AppException{
  InvalidInputException([String? message]) : super(message,'invalid input ');
}

