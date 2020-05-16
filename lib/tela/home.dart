import 'package:app_atividade/service/http/service_usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'user_list.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App de Atividade com Flutter'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'images/flutter_logo.png',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            ButtonTheme(
              minWidth: double.maxFinite,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text(
                    'Lista de Usuários',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserList()),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
