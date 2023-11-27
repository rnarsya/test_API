import 'package:flutter/material.dart';

class TimeConversionPage extends StatefulWidget {
  const TimeConversionPage({Key? key}) : super(key: key);

  @override
  _TimeConversionPageState createState() => _TimeConversionPageState();
}

class _TimeConversionPageState extends State<TimeConversionPage> {
  DateTime _currentTime = DateTime.now();

  String _formatTime(DateTime time, String timeZone) {
    return "${time.toLocal()} ($timeZone)";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Conversion'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Waktu Sekarang:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _formatTime(_currentTime, 'WIB'),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              _formatTime(_currentTime, 'WITA'),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              _formatTime(_currentTime, 'WIT'),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              _formatTime(_currentTime.toUtc(), 'London GMT'),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentTime = DateTime.now();
                });
              },
              child: Text('Refresh Waktu'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: TimeConversionPage(),
    ),
  );
}
