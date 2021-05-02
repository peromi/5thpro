import 'dart:convert';

import 'package:fifthproweb/utils/mycolors.dart';
import 'package:http/http.dart' as http;

class CallApi{
final String _url = "https://api5thpro.tarihost.com/api/";
// final String _url = "http://localhost:8000/api/";
  postData(data, url)async{
    final fullurl = Uri.parse( _url +url);
    return http.post(fullurl , body: json.encode(data), headers: _setHeader() );
  }


  _setHeader() => {
    'Content-type':'application/json',
    'Accept':'application/json'
  };
}