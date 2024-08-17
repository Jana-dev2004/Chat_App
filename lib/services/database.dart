
import 'package:cloud_firestore/cloud_firestore.dart';

class Database
{
Future add(Map<String,dynamic>info,String id)async{
  return await FirebaseFirestore.instance.collection("users").doc(id).set(info);
}
Future<QuerySnapshot> getuserbyemail(String email)async{
  return await FirebaseFirestore.instance.collection("users").where("E-mail",isEqualTo: email).get();
}
}