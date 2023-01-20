import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otlb/app/provider/home/home_provider.dart';
import 'package:otlb/app/ui/auth/register_sc.dart';
import 'package:otlb/app/ui/home/home_sc.dart';
import 'package:otlb/app/ui/language/language_sc.dart';
import 'package:otlb/app/utils/navigation_manager.dart';
import 'package:otlb/main.dart';
import 'package:provider/provider.dart';

class SplashSc extends StatefulWidget {
  const SplashSc({Key? key}) : super(key: key);

  @override
  State<SplashSc> createState() => _SplashScState();
}

class _SplashScState extends State<SplashSc> {
  late HomeProvider homeProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeProvider=Provider.of<HomeProvider>(myContext!);
    /// rest language
   // homeProvider.rest();
    startSplash();
  }

  void startSplash(){
    Future.delayed(Duration(seconds: 2),(){
      if(homeProvider.isNoHaveLanguage())
        {
          NavigationManager.gotoAndKill(LanguageSc());
        }else{
        NavigationManager.gotoAndKill(RegisterSc());
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(
      children: [
        Container(
          width: 1.sw,
          child: Image.asset("assets/imgs/splash.png",
        fit: BoxFit.cover,
        width: 1.sw,),),
        Center(
          child: Container(child:
          SvgPicture.asset(
              "assets/imgs/logo1.svg",
          ),),
        )
      ],
    ),);
  }
}
