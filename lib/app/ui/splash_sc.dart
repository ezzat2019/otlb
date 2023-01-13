import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otlb/app/ui/home/home_sc.dart';
import 'package:otlb/app/ui/language/language_sc.dart';
import 'package:otlb/app/utils/navigation_manager.dart';

class SplashSc extends StatefulWidget {
  const SplashSc({Key? key}) : super(key: key);

  @override
  State<SplashSc> createState() => _SplashScState();
}

class _SplashScState extends State<SplashSc> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startSplash();
  }

  void startSplash(){
    Future.delayed(Duration(seconds: 2),(){
      NavigationManager.gotoAndKill(LanguageSc());
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
