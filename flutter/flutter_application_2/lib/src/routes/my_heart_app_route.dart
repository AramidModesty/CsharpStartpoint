import 'package:flutter_application_2/src/feature/screens/age_screen.dart';
import 'package:flutter_application_2/src/feature/screens/bmi_calc.dart';
import 'package:flutter_application_2/src/feature/screens/home_screen.dart';
import 'package:flutter_application_2/src/feature/screens/zodiac_screen.dart';
import 'package:go_router/go_router.dart';
class MyHeartAppRoute {
    static final GoRouter router = GoRouter(
      routes: [
          GoRoute(path: '/', builder: (context, state) => const HomeScreen()
          ),
          GoRoute(path: '/age', builder: (context, state) => const AgeScreen()
          ),
          GoRoute(path: '/bmi', builder: (context, state) => const BmiCalc()
          ),
          GoRoute(path: '/zodiac', builder: (context, state) => const ZodiacScreen()
          ),
      ]
    );

}