import 'package:edita_quiz/shared/constant/constant_values_manager.dart';
import 'package:edita_quiz/shared/constant/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

import '../../components/container_component.dart';
import '../../components/text_component.dart';
import '../../shared/constant/assets_manager.dart';
import '../../shared/style/colors_manager.dart';

class VideoDialog extends StatefulWidget {
  String videoPath;
  static void show(BuildContext context, String videoPath) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => VideoDialog(
          videoPath: videoPath,
        ),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.of(context).pop();

  VideoDialog({required this.videoPath, super.key});

  @override
  State<VideoDialog> createState() => _VideoDialogState();
}

class _VideoDialogState extends State<VideoDialog> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    width: 350.w,
                    height: 400.h,
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
                          containerComponent(
                              context, VideoPlayer(_videoPlayerController),
                              height: 250.h,
                              color: ColorManager.secondary,
                              borderRadius: AppConstants.backNNextRadius,
                              borderWidth: AppConstants.borderWidth,
                              borderColor: ColorManager.primary,
                              padding: const EdgeInsets.all(8)),
                          SizedBox(
                            height: AppConstants.heightBetweenElements,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Bounceable(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    ImageAssets.pauseIcon,
                                    width: 40,
                                  ),
                                ),
                                Bounceable(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    ImageAssets.playIcon,
                                    width: 40,
                                  ),
                                )
                              ]),
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

                                  VideoDialog.hide(context);
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
