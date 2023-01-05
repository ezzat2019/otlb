import 'dart:ui';

import 'package:otlb/app/data/source/cashe/cashe_service.dart';
import 'package:otlb/app/utils/constants.dart';
import 'package:otlb/app/utils/di_helper.dart';

class LangRepo{
  CasheService casheService=DiHelper.getIt.get<CasheService>();

  void setCurrentLang(String currentLang)
  {
   casheService.sharedPreferences.setString(Constants.CURRENT_LANG_KEY, currentLang);
  }

  TextDirection getCurrentDir(){
    String lang=getCurrentLang();

    if(lang==Constants.AR){
      return TextDirection.rtl;
    }else
      {
        return TextDirection.ltr;
      }
  }
  String getCurrentLang(){
     bool haveCurrentLang=casheService
         .sharedPreferences.containsKey(Constants.CURRENT_LANG_KEY);
     if(haveCurrentLang==true)
       {
         return casheService.sharedPreferences.getString(Constants.CURRENT_LANG_KEY)??Constants.AR;
       }
     else
       {
         return Constants.AR;
       }
  }
}