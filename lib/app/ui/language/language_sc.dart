import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otlb/app/provider/home_provider.dart';
import 'package:otlb/app/utils/color_manager.dart';
import 'package:otlb/app/utils/constants.dart';
import 'package:otlb/main.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../widget/my_orange_btn.dart';

class LanguageSc extends StatefulWidget {
  const LanguageSc({Key? key}) : super(key: key);

  @override
  State<LanguageSc> createState() => _LanguageScState();
}

class _LanguageScState extends State<LanguageSc> {
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                width: 1.sw,
                child: Image.asset("assets/imgs/lang.png",
                  fit: BoxFit.cover,
                  width: 1.sw,),),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(child:
                    SvgPicture.asset(
                      "assets/imgs/logo1.svg",
                    ),),
                  ),
                  SizedBox(height: .15.sh,),
                  Text("اختر اللغة",style: TextStyle(
                    fontSize: 18.sp,
                    color: ColorManager.mainColor
                  ),),
                  SizedBox(height: 8.h,),
                  Text("Choose The Language",style: TextStyle(
                      fontSize: 16.sp,
                      color: ColorManager.mainColor
                  ),),
                  SizedBox(height: 16.h,),
                  MyOrangeBtn(paddingVal: 36,btnName: "اللغة العربية",btnFun: (){

                  },),
                  SizedBox(height: 16.h,),
                  MyOrangeBtn(paddingVal: 36,btnName: "English",btnFun: (){

                  })

                ],
              ),
            ],
          ),

        );
      },
    );
  }

  void init() {
  }
}


