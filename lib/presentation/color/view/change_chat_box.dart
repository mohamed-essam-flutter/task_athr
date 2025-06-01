import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_athr/core/colors/color.dart';
import 'package:task_athr/core/utils/text_style.dart';
import 'package:task_athr/core/widget/customm_app_bar.dart';
import 'package:task_athr/presentation/color/widget/content_change_chat.dart';

class ChangeChatBoxScreen extends StatefulWidget {
  const ChangeChatBoxScreen({super.key});

  @override
  State<ChangeChatBoxScreen> createState() => _ChangeChatBoxScreenState();
}

class _ChangeChatBoxScreenState extends State<ChangeChatBoxScreen> {
  final List<Color> items = [
    ColorManager.darkBlue,
    ColorManager.deepPink,
    ColorManager.lightRed,
    ColorManager.yellow,
    ColorManager.green,
    ColorManager.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              content: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: ColorManager.white,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Change ChatBox',
                      textAlign: TextAlign.center,
                      style: TextStyles.font20PrimaryRegular,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.07,
                    child: Image.asset(
                      'assets/image/background2.png',
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: GridView.builder(
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: ContentGridView(items: items, index: index),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

