import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:pinput/pinput.dart';
import 'package:untitled/cartpage.dart';
import 'package:untitled/profile.dart';

import 'examplepage.dart';

class otppage extends StatefulWidget {

  String? phonenumber;
  String? address;
  String? city;
  String? name;
  String? state;
  String? zipcode;
  String? product;
  otppage({this.phonenumber,this.address,this.city,this.name,this.state,this.zipcode,this.product});

  @override
  State<otppage> createState() => _otppageState();
}

class _otppageState extends State<otppage> {
  String pin = "";
  @override
  TextEditingController otp=new TextEditingController();
  var _verificationCode;

  _verifyphone()async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${widget.phonenumber}" ,
        verificationCompleted:(PhoneAuthCredential credential)async{
          await FirebaseAuth.instance.signInWithCredential(credential).then((value)async{
            if(value.user!=null){
              print("Valied Otp");
            }
          });
        },
        verificationFailed:(FirebaseAuthException e){
          print(e.message);
          print("Vaerification failed");
        } ,
        codeSent:(String ?verificationid ,int ?resendtoken ){
          setState(() {
            _verificationCode=verificationid;
          });
        },
        codeAutoRetrievalTimeout:( String verificationid){
          setState(() {
            _verificationCode=verificationid;
          });
        },timeout: Duration(seconds: 120) );
  }
  @ override
  void initState() {
    _verifyphone();
    // TODO: implement initState
    super.initState();
  }
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
              Text("OTP Verification",style: GoogleFonts.deliusSwashCaps(
                fontSize: 25 ,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),),

            ],
          ),
        ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 300,
                  width: 300,
                  child: Lottie.asset("assets/otp.json")),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 20.0,right: 140),
              child: Text("OTP Verification",style: GoogleFonts.delius(
                fontSize: 25 ,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),),
            ),
            Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Text("we will send you a one time password\non this 91+()",

          textAlign: TextAlign.center,
          style: GoogleFonts.delius(
        fontSize: 19 ,
        fontWeight: FontWeight.w600,
        color: Colors.black54,
        ),),
    ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,top: 20),
              child: PinCodeTextField(
                controller: otp,
                autofocus: true,
               // controller: TextEditingController(),
                pinBoxHeight: 50,
                pinBoxWidth: 50,
                maxLength: 6,
                defaultBorderColor: Colors.grey,
                highlightAnimationBeginColor: Colors.pink,// Define the length of the OTP
                onTextChanged: (text) {
                  pin = text;
                },
              ),
            ),
           /* ElevatedButton(onPressed: (){
              FirebaseAuth.instance.signInWithCredential(
                  PhoneAuthProvider.credential(
                      verificationId:_verificationCode ,
                      smsCode: otp.text)).then((value){
                if(value.user!=null){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>cartpage()));
                }
                else{
                  print("the otp is invalied");
                }
                print("registered");
              });

            }, child: Text('verify',style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w500,

            ),))*/
            ElevatedButton(onPressed: (){
              createfunction();
              print("entered");
              FirebaseAuth.instance.signInWithCredential(
                  PhoneAuthProvider.credential(
                      verificationId:_verificationCode ,
                      smsCode: otp.text)).then((value){
                if(value.user!=null){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>profile()));
                }
                else{
                  print("the otp is invalied");
                }
                print("registered");
              });
            }, child: Text("verfiy")),
          ],
        ),
      )

    );
  }
  createfunction(){
    print("address registered");
    FirebaseFirestore.instance.collection("Profile").doc(FirebaseAuth.instance.currentUser!.uid).set({
      "name":widget.name,
      "phonenumber":widget.phonenumber,
      "address":widget.address,
      "city":widget.city,
      "state":widget.state,
      "zipcode":widget.zipcode,
      "product":widget.product,
    });
  }
}
