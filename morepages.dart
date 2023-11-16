import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/moredescriptionpage.dart';
import 'package:untitled/product%20description%20page.dart';

class morepage extends StatefulWidget {
  const morepage({super.key});

  @override
  State<morepage> createState() => _morepageState();
}

class _morepageState extends State<morepage> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
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
            Text("Fruits",style: GoogleFonts.deliusSwashCaps(
              fontSize: 25 ,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),)
          ],
        ),
      ),
      body:StreamBuilder(
          stream: FirebaseFirestore.instance.collection("anichaproductsfruits").snapshots(),
          builder: (context,snap){
            return
              SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20),
                        child: Text("Fresh Fruits", style: GoogleFonts.poppins(
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
                    padding: const EdgeInsets.all(24),
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          mainAxisExtent: 310,
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
                                  MaterialPageRoute(builder: (context)=>fruitsdescriptionpage(snap.data!.docs[index].id))
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
                                      child: Text(snap.data!.docs[index]["sprice"],  style: TextStyle(
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
                          /*Container(
                                                   height: 50,
                                                   width: MediaQuery.of(context).size.width,
                                                   color: Colors.black12,
                                                  child: Column(
                                                      children: [
                                                    Container(
                                                      height:50,
                                                        width: 100,
                                                        child: Image.network(snap.data!.docs[index]["image"])),
                                                      ],
                                                    ),
                                                  );
*/
                        }

                    ),
                  ),

                ],
              ),
            );
          }
      ),
    );
  }
}
