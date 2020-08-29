part of '../screens.dart';

class CardInsertScreen extends StatefulWidget {
  @override
  _CardInsertScreenState createState() => _CardInsertScreenState();
}

class _CardInsertScreenState extends State<CardInsertScreen> {
  TextEditingController addName = TextEditingController();
  TextEditingController addBank = TextEditingController();
  TextEditingController addExpires = TextEditingController();
  TextEditingController addNumber = TextEditingController();

  List<Color> colorCards = [primaryColor, yellowCassandra, green, blue, pink];
  String myNumber = "";
  String myName = "";
  String myBank = "";
  String myExpires = "";
  int selected = 0;

  _CardInsertScreenState();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.toNamed("/cards");
        return;
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
                child: TopBar(
              centerTitle: "Add New Card",
              icon: CupertinoIcons.back,
              iconEnd: CupertinoIcons.check_mark_circled,
              onTap: () {
                Get.toNamed("/cards");
              },
              fun: () {
                cardList.add(CardModel(
                    cardColor: colorCards[selected],
                    cardNumber: myNumber.removeAllWhitespace(myNumber),
                    cardName: myBank,
                    cardHolder: myName,
                    cardExpires: myExpires));
                Get.toNamed("/cards");
                Get.snackbar("Add New Card", "Success");
              },
            )),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    DelayedDisplay(
                      delay: Duration(milliseconds: 1000),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: defMargin, vertical: 5),
                        child: CardStyle(
                          cardColor: colorCards[selected],
                          cardExpires: myExpires ?? "00/00",
                          cardHolder: myName ?? "YourName",
                          cardName: myBank ?? "YourBank",
                          cardNumber: myNumber,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          DelayedDisplay(
                            delay: Duration(milliseconds: 1200),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defMargin, vertical: 5),
                                child: CardTextInput(
                                  controller: addBank,
                                  placeHolder: "Bank Name",
                                  title: "Bank Name",
                                  inputType: TextInputType.name,
                                  onChanged: (value) {
                                    setState(() {
                                      myBank = value;
                                    });
                                  },
                                  onCompleted: () {
                                    if (myNumber.length > 0) {
                                      GetStorage box = GetStorage();
                                      box.write("BankNameInput", myBank);
                                    }
                                  },
                                )),
                          ),
                          DelayedDisplay(
                              delay: Duration(milliseconds: 1400),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: defMargin, vertical: 5),
                                  child: CardTextInput(
                                    controller: addNumber,
                                    placeHolder: "Card Number",
                                    title: "Card Number",
                                    inputType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        myNumber = value;
                                      });
                                    },
                                    onCompleted: () {
                                      if (myNumber.length > 0) {
                                        GetStorage box = GetStorage();
                                        box.write("CardNumberInput", myNumber);
                                      }
                                      if (myNumber.length <= 15) {
                                        Get.snackbar("Error",
                                            "Card Number Must Be 16 Digits");
                                      }
                                    },
                                  ))),
                          DelayedDisplay(
                              delay: Duration(milliseconds: 1600),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defMargin, vertical: 5),
                                child: CardTextInput(
                                  controller: addName,
                                  placeHolder: "Your Name",
                                  inputType: TextInputType.name,
                                  title: "Your Name",
                                  onCompleted: () {
                                    if (myName.length > 0) {
                                      GetStorage box = GetStorage();
                                      box.write("CardHolderInput", myName);
                                    }
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      myName = value;
                                    });
                                  },
                                ),
                              )),
                          DelayedDisplay(
                              delay: Duration(milliseconds: 1800),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defMargin, vertical: 5),
                                child: CardTextInput(
                                  controller: addExpires,
                                  placeHolder: "Card Expires",
                                  inputType: TextInputType.number,
                                  title: "Card Expires",
                                  onChanged: (value) {
                                    setState(() {
                                      myExpires = value;
                                    });
                                  },
                                  onCompleted: () {
                                    if (myExpires.length > 0) {
                                      GetStorage box = GetStorage();
                                      box.write("CardExpiresInput", myExpires);
                                    }
                                  },
                                ),
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 120,
                            padding: EdgeInsets.symmetric(
                                horizontal: defMargin, vertical: 20),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: colorCards.length,
                                itemBuilder: (context, index) => DelayedDisplay(
                                      delay: Duration(
                                          milliseconds: 2000 + index * 100),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            selected = index;
                                          });
                                        },
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          margin: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              boxShadow: (index == selected)
                                                  ? [
                                                      BoxShadow(
                                                        blurRadius: 10,
                                                        color:
                                                            colorCards[index],
                                                      )
                                                    ]
                                                  : [],
                                              color: colorCards[index],
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                    )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

