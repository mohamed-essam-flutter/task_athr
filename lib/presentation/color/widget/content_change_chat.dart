import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_athr/core/utils/text_style.dart';
import 'package:task_athr/core/widget/custom_button.dart';

class ContentGridView extends StatelessWidget {
  const ContentGridView({
    super.key,
    required this.items,
    required this.index,
  });

  final List<Color> items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 40.h,
          width: 110.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r),
            ),
            color: items[index],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Hi',
                style: TextStyles.font16WhiteBoldButton,
              ),
            ],
          ),
        ),
        Spacer(),
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
    );
  }
}
