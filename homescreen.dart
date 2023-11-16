import 'package:flutter/material.dart';
import 'package:flutter_animated_splash/flutter_animated_splash.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firstpage.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body:  Column(
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
      ),
    );
  }
}
