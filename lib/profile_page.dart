import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigasi kembali ke halaman utama (homepage)
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://pbs.twimg.com/media/F_pGvQrbEAAUgJO?format=jpg&name=small"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Praktikum Pemrograman Aplikasi Mobile",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "NIM: 124210010 & 124210018",
                      style: TextStyle(fontWeight: FontWeight.bold),

                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
