import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert' show json, base64, ascii;
import 'dart:convert' show json, base64, ascii;
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }


  void snackBardata(BuildContext context, String actionMsg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        actionMsg,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ));
  }

  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
        title: "RETAIL WEB APP",
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
            bodyText1: GoogleFonts.oswald(textStyle: textTheme.bodyText1),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: LoginPage());
  }
}
