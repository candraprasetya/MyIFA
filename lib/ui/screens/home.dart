part of 'screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItemPosition = 0;
  SnakeShape customSnakeShape = SnakeShape(
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      centered: true);
  ShapeBorder customBottomBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25), topRight: Radius.circular(25)),
  );
  ShapeBorder customBottomBarShape1 = BeveledRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25), topRight: Radius.circular(25)),
  );

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: background,
      bottomNavigationBar: SnakeNavigationBar(
        snakeColor: primaryColor,
        elevation: 40,
        shadowColor: primaryColor.withOpacity(.3),
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        style: SnakeBarStyle.floating,
        currentIndex: selectedItemPosition,
        onPositionChanged: onChangedPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.lab_flask), title: Text('Projects')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), title: Text('Account'))
        ],
      ),
      body: AnimatedContainer(
        color: background,
        duration: Duration(seconds: 1),
        child: PageView(
          controller: pageController,
          onPageChanged: onChangedPage,
          children: <Widget>[Dashboard(), Projects()],
        ),
      ),
    );
  }

  void onChangedPage(int value) {
    setState(() {
      selectedItemPosition = value;
    });
    pageController.jumpToPage(value);
  }
}
