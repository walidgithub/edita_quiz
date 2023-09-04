import 'package:edita_quiz/components/container_component.dart';
import 'package:edita_quiz/shared/constant/assets_manager.dart';
import 'package:edita_quiz/shared/constant/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/text_component.dart';
import '../router/app_router.dart';
import '../shared/constant/constant_values_manager.dart';
import '../shared/style/colors_manager.dart';

class StartView extends StatefulWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.secondary,
      body: contentBody(context),
    ));
  }

  Widget contentBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: AppConstants.bigHeightBetweenElements,
          ),
          Image.asset(
            ImageAssets.logo,
            width: 300.w,
            height: 300.h,
          ),
          SizedBox(
            height: AppConstants.bigHeightBetweenElements,
          ),
          Bounceable(
            duration: Duration(milliseconds: AppConstants.durationOfBounceable),
            onTap: () async {
              await Future.delayed(
                  Duration(milliseconds: AppConstants.durationOfBounceable));
              Navigator.of(context).pushReplacementNamed(Routes.questionRoute);
            },
            child: containerComponent(
                context,
                Center(
                  child: textS14LightComponent(context, AppStrings.startQuiz),
                ),
                width: AppConstants.answerWidth,
                height: AppConstants.answerHeight,
                borderColor: ColorManager.light,
                color: ColorManager.primary,
                borderRadius: AppConstants.answerRadius,
                borderWidth: AppConstants.borderWidth,
                padding: EdgeInsets.all(AppConstants.answerPadding)),
          ),
          SizedBox(
            height: AppConstants.heightBetweenElements,
          ),
          Bounceable(
            duration: Duration(milliseconds: AppConstants.durationOfBounceable),
            onTap: () async {
              await Future.delayed(
                  Duration(milliseconds: AppConstants.durationOfBounceable));
              SystemNavigator.pop();
            },
            child: containerComponent(
                context,
                Center(
                  child: textS14PrimaryComponent(context, AppStrings.quitQuiz),
                ),
                width: AppConstants.answerWidth,
                height: AppConstants.answerHeight,
                borderColor: ColorManager.primary,
                color: ColorManager.light,
                borderRadius: AppConstants.answerRadius,
                borderWidth: AppConstants.borderWidth,
                padding: EdgeInsets.all(AppConstants.answerPadding)),
          )
        ],
      ),
    );
  }
}
