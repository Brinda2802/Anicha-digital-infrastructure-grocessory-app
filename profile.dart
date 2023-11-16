import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  TextEditingController name=TextEditingController();
  TextEditingController phonenumber=TextEditingController();
  TextEditingController otp=TextEditingController();
  TextEditingController city=TextEditingController();
  TextEditingController state=TextEditingController();
  TextEditingController zipcode=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController product=TextEditingController();


  String userid=FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
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
            Text("Profile",style: GoogleFonts.deliusSwashCaps(
              fontSize: 25 ,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),),

          ],
        ),
      ),
      body: FutureBuilder<dynamic>(
        future: FirebaseFirestore.instance.collection("Profile").doc("ba1hkosBCsNsR6rH6CdeUiaewQ33").get(),
        builder:(context,snapshot){
          var val=snapshot.data;
          name.text=val.get("name");
          phonenumber.text=val.get("phonenumber");
          address.text=val.get("address");
          city.text=val.get("city");
          state.text=val.get("state");
          zipcode.text=val.get("zipcode");
          product.text=val.get("product");
          return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 250,
                    width: 300,
                    child: Lottie.asset("assets/profile.json")),
              ),
              Padding(
                padding: const EdgeInsets.only(right:100.0,top:20
                ),
                child: Text("Fullname(First & Lastname):",style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Center(
                child:
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                    /* TextField(
                       style:GoogleFonts.openSans(
                       color: Colors.black,
                       fontSize: 15.0,
                       fontWeight: FontWeight.bold,
                       decoration: InputDecoration(
                         hintText: "Enter your Fullname",
                         border: InputBorder.none,
                       ),
                     ), ),
                     */
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                      // controller:name,
                        controller: name,
                        style: GoogleFonts.openSans(
                          color: Colors.black45,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Icon(CupertinoIcons.person,size: 20,),
                          hintText: "Enter your Fullname",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 210.0, top: 20
                ),
                child: Text(
                  "Product name", style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Center(
                child:
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                    /* TextField(
                   style:GoogleFonts.openSans(
                   color: Colors.black,
                   fontSize: 15.0,
                   fontWeight: FontWeight.bold,
                   decoration: InputDecoration(
                     hintText: "Enter your Fullname",
                     border: InputBorder.none,
                   ),
                 ), ),
                 */
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: product,
                        style: GoogleFonts.openSans(
                          color: Colors.black45,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.production_quantity_limits, size: 20,),
                          hintText: "Eg:chilly",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:200.0,top:20
                ),
                child: Text("Phone number",style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Center(
                child:
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                    /* TextField(
                       style:GoogleFonts.openSans(
                       color: Colors.black,
                       fontSize: 15.0,
                       fontWeight: FontWeight.bold,
                       decoration: InputDecoration(
                         hintText: "Enter your Fullname",
                         border: InputBorder.none,
                       ),
                     ), ),
                     */
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: phonenumber,
                        style: GoogleFonts.openSans(
                          color: Colors.black45,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.phone,size: 20,),
                          hintText: "Enter your phone number",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:250.0,top:20
                ),
                child: Text("Address",style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Center(
                child:
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                    /* TextField(
                       style:GoogleFonts.openSans(
                       color: Colors.black,
                       fontSize: 15.0,
                       fontWeight: FontWeight.bold,
                       decoration: InputDecoration(
                         hintText: "Enter your Fullname",
                         border: InputBorder.none,
                       ),
                     ), ),
                     */
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: address,
                        style: GoogleFonts.openSans(
                          color: Colors.black45,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Icon(CupertinoIcons.home,size: 20,),
                          hintText: "Enter your address",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:280.0,top:20
                ),
                child: Text("City",style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Center(
                child:
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                    /* TextField(
                       style:GoogleFonts.openSans(
                       color: Colors.black,
                       fontSize: 15.0,
                       fontWeight: FontWeight.bold,
                       decoration: InputDecoration(
                         hintText: "Enter your Fullname",
                         border: InputBorder.none,
                       ),
                     ), ),
                     */
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                         controller: city,
                        style: GoogleFonts.openSans(
                          color: Colors.black45,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.location_city,size: 20,),
                          hintText: "City name",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:5.0,top:20
                          ),
                          child: Text("State",style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        Center(
                          child:
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child:
                              /* TextField(
                       style:GoogleFonts.openSans(
                       color: Colors.black,
                       fontSize: 15.0,
                       fontWeight: FontWeight.bold,
                       decoration: InputDecoration(
                         hintText: "Enter your Fullname",
                         border: InputBorder.none,
                       ),
                     ), ),
                     */
                              Padding(
                                padding: const EdgeInsets.only(left: 11.0),
                                child: TextField(
                                  controller: state,
                                  style: GoogleFonts.openSans(
                                    color: Colors.black45,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(CupertinoIcons.location_solid,size: 20,),
                                    hintText: "State",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:10.0,top:20
                          ),
                          child: Text("Zip code",style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        Center(
                          child:
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child:
                              /* TextField(
                       style:GoogleFonts.openSans(
                       color: Colors.black,
                       fontSize: 15.0,
                       fontWeight: FontWeight.bold,
                       decoration: InputDecoration(
                         hintText: "Enter your Fullname",
                         border: InputBorder.none,
                       ),
                     ), ),
                     */
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: TextField(
                                  controller: zipcode,
                                  style: GoogleFonts.openSans(
                                    color: Colors.black45,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.merge_type,size: 20,),
                                    hintText: "Pincode",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Material(
                  elevation: 3,
                  shadowColor: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  child: GestureDetector(
                    onTap: (){
                      updatefunction();
                      print("updated");
                    },
                    child: Container(
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("Update",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white))),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 30),
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Color(0xff000000),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child:
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 60.0),
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
              ),
            ],
          ),
        );
        }
        ),
    );
  }
  updatefunction(){
    FirebaseFirestore.instance.collection("Profile").doc("ba1hkosBCsNsR6rH6CdeUiaewQ33").update({
      "name":name.text,
      "phonenumber":phonenumber.text,
      "address":address.text,
      "city":city.text,
      "state":state.text,
      "zipcode":zipcode.text,
      "product":product.text,
    });
  }
}
