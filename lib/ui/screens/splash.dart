part of 'screens.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() async {
    var duration = Duration(milliseconds: 2000);
    return new Timer(duration, () {
      if (status == true) {
        Get.offAndToNamed("/home");
        //context.bloc<ScreenBloc>().add(GoToHomeScreen());
      } else {
        Get.offAndToNamed("/onboard");
        //context.bloc<ScreenBloc>().add(GoToOnBoardingScreen());
      }
    });
  }

  void getSettings() async {
    SharedPreferences shareds = await SharedPreferences.getInstance();
    setState(() {
      status = (shareds.getBool("onBoard") ?? false);
    });
  }

  @override
  void initState() {
    super.initState();
    getSettings();
    startTimer();
    print(status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [primaryColor, primaryDarkColor])),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                logoImage,
                height: 120,
                width: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Starting MyIFA App...',
                  style: GoogleFonts.openSans(color: white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
