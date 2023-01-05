import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlb/app/data/source/cashe/cashe_service.dart';
import 'package:otlb/app/provider/home_provider.dart';
import 'package:otlb/app/ui/home/home_sc.dart';
import 'package:otlb/app/utils/di_helper.dart';
import 'package:provider/provider.dart';
import 'app/data/repo/lang_repo.dart';
import 'app/utils/constants.dart';
import 'generated/l10n.dart';

GlobalKey<NavigatorState> navKey=GlobalKey<NavigatorState>();
BuildContext? myContext=navKey.currentContext;
void main() async{
 await initApp();
 runApp( MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (context) => HomeProvider(),)
     ],
     child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LangRepo casheRepo=DiHelper.getIt.get<LangRepo>();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: navKey,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: Locale(casheRepo.getCurrentLang()),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:child,
        );
      },
      child: HomeSc(),
    );
  }
}
Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  DiHelper.init();
  CasheService casheService=DiHelper.getIt.get<CasheService>();
  await casheService.init();

  /// other way with static
  //  await CasheService.init();
}