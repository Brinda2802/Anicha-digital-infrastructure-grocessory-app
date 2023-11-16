import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/products.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  final controller=PageController();
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return
      Scaffold(
      backgroundColor:  Color(0xff00A36C),
      body: Column(
        children: [
          SizedBox(
            height:height/1.047091,
            child: PageView(
              controller: controller,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xff7ad452), Color(0xff00A36C)],
                    ),
                  ),
                  child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top:height/15.12),
                          child: Lottie.asset("assets/cart.json"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:height/15.12),
                          child:
                          RichText(
                            text: TextSpan(
                              /*  style: DefaultTextStyle.of(context).style,*/
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Order ',
                                  style: GoogleFonts.deliusSwashCaps(
                                    color: Colors.black,
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'your....',
                                  style:GoogleFonts.deliusSwashCaps(
                                    color: Colors.black,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text("Favourite items !",style: GoogleFonts.deliusSwashCaps(
                          color: Colors.black,
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),),
                        Padding(
                          padding:  EdgeInsets.only(top:height/15.12),
                          child: Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(15),
                            shadowColor: CupertinoColors.systemGreen,
                            child: GestureDetector(
                              onTap: (){
                                print(height);
                                print(width);
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>productsviewpage())
                                );
                              },
                              child:
                              Container(
                                height:height/15.12,
                                width:width/3,
                                decoration: BoxDecoration(
                                  color: Color(0xff000000),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: width/22.5),
                                      child: Text("Next",style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: width/14.4),
                                      child: Icon(CupertinoIcons.arrow_right,color: Colors.white,size: 20,),
                                    )
                                  ],
                                ),),
                            ),
                          ),
                        )
                      ]
                  ),
                ),
                productsviewpage(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 2,
            effect: JumpingDotEffect(
              activeDotColor: Colors.black,
              dotColor:Colors.black26,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),
        ],
      ),
    );
  }
}
