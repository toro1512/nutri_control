import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';


class AuthService extends ChangeNotifier{

final String _baseUrl ='identitytoolkit.googleapis.com';
final String _firebaseToken ='AIzaSyCU-Mbu4-s4EF8JD6g8ke_XMznSq4GIsS4';

final storage = const FlutterSecureStorage();




  Future<String?> createrUser (String email, String password) async{

    final Map<String, dynamic> authData={
        'email': email,
        'password': password,
        'returnSecureToken': true,
    };
    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key': _firebaseToken });
    
    final resp = await http.post(url , body: json.encode(authData)); 
    final Map <String , dynamic> decodeResp = jsonDecode(resp.body); 
     
    if(decodeResp.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodeResp['idToken']);
    }
    else{
      return decodeResp['error']['message'];}
   }


 Future<String?> login (String email, String password) async{

    final Map<String, dynamic> authData={
        'email': email,
        'password': password,
        'returnSecureToken': true,
    };
    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken });
    
    final resp = await http.post(url , body: json.encode(authData)); 
    final Map <String , dynamic> decodeResp = jsonDecode(resp.body); 
     
    if(decodeResp.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodeResp['idToken']);
    }
    else{
      return decodeResp['error']['message'];}
   }
   
 Future logout() async{
 
  await storage.delete(key: 'token');
 
 }
Future<String> readToken() async {

return await storage.read(key: 'token') ?? ''; 

}

}
