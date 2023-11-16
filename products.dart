import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:carousel_images/carousel_images.dart';
import 'package:lottie/lottie.dart';
import 'package:nimu_carousel/nimu_carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:top_notch_bottom_bar/top_notch_bottom_bar.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:untitled/morepages.dart';
import 'package:untitled/product%20description%20page.dart';
import 'package:top_notch_bottom_bar/top_notch_bottom_bar.dart';

class productsviewpage extends StatefulWidget {
  const productsviewpage({super.key});

  @override
  State<productsviewpage> createState() => _productsviewpageState();
}

class _productsviewpageState extends State<productsviewpage> {
  final controller = PageController();
  int mycurrentindex = 0;

  final myitems = [
    Image.asset('assets/slideshow3.jpg'),
    Image.asset('assets/slideshow2.jpg'),
    Image.asset('assets/slideshow1.jpg'),
    Image.asset('assets/slideshow4.jpg'),
    Image.asset('assets/slideshow5.jpg'),
    Image.asset('assets/slideshow6.jpg'),
    Image.asset('assets/slideshow7.jpg'),
    /* //AppBar(
               title: Text("products"),
             )*/ // Add more items as needed
  ];
  int index = 0;
  dynamic selected;
  var heart = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return


      Scaffold(
        drawer: Drawer(
          child: Center(child: Text("enter")),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff00A36C),
          centerTitle: true,
          elevation: 10,
          shadowColor: Color(0xff00A36C),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: SizedBox(),
            /*CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(CupertinoIcons.cart_badge_plus,size: 20,color: Colors.black,),

          ),*/
          ),
          actions: [
            Builder(builder: (context){
              return   Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: IconButton(onPressed:(){
                  Scaffold.of(context).openDrawer();
                }, icon: Icon(Icons.menu_sharp,color: Colors.black,size: 30,)),
              );
            }),
            Row(
              children:[
                //Icon(Icons.arrow_back_ios_new_outlined,size: 30,color: Colors.black,),
                Padding(
                  padding: const EdgeInsets.only(right:170.0),
                  child: Text("Products", style: GoogleFonts.deliusSwashCaps(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),),
                )
              ],
            ),

          ],



        ),
        body:
        StreamBuilder(
            stream: FirebaseFirestore.instance.collection("anichaproducts")
                .snapshots(),
            builder: (context, snap) {
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
                            autoPlayAnimationDuration: Duration(
                                milliseconds: 500),
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
                            child: Text(
                              "Vegetables", style: GoogleFonts.poppins(
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
                            itemBuilder: (context, index) {
                              return Material(
                                elevation: 3,
                                shadowColor: Colors.grey,
                                borderRadius: BorderRadius.circular(12),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) =>
                                          productdescription(
                                              snap.data!.docs[index].id)),
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
                                          padding: const EdgeInsets.only(
                                              top: 10),
                                          child: Image.network(
                                              snap.data!.docs[index]["image"]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, left: 10),
                                          child: Row(
                                            children: [
                                              Icon(Icons.star,
                                                color: Colors.yellow,
                                                size: 18,),
                                              Icon(Icons.star,
                                                color: Colors.yellow,
                                                size: 18,),
                                              Icon(Icons.star,
                                                color: Colors.yellow,
                                                size: 18,),
                                              Icon(Icons.star,
                                                color: Colors.yellow,
                                                size: 18,),
                                              Icon(Icons.star,
                                                color: Colors.yellow,
                                                size: 18,),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 23),
                                                child: Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black12,
                                                      borderRadius: BorderRadius
                                                          .circular(15)
                                                  ),
                                                  child: Icon(
                                                    Icons.favorite_outlined,
                                                    size: 13,
                                                    color: Colors.pink,),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0, left: 10),
                                          child: Text(
                                            snap.data!.docs[index]["name"],
                                            style: GoogleFonts.openSans(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 50.0, top: 10),
                                          child: Text(
                                            snap.data!.docs[index]["price"],
                                            style: GoogleFonts.openSans(
                                              color: Colors.green,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 50.0, top: 6),
                                          child: Text(
                                            snap.data!.docs[index]["sprice"],
                                            style: TextStyle(
                                              decoration: TextDecoration
                                                  .lineThrough,
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
                        padding: EdgeInsets.only(
                            top: height / 40.12, bottom: 10),
                        child: Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(15),
                          shadowColor: CupertinoColors.systemGreen,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => morepage())
                              );
                            },
                            child:
                            Container(
                              height: height / 15.12,
                              width: width / 2,
                              decoration: BoxDecoration(
                                color: Color(0xff000000),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: width / 20.5),
                                    child: Text(
                                      "Next", style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: width / 5.4),
                                    child: Icon(CupertinoIcons.arrow_right,
                                      color: Colors.white, size: 25,),
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
       /* bottomNavigationBar: TopNotchBottomBar(
            backgroundColor: Color(0xff00A36C),
            inActiveColor: Colors.black26,
            activeColor: Colors.white,
            iconSize: 25,
            height: 50,
            // changes the bottom bar height -> default = 50
            onTap: ((value) =>
                setState(() {
                  index = value;
                })),
            items: [
              TopNotchItem(icon: const Icon(Icons.home), name: 'Home'),
              TopNotchItem(
                  icon: const Icon(Icons.shopping_cart_checkout_rounded),
                  name: 'Messages'),
              TopNotchItem(icon: const Icon(Icons.logout), name: 'Settings'),
            ]),*/
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              heart = !heart;
            });
          },
          backgroundColor:Color(0xff00A36C),
          child: Icon(
            heart ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
            color: Color(0xffffffff),
          ),),
      );
  }
}