import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  // logout user
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          // drawer header
         Column(
           children: [
             DrawerHeader(
                 child: Icon(Icons.favorite_rounded)),

             // home tile
             Padding(
               padding:  EdgeInsets.only(left: 25),
               child: ListTile(
                 leading: Icon(Icons.home),
                 title: Text("H O M E"),
                 onTap: () {
                   // this is already home screen, just pop drawer
                   Navigator.pop(context);
                 },
               ),
             ),

             // profile tile
             Padding(
               padding:  EdgeInsets.only(left: 25),
               child: ListTile(
                 leading: Icon(Icons.person),
                 title: Text("P R O F I L E"),
                 onTap: () {
                   // this is already home screen, just pop drawer
                   Navigator.pop(context);

                   //navigate to profile page
                   Navigator.pushNamed(context, "/profile_page");
                 },
               ),
             ),

             // user tile
             Padding(
               padding:  EdgeInsets.only(left: 25),
               child: ListTile(
                 leading: Icon(Icons.group),
                 title: Text("U S E R S"),
                 onTap: () {
                   // this is already home screen, just pop drawer
                   Navigator.pop(context);

                   //navigate to profile page
                   Navigator.pushNamed(context, "/users_page");

                 },
               ),
             ),

           ],
         ),

          // logout tile
          Padding(
            padding:  EdgeInsets.only(left: 25, bottom: 30),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("L O G O U T", style: TextStyle(fontWeight: FontWeight.bold),),
              onTap: () {
                // this is already home screen, just pop drawer
                Navigator.pop(context);

                //logout
                logout();
              },
            ),
          ),

        ],
      ),
    );
  }
}
