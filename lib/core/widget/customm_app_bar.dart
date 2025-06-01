import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_athr/core/colors/color.dart';

class CustomAppBar extends StatelessWidget {
  final Widget content;

  const CustomAppBar({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 80.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              ColorManager.secondaryColor.withOpacity(0.8),
              ColorManager.primaryColor,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: content, 
        ),
      ),
    );
  }
}
