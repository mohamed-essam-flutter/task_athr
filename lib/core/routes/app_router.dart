import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_athr/core/routes/routes_manager.dart';
import 'package:task_athr/presentation/chat/view/chat.dart';
import 'package:task_athr/presentation/color/view/change_background.dart';
import 'package:task_athr/presentation/color/view/change_chat_box.dart';
class AppRouter {
  // on Generate Route
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.chat:
        return CupertinoPageRoute(builder: (_) => const ChatScreen());
      case RoutesManager.changeChatBoxScreen:
        return CupertinoPageRoute(builder: (_) => const ChangeChatBoxScreen());
        case RoutesManager.changeBackgroundScreen:
        return CupertinoPageRoute(builder: (_) => const ChangeBackgroundScreen());
      default:
        return CupertinoPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}