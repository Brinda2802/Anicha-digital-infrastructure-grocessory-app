import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:untitled/otp%20page.dart';
import 'package:untitled/profile.dart';




class cartpage extends StatefulWidget {



  @override
  State<cartpage> createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
  TextEditingController phonenumber = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zipcode = TextEditingController();
  TextEditingController product= TextEditingController();
  String pin = "";
  int a = 0;
  int b = 0;
  bool _isChecked = false;

  void _handleCheckbox(bool newValue) {
    setState(() {
      _isChecked = newValue;
    });
  }


  List<String> indianStates = [
    'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh',
    'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand',
    'Karnataka', 'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur',
    'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab',
    'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Telangana', 'Tripura',
    'Uttar Pradesh', 'Uttarakhand', 'West Bengal'
  ];

  final TextEditingController Controller = TextEditingController();
  final GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> addressOptions = [
    '123 Main Street',
    '456 Elm Avenue',
    '789 Oak Drive',
    '101 Pine Road',
    // Add more address options here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff00A36C),
        centerTitle: true,
        elevation: 20,
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
        title: Row(
          children: [
            //Icon(Icons.arrow_back_ios_new_outlined,size: 30,color: Colors.black,),
            Text("Add to Cart", style: GoogleFonts.deliusSwashCaps(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),),
           Padding(
              padding: const EdgeInsets.only(left: 90.0),
              child:
              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(35),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>profile())
                    );
                  },
                  child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Icon(
                        CupertinoIcons.cart_fill_badge_plus, size: 23, color: Colors.white,)),
                ),
              ),
            )
           /* Image.asset("assets/cart2.png"),*/
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20
              ),
              child: Text(
                "Fullname(First & Lastname)", style: GoogleFonts.openSans(
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
                      color: Colors.black,
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
                      controller: name,
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Icon(CupertinoIcons.person, size: 20,),
                        hintText: "Enter your Fullname",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20
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
                      color: Colors.black,
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
                        color: Colors.black,
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
              padding: const EdgeInsets.only(left: 20.0, top: 20
              ),
              child: Text("Address", style: GoogleFonts.openSans(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 10),
              child: Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  // Adjust the padding to your preference
                  child: Center(
                    child: AutoCompleteTextField<String>(
                      key: key,
                      controller: address,
                      clearOnSubmit: false,
                      suggestions: addressOptions,
                      itemFilter: (item, query) {
                        return item.toLowerCase().contains(query.toLowerCase());
                      },
                      itemSorter: (a, b) {
                        return a.compareTo(b);
                      },
                      itemSubmitted: (item) {
                        setState(() {
                          Controller.text = item;
                        });
                      },
                      itemBuilder: (context, item) {
                        return ListTile(
                          title: Text(item),
                        );
                      },
                      // Customized decoration to remove the underline
                      style: TextStyle(

                          fontSize: 16),
                      // You can set other style properties as well
                      decoration: InputDecoration(
                        suffixIcon: Icon(CupertinoIcons.house_alt),
                        hintText: 'Enter Address',
                        border: InputBorder.none, // This removes the underline
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20
              ),
              child: Text("City", style: GoogleFonts.openSans(
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
                      color: Colors.black,
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
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.location_city, size: 20,),
                        hintText: "City name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, top: 20
                        ),
                        child: Text("State", style: GoogleFonts.openSans(
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
                                color: Colors.black,
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
                                controller: state,
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    CupertinoIcons.location_solid, size: 20,),
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
                        padding: const EdgeInsets.only(left: 20.0, top: 20
                        ),
                        child: Text("Zip code", style: GoogleFonts.openSans(
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
                                color: Colors.black,
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
                                controller: zipcode,
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.merge_type, size: 20,),
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
              padding: const EdgeInsets.only(left: 20.0, top: 20
              ),
              child: Text("Phone number", style: GoogleFonts.openSans(
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
                      color: Colors.black,
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
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.phone),
                        hintText: "Enter your phone number",
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 240.0, top: 20),
              child: OutlinedButton(onPressed: () {

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>
                        otppage(phonenumber: phonenumber.text,
                            name: name.text,
                            address: address.text,
                            city: city.text,
                            state: state.text,
                            zipcode: zipcode.text,
                        product: product.text,))
                );
              }, child: Text("Enter otp")),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 20),
              child: Container(
                height: 1,
                width: 300,
                color: Colors.grey,
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _handleCheckbox(!_isChecked);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 20),
                    child: Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: Colors.yellow, // Yellow color
                        border: Border.all(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: _isChecked
                          ? Icon(
                        Icons.check,
                        color: Colors.black,
                      )
                          : null,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 20),
                    child: Text("Make this my default address.",
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 20),
              child: Container(
                height: 1,
                width: 300,
                color: Colors.grey,
              ),
            ),
           /* Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    a =0;
                    b =1;
                  });
                },
                child: a == 0 ?
                Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text("Add Address",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black))),
                ) : Container(),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

 /* createfunction() {
    print("address registered");
    FirebaseFirestore.instance.collection("profile").doc(
        FirebaseAuth.instance.currentUser!.uid).set({
      "name": name.text,
      "phonenumber": phonenumber.text,
      "address": address.text,
      "city": city.text,
      "state": state.text,
      "zipcode": zipcode.text,
    });
  }*/
}