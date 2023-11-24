import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir_124210010/home_page.dart'; // Fixed the import statement

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;

  @override
  void initState() {
    super.initState();
    checkIfAlreadyLogin();
  }

  Future<void> checkIfAlreadyLogin() async {
    logindata = await SharedPreferences.getInstance();
    newuser = logindata.getBool("Login") ?? true;
    print(newuser);
    if (!newuser) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    }
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Preferences'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row( // Wrap the Icon and Text in a Row
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_search_rounded,
                    size: 100.0,
                    color: Colors.blue,
                  ),
                  Text(
                    "Login Dulu ya",
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
              SizedBox(height: 30),
              TextField(
                controller: _username,
                decoration: InputDecoration(labelText: "Username"),
              ),
              TextField(
                controller: _password,
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(height: 30),
              OutlinedButton(
                onPressed: () {
                  String username = _username.text;
                  String password = _password.text;
                  if (username == "maru" && password == "1234") {
                    logindata.setBool("Login", false);
                    logindata.setString("Username", username);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                  }
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
