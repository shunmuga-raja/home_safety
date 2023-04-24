import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_safety/child/bottom_page.dart';
import 'package:home_safety/db/share_pref.dart';
import 'package:home_safety/child/bottom_screens/child_home_page.dart';
import 'package:home_safety/child/child_login_screen.dart';
import 'package:home_safety/parent/parent_home_screen.dart';
import 'package:home_safety/util/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MySharedPrefference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.firaSansTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
      ),
      home:  FutureBuilder(
        future: MySharedPrefference.getUserType(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == "") {
            return LoginScreen();
          }
          if (snapshot.data == "child") {
            return BottomPage();
          }
          if (snapshot.data == "parent") {
            return ParentHomeScreen();
          }

          return progressIndicator(context);
        },
      ),
    );
  }
}

