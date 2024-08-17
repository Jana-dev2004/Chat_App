
import 'package:cloud_firestore/cloud_firestore.dart';

class Database
{
Future add(Map<String,dynamic>info,String id)async{
  return await FirebaseFirestore.instance.collection("users").doc(id).set(info);
}
Future<QuerySnapshot> getuserbyemail(String email) async {
  if (email.isEmpty) {
    throw Exception("Email cannot be empty");
  }

  try {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
  } catch (e) {
    throw Exception("Failed to get user by email: $e");
  }
}
Future <QuerySnapshot> search(String username)async{
  return await FirebaseFirestore.instance.collection("users").where("searchkey",isEqualTo: username.substring(0,1).toUpperCase()).get();
}

}