part of 'screens.dart';

class CardScreen extends StatefulWidget {
  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    bool isOut = false;

    var sortedTransactions = transactionList;
    sortedTransactions.sort((trans2, trans1) =>
        trans1.transactionDate.compareTo(trans2.transactionDate));

    return WillPopScope(
        onWillPop: () async {
          Get.toNamed("/home");
          // context.bloc<ScreenBloc>().add(GoToHomeScreen());
          return;
        },
        child: Scaffold(
          backgroundColor: background,
          resizeToAvoidBottomInset: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: TopBar(
                  fun: () {
                    Get.toNamed("/cardInsert");

                    // Get.toNamed("/home");
                    // Get.snackbar("Success", "Card n Transactions Added");
                  },
                  centerTitle: "Cards",
                  icon: CupertinoIcons.back,
                  iconEnd: CupertinoIcons.add_circled,
                  onTap: () {
                    Get.toNamed("/home");
                  },
                ),
              ),
              Expanded(
                flex: 4,
                //height: MediaQuery.of(context).size.height * .37,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: cardList.length,
                    itemBuilder: (ctx, i) => Padding(
                          padding: EdgeInsets.fromLTRB(
                              (i == 0) ? defMargin : 10,
                              defMargin,
                              (i == cardList.length - 1) ? defMargin : 0,
                              defMargin),
                          child: DelayedDisplay(
                              slidingCurve: Curves.easeOutQuint,
                              delay: Duration(milliseconds: 500 + i * 200),
                              child: CardKu(i)),
                        )),
              ),
              DelayedDisplay(
                  slidingCurve: Curves.fastOutSlowIn,
                  delay: Duration(seconds: 1),
                  child: textTitle("Recent Transactions")),
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: sortedTransactions.length,
                        itemBuilder: (ctx, i) => Padding(
                              padding: EdgeInsets.fromLTRB(
                                  defMargin,
                                  (i == 0) ? 0 : 10,
                                  defMargin,
                                  (i == transactionList.length - 1)
                                      ? defMargin
                                      : 0),
                              child: DelayedDisplay(
                                  slidingCurve: Curves.easeOutQuint,
                                  delay: Duration(milliseconds: 800 + i * 200),
                                  child:
                                      TransactionCard(i, sortedTransactions)),
                            )),
                    DelayedDisplay(
                      delay: Duration(milliseconds: 800),
                      slidingCurve: Curves.elasticOut,
                      slidingBeginOffset: Offset(2, 0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: EdgeInsets.all(defMargin),
                          padding: EdgeInsets.all(defMargin),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    offset: Offset(2, 8),
                                    color: primaryColor.withOpacity(.4))
                              ]),
                          child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40.0),
                                          topRight: Radius.circular(40.0)),
                                    ),
                                    builder: (context) {
                                      return CardModalSheet();
                                    });
                              },
                              child: Icon(CupertinoIcons.add_circled,
                                  color: white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget textTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(left: defMargin),
      child: Text(
        text,
        style: standardStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
