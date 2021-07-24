import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:myapp/components/my_rive.dart';
import 'package:myapp/pages/chat/index.dart';
import 'package:myapp/pages/friends/index.dart';
import 'package:myapp/pages/home/HomePage.dart';
import 'package:myapp/pages/mine/index.dart';
import 'package:myapp/pages/moodSpace/index.dart';
import 'package:myapp/pages/personal_home/gallery.dart';
import 'package:myapp/pages/personal_home/index.dart';
import 'package:myapp/pages/register/register.dart';
import 'package:myapp/pages/setting/index.dart';
import 'package:myapp/pages/splash/index.dart';
import 'package:myapp/pages/videoPage/video.dart';
import 'package:myapp/pages/auth/index.dart';

List<GetPage> routes = [
  GetPage(name: '/', page: () => const Splash(), transition: Transition.fadeIn),
  GetPage(name: '/auth', page: () => const AuthPage(), transition: Transition.fadeIn),
  GetPage(name: '/home', page: () => const MainPage(), transition: Transition.fadeIn),
  GetPage(name: '/register', page: () => const RegisterCreate(), transition: Transition.fadeIn),
  GetPage(name: '/video', page: () => const VideoApp(), transition: Transition.fadeIn),
  GetPage(name: '/chat', page: () => const ChatWin(), transition: Transition.fadeIn),
  GetPage(name: '/mine', page: () => const Mine(), transition: Transition.fadeIn),
  GetPage(name: '/setting', page: () => const Setting(), transition: Transition.fadeIn),
  GetPage(name: '/friends', page: () => const Friends(), transition: Transition.fadeIn),
  GetPage(name: '/social', page: () => const MoodSpace(), transition: Transition.fadeIn),
  GetPage(name: '/mine', page: () => const Mine(), transition: Transition.fadeIn),
  GetPage(name: '/personalHome', page: () => const PersonalHome(), transition: Transition.fadeIn),
  GetPage(name: '/gallery', page: () => const Gallery(), transition: Transition.fadeIn),
  GetPage(name: '/rive', page: () => const MyRive(), transition: Transition.fadeIn),
];
