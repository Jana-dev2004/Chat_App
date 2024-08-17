import 'package:chat_app/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formkey=GlobalKey();
  String uemail="",upass="",name="",username="",id="";
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
  userlogin()async
  {
    try{
       await FirebaseAuth.instance.signInWithEmailAndPassword(email: uemail, password: upass);
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
    }on FirebaseAuthException catch(e)
    {
       if(e.code=="No user found for the email")
       {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong name",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,backgroundColor: Colors.red),)));
       }
       else if(e.code=="wrong password")
       {
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Password",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,backgroundColor: Colors.red),)));
       }
    }
 

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/3.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0XFF7f30fe),Color(0XFF6300fb)],begin: Alignment.topLeft,end: Alignment.bottomRight),
                borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(MediaQuery.of(context).size.width, 105.5))
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                    Center(child: Text("Sign In",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color:Colors.white),)),
                    Center(child: Text("Log in your Account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:const Color.fromARGB(255, 202, 190, 190)),)),
                    Container(
                       margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                          height: MediaQuery.of(context).size.height/2,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Form(
                            key:_formkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Text("Email",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                               SizedBox(height:10),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.0,color: Colors.black)
                                ),
                                child: TextFormField(
                                  controller: email,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.email)
                                  ),
                                ),
                              ),
                              Text("Password",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                              SizedBox(height: 10,),
                               Container(
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.0,color: Colors.black)
                                ),
                                child: TextFormField(
                                  controller: pass,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.password),
                                    border: InputBorder.none
                                  
                                  ),
                                ),
                            
                              ),
                              SizedBox(height: 10,),
                              Container(
                                alignment: Alignment.topRight,
                                child: Text("Forgot Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w100,color: Colors.black),),),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      uemail=email.text;
                                      upass=pass.text;
                                    });
                                    userlogin();
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
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Center(child: Text("Sign In",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w100,color: Colors.white))),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                            ],),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Dont have a account?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black)),
                      Text("Sign up?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0XFF7f30fe))),
                    ],)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}