import 'package:flutter/widgets.dart';

import 'package:flutter_application_1/modeules/splash/screens/layout/Layout_view.dart';
import 'package:flutter_application_1/modeules/splash/screens/layout/home/HomeView.dart';
import 'package:flutter_application_1/modules/authorization/login_page.dart';
import 'package:flutter_application_1/modules/authorization/signUpPage.dart';
import 'package:flutter_application_1/modules/event_creation/event_creation_view.dart';
import 'package:flutter_application_1/modules/onbording/onbording_screen.dart';
import 'package:flutter_application_1/modules/splash/splash_screen.dart';





class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SplashScreen.route: (context) => const SplashScreen(),
   
    LoginPage.route:(context)=>const LoginPage(),
    OnboardingScreen.route:(context)=>const OnboardingScreen(),
    
    SignUpPage.route: (context) => const SignUpPage(),
     HomeView.route:(context)=>  HomeView(),
     LayoutView.route:(context)=>const LayoutView(),
     EventCreationView.route:(context)=>const EventCreationView(),
    

   

  };
}
