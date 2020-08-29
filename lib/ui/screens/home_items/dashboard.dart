part of '../screens.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String hitung = transactionList
        .where((element) => element.transactionDesc == "Project")
        .length
        .toString();

    double uangku = transactionList
        .where((element) => element.transactionDesc == "Project")
        .map((e) => double.parse(e.transactionValue.toString()))
        .reduce((value, element) => value + element);

    double nonProject = transactionList
        .where((element) => element.transactionDesc != "Project")
        .map((e) => double.parse(e.transactionValue.toString()))
        .reduce((value, element) => value + element);

    FlutterMoneyFormatter fmfp = FlutterMoneyFormatter(
        settings: MoneyFormatterSettings(
            symbol: "IDR", compactFormatType: CompactFormatType.short),
        amount: uangku - nonProject);

    MoneyFormatterOutput fop = fmfp.output;

    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
        settings: MoneyFormatterSettings(
            symbol: "IDR", compactFormatType: CompactFormatType.short),
        amount: uangku);
    MoneyFormatterOutput fo = fmf.output;
    return ListView(
      children: [
        DelayedDisplay(
            fadingDuration: Duration(milliseconds: 1400),
            slidingCurve: Curves.fastOutSlowIn,
            child: textField(context)),
        DelayedDisplay(
            slidingCurve: Curves.fastOutSlowIn,
            delay: Duration(seconds: 1),
            child: textTitle("Hello, Candra!")),
        DelayedDisplay(
            delay: Duration(milliseconds: 800),
            slidingCurve: Curves.fastOutSlowIn,
            child: boxItems(context)),
        DelayedDisplay(
            slidingCurve: Curves.fastOutSlowIn,
            delay: Duration(seconds: 1),
            child: textTitle("Balance")),
        Padding(
          padding: EdgeInsets.all(defMargin),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: BoxBalance(
                      duration: 1000,
                      isBalance: false,
                      color: primaryColor,
                      desc: "Projects on progress",
                      value: "4")),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 1,
                  child: BoxBalance(
                    duration: 1200,
                    isBalance: false,
                    color: pink,
                    desc: "Projects Finished",
                    value: hitung,
                  )),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defMargin),
          child: BoxBalance(
            isBalance: true,
            color: pink,
            duration: 1600,
            value: fop.nonSymbol,
            desc: "IDR",
          ),
        )
      ],
    );
  }

  Widget textField(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 800),
        margin: EdgeInsets.all(20),
        decoration:
            BoxDecoration(color: white, borderRadius: BorderRadius.circular(6)),
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          maxLines: 1,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              prefix: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  CupertinoIcons.search,
                  size: 14,
                  color: blackPearl,
                ),
              ),
              hintText: "Search what interests you",
              hintStyle: standardStyle.copyWith(
                  color: blackPearl.withOpacity(.4), fontSize: 14),
              border: InputBorder.none),
        ),
      ),
    );
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

  Widget boxItems(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defMargin),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: blackPearl.withAlpha(10), blurRadius: 20, spreadRadius: 5)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DelayedDisplay(
                delay: Duration(milliseconds: 1000),
                child: BoxItem(
                  color: green,
                  icon: icCreditCard,
                  text: "Cards",
                  function: () {
                    Get.toNamed("/cards");
                    //context.bloc<ScreenBloc>().add(GoToCardScreen());
                  },
                ),
              ),
              DelayedDisplay(
                delay: Duration(milliseconds: 1200),
                child: BoxItem(
                  color: blue,
                  icon: icCalendar,
                  text: "Installment",
                  function: () {},
                ),
              ),
              DelayedDisplay(
                delay: Duration(milliseconds: 1400),
                child: BoxItem(
                  color: softPurple,
                  icon: icMoney,
                  text: "Loan",
                  function: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DelayedDisplay(
                delay: Duration(milliseconds: 1600),
                child: BoxItem(
                  color: primaryDarkColor,
                  icon: icLove,
                  text: "Invest",
                  function: () {},
                ),
              ),
              DelayedDisplay(
                delay: Duration(milliseconds: 1800),
                child: BoxItem(
                  color: violet,
                  icon: icDocuments,
                  text: "Data",
                  function: () {},
                ),
              ),
              DelayedDisplay(
                delay: Duration(milliseconds: 2000),
                child: BoxItem(
                  color: pink,
                  icon: icNotif,
                  text: "Service",
                  function: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
