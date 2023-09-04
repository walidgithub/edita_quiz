import 'package:edita_quiz/models/quiz_model.dart';
import 'package:edita_quiz/router/arguments.dart';
import 'package:edita_quiz/shared/constant/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/container_component.dart';
import '../components/text_component.dart';
import '../shared/constant/constant_values_manager.dart';
import '../shared/style/colors_manager.dart';
import '../shared/utils/general_functions.dart';

class ResultView extends StatefulWidget {
  GoToResult arguments;
  ResultView({super.key, required this.arguments});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context),
      child: SafeArea(
        child: Scaffold(
          body: bodyContent(context),
        ),
      ),
    );
  }

  Widget bodyContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: ColorManager.primary,
        ),
        Positioned(
            top: 120,
            left: 50,
            right: 50,
            child: Center(
                child: Text(
              AppStrings.congratulations,
              style: TextStyle(
                  fontSize: 40.sp,
                  color: ColorManager.light,
                  fontFamily: FontConstants.fontFamily),
            ))),
        Positioned(
          bottom: 0,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: ColorManager.secondary,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)))),
        ),
        Positioned(
            bottom: 250,
            left: 50,
            right: 50,
            child: Center(
                child: Text(
              AppStrings.yourScoreIs,
              style: TextStyle(
                  fontSize: 40.sp,
                  color: ColorManager.primary,
                  fontFamily: FontConstants.fontFamily),
            ))),
        Positioned(
            bottom: 150,
            left: 50,
            right: 50,
            child: Center(
                child: Text(
              '${widget.arguments.score.toString()} %',
              style: TextStyle(
                  fontSize: 40.sp,
                  color: ColorManager.primary,
                  fontFamily: FontConstants.fontFamily),
            ))),
        Positioned(
            bottom: 50,
            left: 50,
            right: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Bounceable(
                  duration:
                  Duration(milliseconds: AppConstants.durationOfBounceable),
                  onTap: () async {
                    await Future.delayed(Duration(
                        milliseconds: AppConstants.durationOfBounceable));
                  },
                  child: containerComponent(
                    context,
                    Center(
                        child: textAnsPrimaryBoldComponent(
                            context, AppStrings.nextLevel)),
                    height: AppConstants.backNNextHeight,
                    width: AppConstants.backNNextWidth,
                    color: ColorManager.light,
                    borderRadius: AppConstants.backNNextRadius,
                    borderWidth: AppConstants.borderWidth,
                    borderColor: ColorManager.primary,
                  ),
                ),
                Bounceable(
                  duration:
                  Duration(milliseconds: AppConstants.durationOfBounceable),
                  onTap: () async {
                    await Future.delayed(Duration(
                        milliseconds: AppConstants.durationOfBounceable));
                    SystemNavigator.pop();
                  },
                  child: containerComponent(
                    context,
                    Center(
                        child: textAnsPrimaryBoldComponent(
                            context, AppStrings.stop)),
                    height: AppConstants.backNNextHeight,
                    width: AppConstants.backNNextWidth,
                    color: ColorManager.light,
                    borderRadius: AppConstants.backNNextRadius,
                    borderWidth: AppConstants.borderWidth,
                    borderColor: ColorManager.primary,
                  ),
                )
              ],
            ))
      ],
    );
  }
}
