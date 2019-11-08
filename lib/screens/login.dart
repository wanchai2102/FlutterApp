import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/LoginModel.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();



  Future<dynamic> _loginUser(String username, String password) async {
    var reqLogin = LoginModel();
    /* set username password  in json model*/
    reqLogin.uUsername = username;
    reqLogin.uPassword = password;

    String jsonReq = loginModelToJson(reqLogin);
    //  print(jsonReq);
    var url = 'https://api.fasicare.com/api_app/account/login';
    var response = await http.post(url,
        body: jsonReq, headers: {"Content-Type": "application/json"});
  return response.body;
    // print(response.body);
    // print(response.statusCode.toString());
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Icon(
          Icons.supervised_user_circle,
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );

    final username = TextFormField(
      // keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      controller: _usernameController,
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      controller: _passwordController,
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          // print(_usernameController.text);
          // print(_passwordController.text);
          var res = await _loginUser(
              _usernameController.text, _passwordController.text);
          
           var item = json.decode(res);
           
           print(item);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Firstpage()),
          // );
        },
        padding: EdgeInsets.all(12),
        color: Colors.blue,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final backtext = FlatButton(
      child: Text(
        'click in login to goto first screen!',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            // Text('happy birthday login),
            logo,
            SizedBox(height: 48.0),
            username,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            backtext
          ],
        ),
      ),
    );
  }
}

void odlogin(String username, String password) {
  print(username);
}
