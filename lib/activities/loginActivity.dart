import 'package:flutter/material.dart';

class LoginActivity extends StatefulWidget {
  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var today = new DateTime.now();
    int date = today.day;
    int year = today.year;
    int month = today.month;

    return SafeArea(
      child: Scaffold(
        body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Restaurant Login',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '$date/$month/$year',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                // this is the username filed
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  width: 200.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextField(
                    controller: usernameController,
                    cursorColor: Colors.red,
                    //autofocus: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10.0),
                        hintText: 'username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))
                        // labelText: 'username',
                        //labelStyle: TextStyle(fontSize: 17.5),
                        ),
                    style: TextStyle(fontSize: 17.5),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                // this is the password field
                Container(
                  width: 200.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10.0),
                        hintText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )
                        // labelText: 'username',
                        //labelStyle: TextStyle(fontSize: 17.5),
                        ),
                    style: TextStyle(fontSize: 17.5),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  child: Text('login'),
                  onPressed: () {
                    validateLogin(
                        usernameController.text, passwordController.text);
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            )),
      ),
    );
  }

  void validateLogin(String textUsername, String textPassword) {
    if (textUsername == 'admin' && textPassword == 'admin') {
      print('login succeful');
      Navigator.pushNamed(context, '/home');
      // start the next activity i.e the gome activity
    } else {
      print('unsucdefull login');
      // clear the fields and dispply the error
    }
  }
}
