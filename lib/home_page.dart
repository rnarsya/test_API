import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir_124210010/character_page.dart';
import 'package:tugas_akhir_124210010/profile_page.dart';
import 'about.dart';
import 'currency_convert.dart';
import 'time_convert.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Function to show the logout confirmation dialog
  Future<void> _showLogoutDialog(BuildContext context) async {
    SharedPreferences logindata = await SharedPreferences.getInstance();

    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button for close
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await logindata.setBool("login", false); // Set to false for logout
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wizard World'),
        backgroundColor: Colors.red.shade200,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red.shade300,
              ),
              child: Text(
                'Wizard World',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => About(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Let's Explore!",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/SortingHat.jpg'), // Add your image path
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    'Choose a Character',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageListCharacters()),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/HP.jpg'), // Add your image path
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    ListTile(
                      title: Text(
                        'Features',
                        style: TextStyle(color: Colors.white), // Tambahkan warna putih di sini
                      ),
                      trailing: DropdownButton<String>(
                        icon: Icon(Icons.arrow_drop_down),
                        dropdownColor: Colors.white, // Set the dropdown menu background color
                        onChanged: (String? value) {
                          if (value == 'Konversi Mata Uang') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CurrencyConversionPage(),
                              ),
                            );
                          } else if (value == 'Konversi Waktu') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TimeConversionPage(),
                              ),
                            );
                          }
                        },
                        items: <String>['Konversi Mata Uang', 'Konversi Waktu']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        style: TextStyle(color: Colors.black), // Dropdown text color
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
