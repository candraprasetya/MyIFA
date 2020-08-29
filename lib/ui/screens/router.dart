part of 'screens.dart';

router() => [
      GetPage(name: "/", page: () => SplashScreen()),
      GetPage(name: "/home", page: () => HomeScreen()),
      GetPage(name: "/cards", page: () => CardScreen()),
      GetPage(name: "/onboard", page: () => OnBoardingScreen()),
      GetPage(name: "/cardInsert", page: () => CardInsertScreen())
    ];
