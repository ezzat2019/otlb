import 'package:get_it/get_it.dart';
import '../data/repo/lang_repo.dart';
import '../data/source/cashe/cashe_service.dart';

class DiHelper{
  static final getIt = GetIt.instance;


  static void init() {
    getIt.registerLazySingleton<CasheService>(() => CasheService());
    getIt.registerLazySingleton<LangRepo>(() => LangRepo());

  }
}