import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/ui/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.push(context, CupertinoPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Drawer(
      backgroundColor: customColors?.black,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 10,),
          ListTile(
            title: Text(
              'Log out',
              style: TextStyle(color: customColors?.white),
            ),
            leading:  Icon(
              Icons.logout_outlined,
              color: customColors?.white,
            ),
            onTap: () async{
              await signOut();
            },
          ),
        ],
      ),
    );
  }
}
