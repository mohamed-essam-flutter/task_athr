import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_athr/core/colors/color.dart';
import 'package:task_athr/core/utils/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.lable,
    required this.onTap,
    this.backgroundColor,
    this.width,
    this.height,
    this.textColor,
    this.borderColor,
    this.margin,
    this.textSize,
    this.iconText = false,
    this.nameIconButton,
    this.nameIconColor,
    this.radius,
    this.boxShadow,
  });
  final String lable;
  final Function() onTap;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? width;
  final double? textSize;
  final double? height;
  final EdgeInsets? margin;
  final bool? iconText;
  final String? nameIconButton;
  final Color? nameIconColor;
  final double? radius;
  final List<BoxShadow>? boxShadow;
  static get screenWidth => ScreenUtil().screenWidth;
  static get screenHeight => ScreenUtil().screenHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
        borderRadius: BorderRadius.circular(radius ?? 16.r),
      ),
      child: ElevatedButton(
        onPressed: () {
          FocusScope.of(context).unfocus();
          onTap();
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          backgroundColor: backgroundColor ?? ColorManager.primaryColor,
          minimumSize: Size(
            width ?? screenWidth,
            height ?? screenHeight * 0.07,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 16.r),
            side: BorderSide(
              color: borderColor ?? ColorManager.primaryColor,
              width: 2,
            ),
          ),
        ),
        child:
            iconText == false
                ? Text(
                  lable,
                  style: TextStyles.font16WhiteBoldButton.copyWith(
                    fontSize: textSize ?? 16,
                    color: textColor ?? ColorManager.white,
                  ),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      nameIconButton ?? "",
                      color: nameIconColor,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      lable,
                      style: TextStyles.font16WhiteBoldButton.copyWith(
                        fontSize: textSize ?? 16,
                        color: textColor ?? ColorManager.white,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
