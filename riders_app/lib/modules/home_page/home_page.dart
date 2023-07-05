import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:riders_app/services/user_db.dart';
import 'package:riders_app/shared/widget/auth_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture:
                  Image.network(UserDatabase.instance.getImageUrl),
              accountName: Text("${UserDatabase.instance.getUserName}"),
              accountEmail: Text("${UserDatabase.instance.getEmail}"),
            ),
            ListTile(
              style: ListTileStyle.drawer,
              onTap: () {},
              title: Text("Home"),
              trailing: Icon(Icons.home),
            ),
            ListTile(
              style: ListTileStyle.drawer,
              onTap: () {},
              title: Text("Home"),
              trailing: Icon(Icons.home),
            ),
            ListTile(
              style: ListTileStyle.drawer,
              onTap: () {},
              title: Text("Home"),
              trailing: Icon(Icons.home),
            ),
            ListTile(
              style: ListTileStyle.drawer,
              onTap: () async {
                await FirebaseAuth.instance.signOut().then((value) {
                  UserDatabase.instance.resetAllInfo().then((value) {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return AuthView();
                      },
                    ));
                  });
                });
              },
              title: Text("Logout"),
              trailing: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            // CircleAvatar(
            //   backgroundImage: NetworkImage(UserDatabase.instance.getImageUrl),
            // ),
            SizedBox(
              width: 8,
            ),
            Text('Welcome back , ${UserDatabase.instance.getUserName}')
          ],
        ),
      ),
    );
  }
}
