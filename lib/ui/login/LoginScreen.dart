import 'package:flutter/material.dart';
import 'package:modern_academy/ui/home/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class LoginScreenStateful extends StatefulWidget {
  @override
  _LoginScreenStatfulState createState() => _LoginScreenStatfulState();
}

class _LoginScreenStatfulState extends State<LoginScreenStateful> {
  Map<String, String> userMap = {
    "20000050": "pass1",
    "20000055": "pass2",
    "20000056": "pass3",
    "20000054": "pass4",
    "20000053": "pass5",
    "20000051": "pass6",
    "20000049": "pass7",
    "20000052": "pass8",
  };
  Map<String, String> onlineIds = {
    "20000050": "3QKxJbCLgHpy83et4oyP",
    "20000055": "8ZmMY95tsqD3MKkupFTU",
    "20000056": "ScHAUJLOUtxMNKouxw7V",
    "20000054": "StRGapYtxVemu3PgpKEo",
    "20000053": "aTWjk1rmaJYWxcMkErKW",
    "20000051": "ec2YpkPe5hVnAQpsO2rk",
    "20000049": "euihiSjzFq4Ja78olYyG",
    "20000052": "sYnCad26wo0YQDmgMVij",
  };

  var StudentIDController = TextEditingController();
  var passwordController = TextEditingController();
  var image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x2c3e50),
        body: Center(
            child: Container(
          decoration: BoxDecoration(
//                color: Colors.blueGrey,
              //image: DecorationImage(image: AssetImage('assets/img/modern.png'),fit: BoxFit.fitHeight)
              //color: Colors.white,
              ),
          height: 300,
          width: 400,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  controller: StudentIDController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.cyan, fontSize: 20),
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.supervised_user_circle,
                        color: Colors.cyan,
                      ),
                      labelText: "StudentID"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.cyan, fontSize: 20),
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.lock,
                        color: Colors.cyan,
                      ),
                      labelText: 'Password'),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: RaisedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 30),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () async {
                    String id = StudentIDController.text;
                    String pass = passwordController.text;

                    if (userMap.containsKey(id) && userMap[id] == pass) {
                      var sharedPreference =
                          await SharedPreferences.getInstance();
                      sharedPreference.setString("student_id", onlineIds[id]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreenStateful()),
                      );
                    } else {
                      Toast.show(
                          "There is something wrong at student id or password",
                          context,
                          duration: Toast.LENGTH_SHORT,
                          gravity: Toast.BOTTOM);
                    }
                  },
                  color: Colors.cyan,
                  textColor: Colors.black,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  splashColor: Colors.grey,
                ),
              )
            ],
          ),
        )));
  }
}
