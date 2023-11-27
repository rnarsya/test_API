import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tugas_akhir_124210010/home_page.dart';
import 'package:tugas_akhir_124210010/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wizarding World'),
        backgroundColor: Colors.red.shade200,
      ),
      body: ListView( // Mengganti SingleChildScrollView dengan ListView
        padding: const EdgeInsets.all(15.0),
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/topi.png',
                      height: 100.0,
                      width: 100.0,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Welcome",
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _username,
                    decoration: InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                OutlinedButton(
                  onPressed: () async {
                    String username = _username.text;
                    String password = _password.text;

                    // Save login information to Hive
                    await Hive.box<LoginModel>('LOGINBOX').put(
                      'user',
                      LoginModel(username: username, password: password),
                    );

                    // Save login information to Shared Preferences
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString('username', username);

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
