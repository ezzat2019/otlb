import 'package:flutter/cupertino.dart';
import 'package:otlb/app/utils/constants.dart';
import 'package:otlb/app/utils/di_helper.dart';

import '../../../generated/l10n.dart';
import '../../data/repo/lang_repo.dart';

class HomeProvider extends ChangeNotifier{
  LangRepo langRepo=DiHelper.getIt.get<LangRepo>();
  TextDirection textDirection=TextDirection.rtl;


  init(){
    textDirection=langRepo.getCurrentDir();
  }
  void setArabicLang(){
    langRepo.setCurrentLang(Constants.AR);
    S.load(Locale(Constants.AR));
    textDirection=langRepo.getCurrentDir();
  }

  void setEnglishLang(){
    langRepo.setCurrentLang(Constants.EN);
    S.load(Locale(Constants.EN));
    textDirection=langRepo.getCurrentDir();
  }

  bool isNoHaveLanguage(){
    textDirection=langRepo.getCurrentDir();
    return langRepo.getCurrentLang().isEmpty;
  }

  void changeLang(){
    String currentLang=langRepo.getCurrentLang();
    if(currentLang==Constants.AR)
      {
        langRepo.setCurrentLang(Constants.EN);
        S.load(Locale(Constants.EN));
      }else
        {
          langRepo.setCurrentLang(Constants.AR);
          S.load(Locale(Constants.AR));
        }
    textDirection=langRepo.getCurrentDir();
    notifyListeners();
  }

  void rest()
  {
    langRepo.clearLanguage();
  }
}