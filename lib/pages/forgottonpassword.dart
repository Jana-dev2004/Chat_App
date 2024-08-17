import "package:chat_app/pages/signin.dart";
import "package:chat_app/pages/signup.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_cloud_firestore/firebase_cloud_firestore.dart";
import "package:flutter/material.dart";
class Forgottonpassword extends StatefulWidget {
  const Forgottonpassword({super.key});

  @override
  State<Forgottonpassword> createState() => _ForgottonpasswordState();
}

class _ForgottonpasswordState extends State<Forgottonpassword> {
  String email="";
  TextEditingController femail=TextEditingController();
  final _formkey = GlobalKey<FormState>();
  sendmail()async
  {
    try{
       await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email has been Sucessfully",style: TextStyle(fontSize: 18),)));
    }on FirebaseAuthException catch (e)
    {
      if(e.code=="user-not-found")
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user found this email",style: TextStyle(fontSize: 18),)));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Stack(
          children: [
            // Top Gradient Background
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0XFF7f30fe), Color(0XFF6300fb)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 105.5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Password Recovery",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Enter the email",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 202, 190, 190),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        height: MediaQuery.of(context).size.height / 1.6,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Email Field
                              Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.black,
                                  ),
                                ),
                                child: TextFormField(
                                  controller: femail,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.email),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    } else if (!RegExp(r"^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                             
                              SizedBox(height: 20),
                              // Sign In Button
                              GestureDetector(
                                onTap: () {
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      email=femail.text;
                                    });
                                    sendmail();
                                  }
                                },
                                child: Center(
                                  child: Container(
                                    width: 150,
                                    child: Material(
                                      elevation: 10.0,
                                      borderRadius: BorderRadius.circular(12),
                                      child: Center(
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Color(0XFF7f30fe),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Send Email",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w100,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Sign Up Redirect
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                            Navigator.push<void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const Signup(),
    ),
  );
                        },
                        child: Text(
                          " Sign up",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF7f30fe),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}