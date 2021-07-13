import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:myapp/pages/chat/index.dart';
import 'package:myapp/pages/home/HomePage.dart';
import 'package:myapp/pages/login/Login.dart';
import 'package:myapp/pages/mine/index.dart';
import 'package:myapp/pages/register/register.dart';
import 'package:myapp/pages/setting/index.dart';
import 'package:myapp/pages/videoPage/video.dart';
import 'package:myapp/pages/welcome/welcomePage.dart';

List<GetPage> routes = [
  GetPage(name: '/auth', page: () => const WelcomePage(), transition: Transition.fadeIn),
  GetPage(name: '/home', page: () => const MainPage(title: 'hello'),transition: Transition.zoom),
  GetPage(name: '/login', page: () => const Login(),transition: Transition.zoom),
  GetPage(name: '/register', page: () => const RegisterCreate(), transition: Transition.fadeIn),
  GetPage(name: '/video', page: () => const VideoApp(), transition: Transition.fadeIn),
  GetPage(name: '/chat', page: () => const ChatWin(), transition: Transition.fadeIn),
  GetPage(name: '/mine', page: () => const Mine(), transition: Transition.fadeIn),
  GetPage(name: '/setting', page: () => const Setting(), transition: Transition.leftToRight),
];