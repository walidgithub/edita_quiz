import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/style/colors_manager.dart';
import '../shared/constant/constant_values_manager.dart';

Widget textS18Component(BuildContext context,String text,
    {double? fontSize}) {

  return Text(
  text,style: TextStyle(fontSize: 18.sp, fontFamily: FontConstants.fontFamily),
  );
}

Widget textS14Component(BuildContext context,String text,
    {double? fontSize}) {

  return Text(
    text,style: TextStyle(fontSize: 14.sp, fontFamily: FontConstants.fontFamily),
  );
}

Widget textS14PrimaryComponent(BuildContext context,String text,
    {double? fontSize,Color? color}) {

  return Text(
    text,style: TextStyle(fontSize: 14.sp,color: ColorManager.primary, fontFamily: FontConstants.fontFamily),
  );
}

Widget textS14LightComponent(BuildContext context,String text,
    {double? fontSize,Color? color}) {

  return Text(
    text,style: TextStyle(fontSize: 14.sp,color: ColorManager.light, fontFamily: FontConstants.fontFamily),
  );
}

Widget textQuePrimaryBoldComponent(BuildContext context,String text,
    {double? fontSize,Color? color}) {

  return Text(
    text,style: TextStyle(fontSize: 18.sp,color: ColorManager.primary, fontWeight: FontWeight.bold, fontFamily: FontConstants.fontFamily),
  );
}

Widget textAnsPrimaryBoldComponent(BuildContext context,String text,
    {double? fontSize,Color? color}) {

  return Text(
    text,style: TextStyle(fontSize: 14.sp,color: ColorManager.primary, fontWeight: FontWeight.bold, fontFamily: FontConstants.fontFamily),
  );
}

Widget textAnsLightBoldComponent(BuildContext context,String text,
    {double? fontSize,Color? color}) {

  return Text(
    text,style: TextStyle(fontSize: 18.sp,color: ColorManager.light, fontWeight: FontWeight.bold, fontFamily: FontConstants.fontFamily),
  );
}

Widget textS14WhiteComponent(BuildContext context,String text,
    {double? fontSize,Color? color}) {

  return Text(
    text,style: TextStyle(fontSize: 14.sp,color: ColorManager.light, fontFamily: FontConstants.fontFamily),
  );
}