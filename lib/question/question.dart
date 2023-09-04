import 'package:edita_quiz/components/container_component.dart';
import 'package:edita_quiz/models/quiz_model.dart';
import 'package:edita_quiz/question/widgets/case_study_dialog.dart';
import 'package:edita_quiz/question/widgets/video_dialog.dart';
import 'package:edita_quiz/router/arguments.dart';
import 'package:edita_quiz/shared/constant/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/text_component.dart';
import '../models/answers_model.dart';
import '../router/app_router.dart';
import '../shared/constant/assets_manager.dart';
import '../shared/constant/constant_values_manager.dart';
import '../shared/style/colors_manager.dart';

import 'package:flutter_svg/svg.dart';

import '../shared/utils/general_functions.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({Key? key}) : super(key: key);

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  int score = 0;

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context),
      child: SafeArea(
          child: Scaffold(
        body: contentBody(context),
      )),
    );
  }

  Widget contentBody(BuildContext context) {
    return Stack(
      children: [
        // dark background
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: ColorManager.primary,
        ),

        // question
        Positioned(
            top: AppConstants.questionTop,
            left: AppConstants.questionLeft,
            right: AppConstants.questionRight,
            child: Stack
              (
              clipBehavior: Clip.none,
              children: [
                containerComponent(
                  context,
                  Center(
                      child: textQuePrimaryBoldComponent(
                          context, quizList[index].question)),
                  height: AppConstants.questionHeight,
                  width: AppConstants.questionWidth,
                  color: ColorManager.light,
                  borderRadius: AppConstants.questionRadius,
                  borderWidth: AppConstants.borderWidth,
                  borderColor: ColorManager.primary,
                  padding: EdgeInsets.all(AppConstants.questionPadding),
                ),
                Positioned(
                  top: -25,
                    left: 20,
                    child: containerComponent(
                      context,
                      Center(
                          child: textQuePrimaryBoldComponent(
                              context, '${AppStrings.question} ${index + 1}')),
                      height: 50.h,
                      width: 100.w,
                      color: ColorManager.light,
                      borderRadius: AppConstants.questionRadius,
                      borderWidth: AppConstants.borderWidth,
                      borderColor: ColorManager.primary,
                      padding: EdgeInsets.all(8),
                    ))
              ],
            )),

        // light background
        Positioned(
          bottom: 0,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: ColorManager.secondary,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25)))),
              // video icon
              Positioned(
                top: -30,
                left: MediaQuery.of(context).size.width * 0.3,
                right: MediaQuery.of(context).size.width * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Bounceable(
                        onTap: () {
                          VideoDialog.show(context, 'assets/videos/sample-5s.mp4');
                        },
                        child: SvgPicture.asset(
                          ImageAssets.video,
                          width: 60,
                        )),
                    SizedBox(
                      width: AppConstants.widthBetweenElements,
                    ),
                    Bounceable(
                        onTap: () {
                          CaseStudyDialog.show(context, AppStrings.caseStudy);
                        },
                        child: SvgPicture.asset(
                          ImageAssets.caseStudy,
                          width: 55,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),

        // answers
        Positioned(
          bottom: AppConstants.answerBottom,
          left: AppConstants.questionLeft,
          right: AppConstants.questionRight,
          child: SizedBox(
            height: 350.h,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: quizList[index].answers.length,
                itemBuilder: (BuildContext context, int answerIndex) {
                  return Column(children: [
                    answersModel(
                        context,
                        quizList[index].answers,
                        quizList[index].answers[index].trueOrFalse,
                        quizList[index].answers[index].selected,
                        quizList[index].answers[answerIndex].answer,
                        answerIndex),
                  ]);
                }),
          ),
        ),

        // next
        Positioned(
            bottom: AppConstants.backNNextBottom,
            left: AppConstants.questionLeft,
            right: AppConstants.questionRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Bounceable(
                  duration:
                      Duration(milliseconds: AppConstants.durationOfBounceable),
                  onTap: () async {
                    await Future.delayed(Duration(
                        milliseconds: AppConstants.durationOfBounceable));

                    if (index == quizList.length - 1) {
                      int totalQues = quizList.length;
                      double totalScore =  (score / totalQues) * 100;
                      Navigator.of(context).pushReplacementNamed(
                          Routes.resultRoute,
                          arguments: GoToResult(score: totalScore));
                    }

                    setState(() {
                      if (index < quizList.length - 1) {
                        index++;
                      }
                    });
                  },
                  child: containerComponent(
                    context,
                    Center(
                        child: textAnsLightBoldComponent(
                                context, AppStrings.next)),
                    height: AppConstants.backNNextHeight,
                    width: AppConstants.backNNextWidth,
                    color: ColorManager.primary,
                    borderRadius: AppConstants.backNNextRadius,
                    borderWidth: AppConstants.borderWidth,
                    borderColor: ColorManager.primary,
                  ),
                )
              ],
            )),
      ],
    );
  }

  Widget answersModel(BuildContext context, List<AnswerModel> answers,
      bool trueOrFalse, bool selected, String answer, int answerIndex) {
    return Bounceable(
      duration: Duration(milliseconds: AppConstants.durationOfBounceable),
      onTap: () async {
        await Future.delayed(
            Duration(milliseconds: AppConstants.durationOfBounceable));

        setState(() {
          for (var element in answers) {
            element.selected = false;
          }
          answers[answerIndex].selected = true;

          if (answers[answerIndex].trueOrFalse) {
            score++;
          }
        });
      },
      child: containerComponent(
          context,
          Center(
              child: answers[answerIndex].selected
                  ? textAnsLightBoldComponent(context, answer)
                  : textAnsPrimaryBoldComponent(context, answer)),
          height: AppConstants.answerHeight,
          width: AppConstants.answerWidth,
          color: answers[answerIndex].selected
              ? ColorManager.primary
              : ColorManager.light,
          borderRadius: AppConstants.answerRadius,
          borderWidth: AppConstants.borderWidth,
          borderColor: answers[answerIndex].selected
              ? ColorManager.light
              : ColorManager.primary,
          padding: EdgeInsets.all(AppConstants.answerPadding),
          margin: EdgeInsets.only(bottom: AppConstants.answerMargin)),
    );
  }
}
