import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homescreen.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  static Future<User?> loginusingEmailPassword({
    required String email, required String password, required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }
    return user;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.green.shade600, Colors.green.shade900],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        icon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        icon: Icon(Icons.lock),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text("Forgot Password?", style: GoogleFonts.aBeeZee(
                        fontSize: 15,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: ()
                      async{
                       User? user = await loginusingEmailPassword(email: email.text, password: password.text, context: context);
                       print(user);
                       if(user!= null){
                         Navigator.of(context).push(
                           MaterialPageRoute(builder: (context)=> homescreen())
                         );// Add your login logic here
                       }
                       Navigator.of(context).push(
                           MaterialPageRoute(builder: (context)=> homescreen())
                       );
                      },
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}