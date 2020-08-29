part of 'screens.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (currentIndex < 2) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
    });
  }

  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  bool ending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    onPageChanged: onPageChanged,
                    itemCount: sliderArrayList.length,
                    itemBuilder: (ctx, i) => SlideItem(i)),
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    (currentIndex >= 2)
                        ? Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(right: 15.0, bottom: 15.0),
                              child: InkWell(
                                onTap: () {
                                  saveSettingsTrueFalse(true, "onBoard");
                                  Get.offAndToNamed("/home");
                                },
                                child: Text(Constants.NEXT,
                                    style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                          )
                        : SizedBox(),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
                        child: InkWell(
                          onTap: () async {
                            saveSettingsTrueFalse(true, "onBoard");
                            Get.offAndToNamed("/home");
                            //context.bloc<ScreenBloc>().add(GoToHomeScreen());
                          },
                          child: Text(Constants.SKIP,
                              style: GoogleFonts.openSans(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.bottomCenter,
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < sliderArrayList.length; i++)
                            if (i == currentIndex)
                              SlideDots(true)
                            else
                              SlideDots(false)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
