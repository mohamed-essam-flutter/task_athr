import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_athr/core/colors/color.dart';
import 'package:task_athr/core/utils/text_style.dart';
import 'package:task_athr/core/widget/custom_button.dart';
import 'package:task_athr/core/widget/customm_app_bar.dart';

class ChangeBackgroundScreen extends StatefulWidget {
  const ChangeBackgroundScreen({super.key});

  @override
  State<ChangeBackgroundScreen> createState() => _ChangeBackgroundScreenState();
}

class _ChangeBackgroundScreenState extends State<ChangeBackgroundScreen> {
  final List<String> items = [
    'assets/image/background.png',
    "assets/image/background3.png",
    'assets/image/background.png',
    "assets/image/background3.png",
    'assets/image/background.png',
    "assets/image/background3.png",
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
                      'Change Background',
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
                          height: 20.h,
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 80.h,
                                width: 130.w,
                                child: Image.asset(
                                  items[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              CustomButton(
                                height: 38.h,
                                lable: 'change',
                                onTap: () {},
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.6),
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
