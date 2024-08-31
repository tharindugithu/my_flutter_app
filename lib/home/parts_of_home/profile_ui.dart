import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/model/User.dart';

class ProfileUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black), 
        ),
        centerTitle: true,
        backgroundColor: Colors.white, 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.asset(
            //   'assets/img/sis.png',
            //   width: 120,
            //   height: 120,
            //   fit: BoxFit.cover,
            // ),
            SizedBox(height: 20),
            Text(
              'Laksisi', 
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'tharindu@gmail.com', 
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                
                _editProfile(context);
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }

  void _editProfile(BuildContext context) {
   
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Text('edit your profile.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () {
                
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}