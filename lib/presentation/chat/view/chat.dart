import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_athr/core/colors/color.dart';
import 'package:task_athr/core/utils/text_style.dart';
import 'package:task_athr/core/widget/text_form_feild.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(height: 90.h, color: ColorManager.primaryColor),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          ColorManager.secondaryColor.withOpacity(0.9),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 20.h,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: SvgPicture.asset('assets/icons/profile.svg'),
                        ),
                        Text('Maria', style: TextStyles.font12PrimaryBold),
                        SvgPicture.asset('assets/icons/Vector.svg'),
                        SvgPicture.asset('assets/icons/setting.svg'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/image/background.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(height: 105.h, color: ColorManager.primaryColor),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      ColorManager.secondaryColor.withOpacity(0.9),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
          // محتوى البار فوق كل شيء:
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/camera.svg'),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: AppTextFormField(
                      backgroundColor: ColorManager.white,
                      decorationType: DecorationType.filled,
                      hintText: 'write something...',
                      validator: (p) {
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 5.w),
                  SvgPicture.asset('assets/icons/microphone.svg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
