import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animated_splash/flutter_animated_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/cartpage.dart';
import 'package:untitled/homescreen.dart';
import 'package:untitled/otp%20page.dart';
import 'package:untitled/product%20description%20page.dart';
import 'package:untitled/products.dart';
import 'package:untitled/profile.dart';
import 'examplepage.dart';
import 'firebase_options.dart';
import 'firstpage.dart';
import 'loginscreen.dart';
import 'morepages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Landingpage(),
    );
  }
}
class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  State<Landingpage> createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:FutureBuilder(
        future: FirebaseFirestore.instance.collection("login").doc("qnLuD82f3wpy0etj4Qhe").get(),
    builder: (context,snap) {
          if(snap.connectionState ==ConnectionState.done){
           return loginscreen() ;
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
    ),
      );


  }
}
/* return
        Column(
          children: [
            Container(
              height: height / 1,
              width: width / 1,
              child: AnimatedSplash(
                type: Transition.rightToLeftWithFade,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height / 3.78),
                      child: Image.asset("assets/camp.jpg"),
                    ),
                    RichText(
                      text: TextSpan(
                        /*  style: DefaultTextStyle.of(context).style,*/
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Anicha',
                            style: GoogleFonts.sail(
                              color: Colors.black,
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text("Products...", style: GoogleFonts.sail(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
                backgroundColor: Colors.white,
                navigator: Firstpage(),
                durationInSeconds: 5,
              ),
            ),
          ],
        );*/


