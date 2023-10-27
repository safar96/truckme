import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';


Future<Locale> setLocal(String language) async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString("languageCode", language);
  return _locale(language);
}


Locale _locale(String language) {
  Locale temp;
  switch(language){
    case "ru":
      temp = Locale(language,'RU');
      break;
    case "uz":
      temp = Locale(language,'UZB');
      break;
    case "en":
      temp = Locale(language,'EN');
      break;
    default:
      temp = Locale(language,'UZB');
  }
  return temp;
}

  Future<Locale> getLocal() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  String languageCode = pref.getString('languageCode') ?? 'uz';
  return _locale(languageCode);
}