import 'package:chat_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool search=false;
  var queryresult=[];
  var tempsearchstore=[];
  initialsearch(value)
  {
    if(value.length==0)
    {
      setState(() {
        queryresult=[];
        tempsearchstore=[];
      });
    }
    setState(() {
      search=true;
    });
    var capitalize=value.substring(0,1).toUpperCase()+value.substring(1);
    if(queryresult.length==0&&value.length==1)
    {
      Database().search(value).then((QuerySnapshot docs)
      {
        for(int i=0;i<docs.docs.length;i++)
        {
            
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF553370),
      body: Container(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                search?Expanded(child: TextField(
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.white),
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.white),
                    border: InputBorder.none
                  ),
                )):Text("Chat App",style:TextStyle(
                    fontSize: 25,fontWeight: FontWeight.bold,
                    color:Color(0xffc199cd),
                  )),
                  GestureDetector(
                    onTap: (){
                      search=true;
                      setState(() {
                        
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2.0),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(6)
                      ),
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.search,color: Color(0xffc199cd),),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(6),
              height: MediaQuery.of(context).size.height/1.18,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft:Radius.circular(20),
                topRight: Radius.circular(20)),
                  color: Colors.white
              ),
              child: Column(
              
                children: [
                  Row(

                    children: [
                      Container(
                        height:40,
                        width: 40,
                        child: Center(
                          child: Text("J",style:TextStyle(
                            color: Colors.white
                          )),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                      SizedBox(width:10.0),

                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Jana",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text("Hi!",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),)
                        ],
                      ),
                      Spacer(),
                      Text("04.30 pm",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black45))
                    ],
                  ),
                  SizedBox(height:20),
                   Row(

                    children: [
                      Container(
                        height:40,
                        width: 40,
                        child: Center(
                          child: Text("N",style:TextStyle(
                            color: Colors.white
                          )),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                      SizedBox(width:10.0),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Naveen",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text("How are you?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),)
                        ],
                      ),
                      Spacer(),
                      Text("05.30 pm",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color:Colors.black45),)
                ],
              ),
          ]))
          ],
        ),
      ),
    );
  }
}