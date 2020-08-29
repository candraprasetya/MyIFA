part of 'widgets.dart';

class TransactionCard extends StatelessWidget {
  final int index;
  final List<TransactionModel> model;
  TransactionCard(this.index, this.model);

  @override
  Widget build(BuildContext context) {
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
        settings: MoneyFormatterSettings(
            symbol: "IDR", compactFormatType: CompactFormatType.short),
        amount: model[index].transactionValue);
    MoneyFormatterOutput fo = fmf.output;

    return Container(
      padding: EdgeInsets.all(defMargin),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .12,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset((model[index].isOut)
                    ? "assets/icons/out.svg"
                    : "assets/icons/in.svg"),
              ),
              SizedBox(
                width: 18,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      strutStyle: StrutStyle(fontSize: 12.0),
                      text: TextSpan(
                          style: standardStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          text: model[index].transactionTitle),
                    ),
                  ),
                  Text(model[index].transactionDesc,
                      style: standardStyle.copyWith(
                        fontSize: 10,
                      ))
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: RichText(
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    strutStyle: StrutStyle(fontSize: 12.0),
                    text: TextSpan(
                        style: standardStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        text: (model[index].isOut)
                            ? "- ${fo.compactSymbolOnLeft}"
                            : "+ ${fo.compactSymbolOnLeft}"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    (model[index].transactionDate == DateTime.now())
                        ? Text(date(model[index].transactionDate),
                            style: standardStyle.copyWith(
                              fontSize: 8,
                            ))
                        : Text("${date(model[index].transactionDate)}",
                            style: standardStyle.copyWith(
                              fontSize: 8,
                            )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
