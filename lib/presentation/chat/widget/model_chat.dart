
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_athr/core/colors/color.dart';


class ChatMessage {
  final String id;
  final String text;
  final bool isMe;
  final bool isVoice;
  final String time;

  ChatMessage({
    required this.id,
    required this.text,
    required this.isMe,
    required this.time,
    this.isVoice = false,
  });
}

final List<ChatMessage> messages = [
  ChatMessage(id: '1', text: 'Hello, how are you doing?', isMe: true, time: '08:15 AM'),
  ChatMessage(id: '2', text: 'I’m doing well, thank you! How can I help you today?', isMe: false, time: '08:16 AM'),
  ChatMessage(id: '3', text: 'I have a question about the return policy for a product I purchased.', isMe: true, time: '08:15 AM'),
  ChatMessage(id: '4', text: 'I’m doing well, thank you! How can I help you today?', isMe: false, time: '08:16 AM'),
  ChatMessage(id: '5', text: 'voice', isMe: true, time: 'Just now', isVoice: true),
  ChatMessage(id: '6', text: 'ok', isMe: false, time: '08:16 AM'),
];

Widget buildMessage(ChatMessage message, Function(String) onDelete, BuildContext context) {
  final alignment = message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
  final color = message.isMe ? ColorManager.secondaryColor : Colors.white;
  final textColor = message.isMe ? Colors.white : Colors.black;
  final borderRadius = BorderRadius.only(
    topLeft: Radius.circular(12.r),
    topRight: Radius.circular(12.r),
    bottomLeft: message.isMe ? Radius.circular(12.r) : Radius.circular(0),
    bottomRight: message.isMe ? Radius.circular(0) : Radius.circular(12.r),
  );


  return GestureDetector(
    onLongPressStart: (details) async {
      final selected = await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(
          details.globalPosition.dx,
          details.globalPosition.dy,
          details.globalPosition.dx,
          details.globalPosition.dy,
        ),
        items: [
          PopupMenuItem(
            value: 'delete',
            child: Row(
              children: [
                Icon(Icons.delete, color: Colors.red),
                SizedBox(width: 5),
                Text('Delete message'),
              ],
            ),
          ),
        ],
      );

      if (selected == 'delete') {
        onDelete(message.id);
      }
    },
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          if (!message.isMe)
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 18.r,
                  backgroundImage: AssetImage('assets/image/profile.png'),
                ),
                SizedBox(width: 8.w),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: borderRadius,
                    ),
                    child: message.isVoice
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.play_arrow, color: textColor),
                              SizedBox(width: 8.w),
                              Text('Voice Message', style: TextStyle(color: textColor)),
                            ],
                          )
                        : Text(message.text, style: TextStyle(color: textColor)),
                  ),
                ),
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: borderRadius,
                    ),
                    child: message.isVoice
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.play_arrow, color: textColor),
                              SizedBox(width: 8.w),
                              Text('Voice Message', style: TextStyle(color: textColor)),
                            ],
                          )
                        : Text(message.text, style: TextStyle(color: textColor)),
                  ),
                ),
              ],
            ),
          SizedBox(height: 4.h),
          Text(
            message.time,
            style: TextStyle(fontSize: 10.sp, color: ColorManager.white),
          ),
        ],
      ),
    ),
  );
}
