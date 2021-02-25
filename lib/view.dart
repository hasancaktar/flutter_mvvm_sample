import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodel.dart';

class View extends StatelessWidget {
  const View({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerim = Provider.of<ModelView>(context);
    return Scaffold(appBar: AppBar(title: Text("MVVM"),),
      body: 
         Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: "USERNAME"),
              controller: providerim.username,
            ),
            TextField(
              decoration: InputDecoration(hintText: "PASSWORD"),
              controller: providerim.password,
            ),
            RaisedButton(onPressed: providerim.login,
              child: providerim.state == 0
                  ? Text("login")
                  : providerim.state == 1
                      ? CircularProgressIndicator()
                      : providerim.state == 2
                          ? Icon(Icons.cancel)
                          : Icon(Icons.check),
            ),
          ],
        ),
      
    );
  }
}
