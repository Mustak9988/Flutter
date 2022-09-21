import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final url = "https://www.ioradix.com/ielts_files/ielts_image/motivation.png";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurple,
      child: ListView(
        children: [
          DrawerHeader(
            //margin: EdgeInsets.all(80),
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text('Mostak Khan'),
              accountEmail: Text('khadem.mustak@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(url),
              ),
            ),
          ),
          // ListTile(
          //   leading: Icon(
          //     CupertinoIcons.home,
          //     color: Colors.white,
          //   ),
          //   title: Text("Home", style: TextStyle(color: Colors.white)),
          // ),
          // ListTile(
          //   leading: Icon(
          //     CupertinoIcons.profile_circled,
          //     color: Colors.white,
          //   ),
          //   title: Text("Profile", style: TextStyle(color: Colors.white)),
          // ),
          addItemsInDrawer(name: 'Home', icons: CupertinoIcons.home),

          addItemsInDrawer(
              name: 'Profile', icons: CupertinoIcons.profile_circled),

          addItemsInDrawer(name: 'Email me', icons: CupertinoIcons.mail),
          // ListTile(
          //   leading: Icon(
          //     CupertinoIcons.mail,
          //     color: Colors.white,
          //   ),
          //   title: Text("Email me", style: TextStyle(color: Colors.white)),
          // ),

//insteate list title consistantly, we can use in single method.
          addItemsInDrawer(name: 'Phone', icons: CupertinoIcons.phone),
          // ListTile(
          //   leading: Icon(
          //     CupertinoIcons.phone,
          //     color: Colors.white,
          //   ),
          //   title: Text("Phone", style: TextStyle(color: Colors.white)),
          //   onTap: () {
          //     print('Phone is pressed+= 01755058892');
          //   },
          // ),
        ],
      ),
    );
  }

  Widget addItemsInDrawer({String? name, IconData? icons}) {
    return ListTile(
      leading: Icon(
        icons,
        color: Colors.white,
      ),
      title: Text("$name", style: TextStyle(color: Colors.white)),
      onTap: () {
        switch (name) {
          case 'Home':
            print('$name is pressed.');
            break;

          case 'Profile':
            print('$name is pressed.');
            break;

          case 'Email me':
            print('$name is pressed.');
            break;

          case 'Phone':
            print('$name is pressed.');
            break;
        }
      },
    );
  }
}
