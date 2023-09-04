import 'package:edita_quiz/shared/constant/constant_values_manager.dart';
import 'package:edita_quiz/shared/constant/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/container_component.dart';
import '../../components/text_component.dart';
import '../../shared/style/colors_manager.dart';

class CaseStudyDialog extends StatefulWidget {
  String caseStudy;
  static void show(BuildContext context, String caseStudy) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => CaseStudyDialog(
          caseStudy: caseStudy,
        ),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.of(context).pop();

  CaseStudyDialog({required this.caseStudy, super.key});

  @override
  State<CaseStudyDialog> createState() => _CaseStudyDialogState();
}

class _CaseStudyDialogState extends State<CaseStudyDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    width: 350.w,
                    height: 300.h,
                    decoration: BoxDecoration(
                        color: ColorManager.secondary,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [BoxShadow(color: ColorManager.light)]),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textQuePrimaryBoldComponent(
                              context, AppStrings.caseStudy),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                textS14PrimaryComponent(context, 'بسؤال العامل عن السبب وضح انه كان مستعجل عشان يبدل زميله على الماكينة اللي لازم يلحق يأكل قبل الكافتيريا ما تقفل لأنها تشتغل ساعتين بس في اليوم'),
                                SizedBox(
                                  height: AppConstants.smallDistance,
                                ),
                                textS14PrimaryComponent(context, 'وبعد سؤال فريق الصيانة عن سبب تعطيل الماكينة قالوا انه عطل في جزء في الماكينة يحصل مره في السنه والماكينة الثانية بتبقي شغاله لحد ما الماكينة المعطلة تتصلح'),
                                SizedBox(
                                  height: AppConstants.smallDistance,
                                ),
                                textS14PrimaryComponent(context, 'وبعد سؤال مسئول الجودة اظهر كل تقارير التدريب اللي بتأكد ان كل العمال مدربين على اسس سلامة الغذاء وانهم لازم يطهروا ايديهم  قبل ما يدخلوا يشتغلوا'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppConstants.heightBetweenElements,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Bounceable(
                                duration:
                                Duration(milliseconds: AppConstants.durationOfBounceable),
                                onTap: () async {
                                  await Future.delayed(Duration(
                                      milliseconds: AppConstants.durationOfBounceable));

                                  CaseStudyDialog.hide(context);
                                },
                                child: containerComponent(
                                  context,
                                  Center(
                                      child: textAnsLightBoldComponent(
                                          context, AppStrings.back)),
                                  height: AppConstants.backNNextHeight,
                                  width: AppConstants.backNNextWidth,
                                  color: ColorManager.primary,
                                  borderRadius: AppConstants.backNNextRadius,
                                  borderWidth: AppConstants.borderWidth,
                                  borderColor: ColorManager.primary,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )))));
  }
}
