import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color_manager.dart';

class MyOrangeBtn extends StatelessWidget {
  num paddingVal=0.0;
  String btnName="";
  Color? btnColor;
  dynamic btnFun;
  MyOrangeBtn({
    required this.paddingVal,
    required this.btnName,
    required this.btnFun,
    this.btnColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: paddingVal.w),
      child: SizedBox(
        width: 1.sw,
        child: ElevatedButton(onPressed: btnFun,
            style: ElevatedButton.styleFrom(backgroundColor: btnColor??ColorManager.orangeColor)
            , child: Text(btnName,
              style: TextStyle(color: Colors.white,fontSize: 18.sp),)),
      ),
    );
  }
}