import "package:flutter/material.dart";
class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF553370),
      body: Container(
             child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_back,color: Colors.white),
                    SizedBox(width: 20,),
                    Text("Jana",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white),)
                  ],
                ),
                SizedBox(height:20),
                Container(
                  height: MediaQuery.of(context).size.height/1.10,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                     color: Colors.white),
                     child: Column(children: [
                      SizedBox(height:20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                        
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(179, 114, 110, 110)
                          ),
                          child: Text("hi ",style:TextStyle(fontSize: 20,)),
                        ),
                      ),
                      SizedBox(height:20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                         
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(179, 114, 110, 110)
                          ),
                          child: Text("hiiiiiiiiiiiiiiiii ",style:TextStyle(fontSize: 20,)),
                        ),
                      ),
                      Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            elevation: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 178, 180, 177)
                              ),
                                                child: Row(
                                                  children: [
                            Expanded(child: TextField(
                              decoration:InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter the message",
                                hintStyle: TextStyle(color: Colors.white,fontSize: 15)
                              ),
                            ),
                            ),
                            Icon(Icons.send_sharp)
                                                  ],
                                                ),
                                               ),
                          ),
                        )
                
                     ],),
                   ),
             
                 

              ],
             ),
      ),
    );
  }
}