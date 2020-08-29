part of 'widgets.dart';

class CardKu extends StatelessWidget {
  final int cardIndex;

  CardKu(this.cardIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - defMargin * 2,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              cardList[cardIndex].cardColor,
              cardList[cardIndex].cardColor.withOpacity(.7)
            ]),
        color: cardList[cardIndex].cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: AutoSizeText(
                cardList[cardIndex].cardName,
                style: standardStyle.copyWith(
                  fontSize: 18,
                  color: white,
                ),
              )),
          SvgPicture.asset(
            "assets/icons/chip.svg",
            color: white.withOpacity(.6),
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                cardList[cardIndex].cardNumber.substring(0, 4) ?? "0000",
                style: standardStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w600, color: white),
              ),
              AutoSizeText(
                cardList[cardIndex].cardNumber.substring(4, 8) ?? "0000",
                style: standardStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w600, color: white),
              ),
              AutoSizeText(
                cardList[cardIndex].cardNumber.substring(8, 12) ?? "0000",
                style: standardStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w600, color: white),
              ),
              AutoSizeText(
                cardList[cardIndex].cardNumber.substring(12, 16) ?? "0000",
                style: standardStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w600, color: white),
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText("Card Holder",
                  style: standardStyle.copyWith(
                    color: white,
                    fontSize: 10,
                  )),
              AutoSizeText("Expires",
                  style: standardStyle.copyWith(
                    color: white,
                    fontSize: 10,
                  )),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: AutoSizeText(
                cardList[cardIndex].cardHolder ?? "YourName",
                overflow: TextOverflow.ellipsis,
                style: standardStyle.copyWith(
                    color: white, fontSize: 14, fontWeight: FontWeight.w600),
              )),
              AutoSizeText(
                cardList[cardIndex].cardExpires ?? "00/00",
                style: standardStyle.copyWith(
                    color: white, fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CardStyle extends StatelessWidget {
  final Color cardColor;
  final String cardName;
  final String cardNumber;
  final String cardHolder;
  final String cardExpires;

  const CardStyle(
      {Key key,
      this.cardColor,
      this.cardName,
      this.cardNumber,
      this.cardHolder,
      this.cardExpires})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - defMargin * 2,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [cardColor, cardColor.withOpacity(.7)]),
        color: cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: Text(
                cardName,
                style: standardStyle.copyWith(
                  fontSize: 18,
                  color: white,
                ),
              )),
          SvgPicture.asset(
            "assets/icons/chip.svg",
            color: white.withOpacity(.6),
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                (cardNumber.length >= 4) ? cardNumber.substring(0, 4) : "0000",
                style: standardStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w600, color: white),
              ),
              Text(
                (cardNumber.length >= 10)
                    ? cardNumber.substring(6, 10)
                    : "0000",
                style: standardStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w600, color: white),
              ),
              Text(
                (cardNumber.length >= 16)
                    ? cardNumber.substring(12, 16)
                    : "0000",
                style: standardStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w600, color: white),
              ),
              Text(
                (cardNumber.length >= 22)
                    ? cardNumber.substring(18, 22)
                    : "0000",
                style: standardStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w600, color: white),
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Card Holder",
                  style: standardStyle.copyWith(
                    color: white,
                    fontSize: 10,
                  )),
              Text("Expires",
                  style: standardStyle.copyWith(
                    color: white,
                    fontSize: 10,
                  )),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  strutStyle: StrutStyle(fontSize: 12.0),
                  text: TextSpan(
                      style: standardStyle.copyWith(
                          fontSize: 14,
                          color: white,
                          fontWeight: FontWeight.w600),
                      text: cardHolder ?? "YourName"),
                ),
              ),
              Text(
                cardExpires ?? "00/00",
                style: standardStyle.copyWith(
                    color: white, fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}
