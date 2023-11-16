
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class mobilenumber extends StatefulWidget {
  const mobilenumber({super.key});

  @override
  State<mobilenumber> createState() => _mobilenumberState();
}

class _mobilenumberState extends State<mobilenumber> {
  TextEditingController mobilenumber=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(child: Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Text("Enter your phone number:"),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child:
            Container(
              height: 50,
              width: 160,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  )
              ),
              child:  TextField(
                controller: mobilenumber,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 15,
                ),),
            ),
          ),
          ElevatedButton(
              onPressed: ()
              {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>second(mobilenumber.text)
                  ),
                );
              },
              child: Text("send a OTP")),
        ],
      ),
    );
  }
}
class second extends StatefulWidget {
  String mobilenumber;
  second(this.mobilenumber);
  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  TextEditingController otp=new TextEditingController();
  var _verificationCode;

  _verifyphone()async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${widget.mobilenumber}" ,
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
  @override
  void initState() {
    _verifyphone();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child:
            Center(
              child: Container(
                height: 50,
                width: 160,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    )
                ),
                child:  TextField(
                  controller: otp,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 15,
                  ),),
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            FirebaseAuth.instance.signInWithCredential(
                PhoneAuthProvider.credential(
                    verificationId:_verificationCode ,
                    smsCode: otp.text)).then((value){
              if(value.user!=null){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>animated()));
              }
              else{
                print("the otp is invalied");
              }
              print("registered");
            });
          }, child: Text("verfiy")),
        ],
      ),
    );
  }
}
class animated extends StatefulWidget {
  const animated({super.key});

  @override
  State<animated> createState() => _animatedState();
}
class _animatedState extends State<animated> {
  double h=0;
  double w=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap:  doAnimated(),
          child: AnimatedContainer(
            color: Colors.blue,
            duration: Duration(
                seconds: 5),
            curve: Curves.bounceIn,
            height: h,
            width: w,
          ),
        ),
      ),
    );
  }
  doAnimated(){
    setState(() {
      h=h==50?200:50;
      w=w==50?200:50;
      Color color=Color(0xff21D4B4);
    });
  }
}


/* @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: Center(
    child: Text("Home",style:TextStyle(
fontSize: 30,
fontWeight: FontWeight.w600,
color: Colors.pink,
),),
),
);*/






