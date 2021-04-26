import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/controller/auth/auth.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Profile"),
        leading: SizedBox(),
        leadingWidth: 20,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your User Id",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              "${FirebaseAuth.instance.currentUser.uid}",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            //
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                userLogout(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Logout"),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.logout,
                  ),
                ],
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 20.0,
                  ),
                  //
                ),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.redAccent[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
