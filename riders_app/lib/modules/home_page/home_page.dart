import 'package:flutter/material.dart';
import 'package:riders_app/services/user_db.dart';

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
              onTap: () {},
              title: Text("Home"),
              trailing: Icon(Icons.home),
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
