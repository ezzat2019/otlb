import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlb/app/provider/home/home_provider.dart';
import 'package:otlb/app/utils/color_manager.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../widget/my_orange_btn.dart';

class RegisterSc extends StatefulWidget {
  const RegisterSc({Key? key}) : super(key: key);

  @override
  State<RegisterSc> createState() => _RegisterScState();
}

class _RegisterScState extends State<RegisterSc> {
  final TextEditingController phoneCon = TextEditingController();
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return Directionality(
          textDirection: value.textDirection,
          child: Scaffold(
            body: Stack(
              children: [
                buildBackground(),
                buildBody(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: ListView(
        ///  to center text method 2
        //  crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// to center text method 1
          // Center(child: Text("إنشاء حساب جديد")),
          SizedBox(
            height: 60.h,
          ),
          buildCreateTxt(context),
          SizedBox(
            height: 20.h,
          ),
          buildPhoneNumber(context),
          SizedBox(
            height: 20.h,
          ),
          buildName(context),
          SizedBox(
            height: 20.h,
          ),
          buildEmail(context),
          SizedBox(
            height: 20.h,
          ),
          buildPass(context),
          SizedBox(
            height: 20.h,
          ),
          buildConfirmPass(context),
          SizedBox(
            height: 30.h,
          ),
          MyOrangeBtn(
              paddingVal: 0, btnName: S.of(context).register, btnFun: () {}),
          SizedBox(
            height: 20.h,
          ),
          buildGotoLogin(context),
        ],
      ),
    );
  }

  Row buildGotoLogin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).alreadyHaveAnAccount,
          style: TextStyle(
              color: ColorManager.mainColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 8.w,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            S.of(context).login,
            style: TextStyle(
                color: ColorManager.orangeColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Container buildBackground() {
    return Container(
      width: 1.sw,
      child: Image.asset(
        "assets/imgs/lang.png",
        fit: BoxFit.cover,
        width: 1.sw,
      ),
    );
  }

  Column buildConfirmPass(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              S.of(context).confirmPassword,
              style: TextStyle(color: ColorManager.mainColor, fontSize: 16.sp),
            ),
          ],
        ),
        TextField(
          obscureText: true,
          controller: confirmPassCon,
        )
      ],
    );
  }

  Column buildPass(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              S.of(context).password,
              style: TextStyle(color: ColorManager.mainColor, fontSize: 16.sp),
            ),
          ],
        ),
        TextField(
          obscureText: true,
          controller: passCon,
        )
      ],
    );
  }

  Column buildEmail(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              S.of(context).email,
              style: TextStyle(color: ColorManager.mainColor, fontSize: 16.sp),
            ),
          ],
        ),
        TextField(
          controller: emailCon,
        )
      ],
    );
  }

  Column buildName(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              S.of(context).fullName,
              style: TextStyle(color: ColorManager.mainColor, fontSize: 16.sp),
            ),
          ],
        ),
        TextField(
          controller: nameCon,
        )
      ],
    );
  }

  Row buildCreateTxt(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).createANewAccount,
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: ColorManager.mainColor),
        ),
      ],
    );
  }

  Column buildPhoneNumber(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              S.of(context).phoneNumber,
              style: TextStyle(color: ColorManager.mainColor, fontSize: 16.sp),
            ),
          ],
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: TextField(
            controller: phoneCon,
            keyboardType: TextInputType.phone,
            style: TextStyle(fontSize: 20.sp),
            decoration: InputDecoration(
                prefixIcon: SizedBox(
                  width: 100.w,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/imgs/eg_flag.png",
                        width: 32.w,
                        height: 24.h,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        "+20",
                        style: TextStyle(
                            color: ColorManager.greyColor, fontSize: 20.sp),
                      )
                    ],
                  ),
                ),
                hintText: "1XXXXXXXXX",
                hintStyle: TextStyle(
                    color: ColorManager.greyLightColor, fontSize: 20.sp)),
          ),
        ),
      ],
    );
  }

  void init() {}
}
