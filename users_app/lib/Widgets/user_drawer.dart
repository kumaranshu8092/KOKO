import 'package:flutter/material.dart';
import 'package:users_app/global/global.dart';
import 'package:users_app/main_screens/home_screen.dart';
import 'package:users_app/main_screens/my_orders_screen.dart';

import '../auth/auth_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: Column(
              children: [
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(80)),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            sharedPreferences!.getString("photoUrl")!),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  sharedPreferences!.getString("name")!,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 20, fontFamily: "Train"),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 1.0),
            child: Column(
              children: [
                const Divider(
                  height: 10,
                  color: Colors.brown,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.black),
                  title: const Text(
                    "Home",
                    style: TextStyle(color: Colors.brown),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => const HomeScreen(),
                      ),
                    );
                  },
                ),
                const Divider(
                  height: 10,
                  color: Colors.brown,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.reorder, color: Colors.black),
                  title: const Text(
                    "My Orders",
                    style: TextStyle(color: Colors.brown),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) =>  MyOrdersScreen(),
                      ),
                    );
                  },
                ),
                const Divider(
                  height: 10,
                  color: Colors.brown,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.access_time, color: Colors.black),
                  title: const Text(
                    "History",
                    style: TextStyle(color: Colors.brown),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  color: Colors.brown,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.search, color: Colors.black),
                  title: const Text(
                    "Search",
                    style: TextStyle(color: Colors.brown),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  color: Colors.brown,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app, color: Colors.black),
                  title: const Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.brown),
                  ),
                  onTap: () {
                    firebaseAuth.signOut().then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => const AuthScreen()));
                    });
                  },
                ),
                const Divider(
                  height: 10,
                  color: Colors.brown,
                  thickness: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
