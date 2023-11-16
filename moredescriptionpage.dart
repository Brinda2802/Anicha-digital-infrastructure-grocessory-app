import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import 'cartpage.dart';

class fruitsdescriptionpage extends StatefulWidget {
  String docid;
  fruitsdescriptionpage(this.docid);


  @override
  State<fruitsdescriptionpage> createState() => _fruitsdescriptionpageState();
}

class _fruitsdescriptionpageState extends State<fruitsdescriptionpage> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text("Fruits",style: GoogleFonts.deliusSwashCaps(
              fontSize: 25 ,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),)
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
            future: FirebaseFirestore.instance.collection("anichaproductsfruits").doc(widget.docid).get(),
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
