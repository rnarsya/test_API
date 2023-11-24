import 'package:flutter/material.dart';

class TimeConversionPage extends StatefulWidget {
  const TimeConversionPage({Key? key}) : super(key: key);

  @override
  _TimeConversionPageState createState() => _TimeConversionPageState();
}

class _TimeConversionPageState extends State<TimeConversionPage> {
  TextEditingController _hoursController = TextEditingController();
  double _result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Waktu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _hoursController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Masukkan Jam'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertTime,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text(
              'Hasil Konversi: $_result Menit',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  void _convertTime() {
    try {
      double hours = double.parse(_hoursController.text);
      double minutes = hours * 60;
      setState(() {
        _result = minutes;
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Masukkan jam dengan format yang benar'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: TimeConversionPage(),
  ));
}
