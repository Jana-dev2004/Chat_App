import 'package:chat_app/pages/home.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/services/sharedpreference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _finalkey=GlobalKey<FormState>();
  String name="",email="",password="",confirm="";
  TextEditingController namecontroller =TextEditingController();
   TextEditingController emailcontroller =TextEditingController();
    TextEditingController passcontroller =TextEditingController();
     TextEditingController confirmcontroller =TextEditingController();
    registration()async{
      if(name!=null&&password==confirm)
      {
      try{
      UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      String id=randomAlphaNumeric(10);
      Map<String,dynamic>details={
       "Name":namecontroller.text,
       "email":emailcontroller.text,
       "user":emailcontroller.text.replaceAll("@gmail.com", ""),
       "id":id
      };
      await Database().add(details, id);
      await Sharedpreference().saveuserid(id);
      await Sharedpreference().saveuseremail(emailcontroller.text);
      await Sharedpreference().saveusername(emailcontroller.text.replaceAll("@gmail.com", ""));
      await  Sharedpreference().saveuserdisplay(namecontroller.text);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered Successfully")));
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Home()));
      }on FirebaseAuthException catch(e)
      {
        if(e.code=="Weak password")
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Provided password is too weak",style:TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,
          ))));
        }
        else if(e.code=="email-already-in-use"){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email already exists",style:TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,
          ))));
        }
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
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0XFF7f30fe), Color(0XFF6300fb)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 105.5)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Create a Account",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 202, 190, 190)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Form(
                            key: _finalkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.0, color: Colors.black)),
                                  child: TextFormField(
                                    controller: namecontroller,
                                    validator: (value){
                                       if(value==null||value.isEmpty)
                                      {
                                        return "Enter the name";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.email)),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Email",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.0, color: Colors.black)),
                                  child: TextFormField(
                                    controller: emailcontroller,
                                    validator: (value){
                                      if(value==null||value.isEmpty)
                                      {
                                        return "Enter the email";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.email)),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.0, color: Colors.black)),
                                  child: TextFormField(
                                    controller: passcontroller,
                                    validator: (value){
                                      if(value==null||value.isEmpty)
                                      {
                                        return "Enter the password";
                                      }
                                      return null;
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.password),
                                        border: InputBorder.none),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Confirm Password",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.0, color: Colors.black)),
                                  child: TextFormField(
                                       controller: confirmcontroller,
                                    validator: (value){
                                      if(value==null||value.isEmpty)
                                      {
                                        return "Enter the  confirm password";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.email)),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have an account?",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                    Text(" Sign up",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFF7f30fe))),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: (){
                                  if (_finalkey.currentState?.validate() ?? false)
                                    {
                                      setState(() {
                                        name=namecontroller.text;
                                        email=emailcontroller.text;
                                        password=passcontroller.text;
                                        confirm=confirmcontroller.text;
                                      });
                                    }
                                    registration();
                              

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
                                                child: Text("Sign Up",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w100,
                                                        color: Colors.white))),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
