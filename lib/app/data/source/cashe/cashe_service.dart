import 'package:shared_preferences/shared_preferences.dart';

class CasheService {
   late  SharedPreferences sharedPreferences;
  Future init()async{
    sharedPreferences=await SharedPreferences.getInstance();
  }
}