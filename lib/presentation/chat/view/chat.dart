import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_athr/core/colors/color.dart';
import 'package:task_athr/core/routes/routes_manager.dart';
import 'package:task_athr/core/utils/text_style.dart';
import 'package:task_athr/core/widget/customm_app_bar.dart';
import 'package:task_athr/core/widget/text_form_feild.dart';
import 'package:task_athr/presentation/chat/widget/model_chat.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isRecording = false;
  void deleteMessage(String id) {
    setState(() {
      messages.removeWhere((msg) => msg.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              content: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/image/profile.png'),
                  ),
                  SizedBox(width: 7.w),
                  Expanded(
                    child: Text(
                      'Maria',
                      style: TextStyles.font20PrimarySemiBold,
                    ),
                  ),
                  SvgPicture.asset('assets/icons/Vector.svg'),
                  SizedBox(width: 7.w),
                  PopupMenuButton<String>(
                    icon: SvgPicture.asset('assets/icons/setting.svg'),
                    onSelected: (value) {
                      if (value == 'chatbox') {
                        Navigator.pushNamed(
                          context,
                          RoutesManager.changeChatBoxScreen,
                        );
                      } else if (value == 'background') {
                        Navigator.pushNamed(
                          context,
                          RoutesManager.changeBackgroundScreen,
                        );
                      }
                    },
                    itemBuilder:
                        (BuildContext context) => [
                          PopupMenuItem<String>(
                            value: 'chatbox',
                            child: Text('Change ChatBox'),
                          ),
                          PopupMenuItem<String>(
                            value: 'background',
                            child: Text('Change Background'),
                          ),
                          PopupMenuItem<String>(
                            value: 'delete',
                            child: Text('Delete Chat'),
                          ),
                        ],
                  ),
                ],
              ),
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
                  ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    itemCount: messages.length,
                    itemBuilder:
                        (context, index) => buildMessage(
                          messages[index],
                          deleteMessage,
                          context,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
     bottomNavigationBar: isRecording
    ? Container(
        height: 105.h,
        color: ColorManager.primaryColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Row(
            children: [
              Icon(Icons.mic, color: Colors.white, size: 30.sp),
              SizedBox(width: 10.w),
              Image.asset('assets/image/sound.png',width: 230.w,),
              IconButton(
                icon: Icon(Icons.stop, color: Colors.white, size: 28.sp),
                onPressed: () {
                  setState(() {
                    isRecording = false;
                  });
                },
              ),
            ],
          ),
        ),
      )
    : Stack(
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRecording = true;
                      });
                    },
                    child: SvgPicture.asset('assets/icons/microphone.svg'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
