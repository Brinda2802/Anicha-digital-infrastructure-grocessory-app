import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:top_notch_bottom_bar/top_notch_bottom_bar.dart';
import 'package:untitled/cartpage.dart';
import 'package:untitled/products.dart';

import 'morepages.dart';

class productdescription extends StatefulWidget {
  //const productdescription({super.key});
  String docid;
  productdescription(this.docid);

  @override
  State<productdescription> createState() => _productdescriptionState();
}

class _productdescriptionState extends State<productdescription> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    }

  decrementcounter(){
    setState(() {
      _counter--;
    });
  }


  int mycurrentindex=0;

  int a=0;
  int b=0;
  sum(){
    a=a++;
    print("a");
  }

  @override

  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return
      /*index==0?Scaffold(
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
    ):index==1? Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff00A36C),
        centerTitle: true,
        elevation: 10,
        shadowColor: Color(0xff00A36C),
        shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            )
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child:SizedBox(),
          /*CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(CupertinoIcons.cart_badge_plus,size: 20,color: Colors.black,),

          ),*/
        ),
        title: Row(
          children: [
            //Icon(Icons.arrow_back_ios_new_outlined,size: 30,color: Colors.black,),
            Text("Products",style: GoogleFonts.deliusSwashCaps(
              fontSize: 25 ,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),)
          ],
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("anichaproducts").snapshots(),
          builder: (context,snap) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 40),
                          child: Text(
                            "Fruits & Vegetables", style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ],
                    ),
                    CarouselSlider(
                      items: [
                        Image.asset('assets/slideshow1.jpg'),
                        Image.asset('assets/slideshow2.jpg'),
                        Image.asset('assets/slideshow3.jpg'),
                        Image.asset('assets/slideshow9.jpg'),
                        Image.asset('assets/slideshow4.jpg'),
                        Image.asset('assets/slideshow5.jpg'),
                        //Image.asset('assets/slideshow8.jpg'),

                        /* //AppBar(
                             title: Text("products"),
                           )*/ // Add more items as needed
                      ],
                      options: CarouselOptions(
                          aspectRatio: 16 / 10,
                          // Set the aspect ratio of the items
                          autoPlay: true,
                          autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                          autoPlayAnimationDuration: Duration(milliseconds: 500),
                          autoPlayInterval: Duration(seconds: 3),
                          // Enable auto-play
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              mycurrentindex = index;
                            });
                          }
                      ), // Enlarge the center item
                    ),
                    AnimatedSmoothIndicator(
                      activeIndex: mycurrentindex, count: myitems.length,
                      effect: WormEffect(
                        dotWidth: 10,
                        dotHeight: 10,
                        spacing: 8,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20),
                          child: Text("Vegetables", style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 170.0,
                              top: 20),
                          child: Text("More",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.green,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 12.0,
                            mainAxisExtent: 280,
                            crossAxisCount: 2,
                          ),
                          shrinkWrap: true,
                          itemCount: snap.data!.docs.length,
                          itemBuilder: (context,index){
                            return Material(
                              elevation: 3,
                              shadowColor: Colors.grey,
                              borderRadius: BorderRadius.circular(12),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>productdescription(snap.data!.docs[index].id)),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Image.network(snap.data!.docs[index]["image"]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0,left: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.star,color: Colors.yellow,size: 18,),
                                            Icon(Icons.star,color: Colors.yellow,size: 18,),
                                            Icon(Icons.star,color: Colors.yellow,size: 18,),
                                            Icon(Icons.star,color: Colors.yellow,size: 18,),
                                            Icon(Icons.star,color: Colors.yellow,size: 18,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 23),
                                              child: Container(
                                                height:20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                    color: Colors.black12,
                                                    borderRadius: BorderRadius.circular(15)
                                                ),
                                                child: Icon(Icons.favorite_outlined,size: 13,color: Colors.pink,),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15.0,left: 10),
                                        child: Text(snap.data!.docs[index]["name"],style: GoogleFonts.openSans(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 50.0,top: 10),
                                        child: Text(snap.data!.docs[index]["price"],style: GoogleFonts.openSans(
                                          color: Colors.green,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 50.0,top: 6),
                                        child: Text(snap.data!.docs[index]["sprice"], style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          color: Colors.black38,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold,
                                        ),),),
                                    ],
                                  ),

                                ),
                              ),
                            );
                          }
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top:height/40.12,bottom: 10),
                      child: Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(15),
                        shadowColor: CupertinoColors.systemGreen,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>morepage())
                            );
                          },
                          child:
                          Container(
                            height:height/15.12,
                            width:width/2,
                            decoration: BoxDecoration(
                              color: Color(0xff000000),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: width/20.5),
                                  child: Text("Next",style: GoogleFonts.raleway(
                                    color: Colors.white,
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width/5.4),
                                  child: Icon(CupertinoIcons.arrow_right,color: Colors.white,size: 25,),
                                )
                              ],
                            ),),
                        ),
                      ),
                    )
                  ]
              ),
            );
          }
      ),
    ):index==2?*/
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffAFE1AF),
        centerTitle: true,
        elevation: 10,
        shadowColor: Color(0xff00A36C),
        shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child:SizedBox(),
          /*CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(CupertinoIcons.cart_badge_plus,size: 20,color: Colors.black,),

          ),*/
        ),
        title: Row(
          children: [
            //Icon(Icons.arrow_back_ios_new_outlined,size: 30,color: Colors.black,),
            Text("Fruits & Vegetables",style: GoogleFonts.deliusSwashCaps(
              fontSize: 25 ,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),)
          ],
        ),
      ),
      body:
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection("anichaproducts").doc(widget.docid).get(),
          builder: (context,snap) {
            Map<String,dynamic>? doc=snap.data!.data();
           /* return
              ListView.builder(
            shrinkWrap: true,
              itemCount: snap.data!.docs.length,
              itemBuilder: (context,index){*/
              return
                Column(
                children: [
                  Stack(
                    children: [
                      Container(
                          height: 280,
                          width:360,
                          decoration: BoxDecoration(
                            color: Color(0xffAFE1AF),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),  // Adjust the radius for the top-left corner
                              bottomLeft: Radius.circular(200.0),  // Adjust the radius for the bottom-left corner
                            ),
                          )
                      ),
                      Image.network(doc!["image"]),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(doc!["name"],style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,top: 20),
                        child: Column(
                          children: [
                            Text(doc!["price"],style: GoogleFonts.openSans(
                              color: Colors.green,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(doc!["sprice"],style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w300,
                              ),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child:
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star,color: Colors.yellow,size: 13,),
                            Icon(Icons.star,color: Colors.yellow,size: 13,),
                            Icon(Icons.star,color: Colors.yellow,size: 13,),
                            Icon(Icons.star,color: Colors.yellow,size: 13,),
                            Icon(Icons.star,color: Colors.yellow,size: 13,),
                          ],
                        ),
                        Text("(4.5(2,495reviews)",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.black),),
                      ],
                    ),

                  ),
                 /*  Padding(
                     padding: const EdgeInsets.only(top: 30.0),
                     child: Text(doc!["description"],style: GoogleFonts.openSans(
            color: Colors.grey,
            fontSize: 13.0,
            fontWeight: FontWeight.w500,
            ),),*/
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: ReadMoreText(doc!["description"],
                   style:GoogleFonts.openSans(
                   color: Colors.grey,
            fontSize: 13.0,
            fontWeight: FontWeight.w500,
            ),
                   trimLines: 2,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.red),
            ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(right: 250.0,top: 10),
                   child: Text("Quantity",style: GoogleFonts.poppins(fontSize: 15,color: Colors.black,
                     fontWeight: FontWeight.w600
                   ),),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(right: 185.0,top: 10),
                   child: Container(
                     height: 50,
                     width: 130,
                     decoration: BoxDecoration(
                       border: Border.all(color: Colors.grey),
                       borderRadius: BorderRadius.circular(10),

                     ), child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         GestureDetector(
                           onTap: (){
                             _incrementCounter();

                   },
                             child: Icon(CupertinoIcons.plus,size: 30,color: Colors.black,)),
                         Text("$_counter",style:TextStyle(fontSize: 30,color: Colors.black,),),
                         GestureDetector(
                           onTap: (){
                             decrementcounter();
                           },
                             child: Icon(CupertinoIcons.minus,size: 30,color: Colors.black,)),
                       ],
                     ),

                   ),
                 ),
                 // Text(doc!["about this item"]),

                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: OutlinedButton(onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>cartpage())
                            );

                          }, child: Center(
                            child: Row(
                              children: [
                                Text("Add Cart", style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Icon(CupertinoIcons.cart_badge_plus,
                                    color: Colors.black, size: 20,),
                                )
                              ],
                            ),
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                              color: Color(0xff000000),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child:
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: [
                                    Text("Buy Now", style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Icon(
                                        Icons.shop_two_sharp, color: Colors.white,
                                        size: 20,),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              );
              }
              ),
      ),
      );
  }
}
