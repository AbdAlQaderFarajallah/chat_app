import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';


enum PrefKey{
  loggedIn  , email
}


class SharedPref{
  late SharedPreferences _sharedPreferences;
  SharedPref._internal();
  static final SharedPref _instance = SharedPref._internal();

  factory SharedPref(){
    return _instance;
  }
  Future<void> initPreferences() async{
    _sharedPreferences=await SharedPreferences.getInstance();
  }


  Future<void>saveData({required User user})async{
    await _sharedPreferences.setBool(PrefKey.loggedIn.toString(), true);
    await _sharedPreferences.setString(PrefKey.email.toString(), user.email);

  }

  bool get loggedIn => _sharedPreferences.getBool(PrefKey.loggedIn.toString()) ?? false ;

  T? getValue<T>(String key){
    if(_sharedPreferences.containsKey(key)){
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  Future<bool> clear() async{
    return await _sharedPreferences.clear();
  }


}