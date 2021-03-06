import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:myapp/components/test.dart';
import 'package:myapp/components/working.dart';
import 'package:myapp/pages/auth/index.dart';
import 'package:myapp/pages/chat/chat_operate.dart';
import 'package:myapp/pages/chat/index.dart';
import 'package:myapp/pages/draw_item/couple_space/index.dart';
import 'package:myapp/pages/home/HomePage.dart';
import 'package:myapp/pages/meet_you/index.dart';
import 'package:myapp/pages/mine/happy_everyday.dart';
import 'package:myapp/pages/personal_page/index.dart';
import 'package:myapp/pages/personal_page/personal_page_items/gallery.dart';
import 'package:myapp/pages/register/register.dart';
import 'package:myapp/pages/setting/index.dart';
import 'package:myapp/pages/social_space/index.dart';
import 'package:myapp/pages/splash/index.dart';
import 'package:myapp/pages/videoPage/video.dart';
import 'package:myapp/pages/webviewPage/index.dart';

List<GetPage> routes = [
  GetPage(name: '/', page: () => const Splash(), transition: Transition.fadeIn),
  GetPage(name: '/auth', page: () => const AuthPage(), transition: Transition.fadeIn),
  GetPage(name: '/home', page: () => const MainPage(), transition: Transition.fadeIn),
  GetPage(name: '/register', page: () => const RegisterCreate(), transition: Transition.fadeIn),
  GetPage(name: '/video', page: () => const VideoApp(), transition: Transition.fadeIn),
  GetPage(name: '/chat', page: () => const ChatWin(), transition: Transition.noTransition),
  GetPage(name: '/setting', page: () => const Setting(), transition: Transition.fadeIn),
  GetPage(name: '/space', page: () => const SocialSpace(), transition: Transition.fadeIn),
  GetPage(name: '/personalHome', page: () => const PersonalPage(), transition: Transition.fadeIn),
  GetPage(name: '/gallery', page: () => const Gallery(), transition: Transition.fadeIn),
  GetPage(name: '/coupleSpace', page: () => const CoupleSpace(), transition: Transition.fadeIn),
  GetPage(name: '/happy', page: () => const HappYEveryDay(), transition: Transition.fade),
  GetPage(name: '/meetyou', page: () => const RadarPage(), transition: Transition.fadeIn),
  GetPage(name: '/working', page: () => const Working(), transition: Transition.fadeIn),
  GetPage(name: '/webview', page: () => const MyWebView(), transition: Transition.fadeIn),
  GetPage(
      name: '/chatSetting', page: () => const ChatSetting(), transition: Transition.rightToLeft),
  GetPage(name: '/test', page: () => const Test(), transition: Transition.fadeIn),
];
