import 'package:shared_preferences/shared_preferences.dart';
class Sharedpreference
{
  static String useridkey="USERIDKEY";
   static String userNamekey="USERNAMEKEY";
    static String userEmailkey="USEREMAILKEY";
      static String userdisplaykey="USERDISPLAYKEY";
   Future<bool> saveuserid(String id)async
   {
    SharedPreferences pref=await SharedPreferences.getInstance();
    return pref.setString(useridkey,id);
   }
   Future<bool> saveusername(String name)async
   {
    SharedPreferences pref=await SharedPreferences.getInstance();
    return pref.setString(useridkey,name);
   }
   Future<bool> saveuseremail(String email)async
   {
    SharedPreferences pref=await SharedPreferences.getInstance();
    return pref.setString(useridkey,email);
   }
      Future<bool> saveuserdisplay(String display)async
   {
    SharedPreferences pref=await SharedPreferences.getInstance();
    return pref.setString(userdisplaykey,display);
   }
   Future<String?> getuser(String id )async
   {
    SharedPreferences pref=await SharedPreferences.getInstance();
    return pref.getString(useridkey);
   }
   Future<String?> getname(String id )async
   {
    SharedPreferences pref=await SharedPreferences.getInstance();
    return pref.getString(userNamekey);
   }
      Future<String?> getemail(String id )async
   {
    SharedPreferences pref=await SharedPreferences.getInstance();
    return pref.getString(userEmailkey);
   }
      Future<String?> getdisplay(String id )async
   {
    SharedPreferences pref=await SharedPreferences.getInstance();
    return pref.getString(userdisplaykey);
   }
}