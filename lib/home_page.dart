import 'package:flutter/material.dart';
import 'package:tugas_akhir_124210010/character_page.dart';
import 'package:tugas_akhir_124210010/profile_page.dart';
import 'currency_convert.dart';// Sesuaikan dengan lokasi file page_list_jobs.dart
import 'time_convert.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wizard World'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
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
                // TODO: Add navigation to the profile page
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                // TODO: Add navigation to the about page
                Navigator.pop(context); // Close the drawer
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
              'Get your wands ready!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke PageListJobs saat tombol ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageListCharacters()),
                );
              },
              child: Text('Chose a Character'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman konversi mata uang
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CurrencyConversionPage()),
                );
              },
              child: Text('Konversi Mata Uang'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman konversi waktu
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimeConversionPage()),
                );
              },
              child: Text('Konversi Waktu'),
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
