import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService extends ChangeNotifier{

  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _fireBaseToken = 'AIzaSyCg8lOa3HGkSMvHBPYnGRSvRC5mvdt4wjs';
  final storage = new FlutterSecureStorage();

  //Si retornamos algo es un error, de lo contrario, todo OK
  Future<String?> createUser(String email, String password) async {

    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key': _fireBaseToken
    });

    final response = await http.post(url, body: json.encode(  authData ));
    final Map<String, dynamic> decodedResponse = json.decode( response.body );

    if( decodedResponse.containsKey('idToken') ){
      await storage.write(key: 'token', value: decodedResponse['idToken']);
      return null;
    }else{
      return decodedResponse['error']['message'];
    }
  }

  Future<String?> login(String email, String password) async {

    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _fireBaseToken
    });

    final response = await http.post(url, body: json.encode(  authData ));
    final Map<String, dynamic> decodedResponse = json.decode( response.body );

    if( decodedResponse.containsKey('idToken') ){
      await storage.write(key: 'token', value: decodedResponse['idToken']);
      return null;
    }else{
      return decodedResponse['error']['message'];
    }
  }

  Future logout() async{
    await storage.delete(key: 'token');
    return;
  }

  Future<String> readToken() async{
    return await storage.read(key: 'token') ?? '';
  }

}