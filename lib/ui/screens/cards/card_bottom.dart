part of '../screens.dart';

class CardModalSheet extends StatefulWidget {
  @override
  _CardModalSheetState createState() => _CardModalSheetState();
}

class _CardModalSheetState extends State<CardModalSheet> {
  bool isOut = false;
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          40, 40, 40, MediaQuery.of(context).viewInsets.bottom + 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CupertinoTextField(
            padding: EdgeInsets.all(10),
            maxLines: 1,
            controller: title,
            placeholder: "Title",
          ),
          SizedBox(
            height: 10,
          ),
          CupertinoTextField(
            padding: EdgeInsets.all(10),
            maxLines: 1,
            controller: desc,
            placeholder: "Description",
          ),
          SizedBox(
            height: 10,
          ),
          CupertinoTextField(
            padding: EdgeInsets.all(10),
            maxLines: 1,
            controller: value,
            placeholder: "Value IDR",
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: (isOut) ? 20 : 0,
                              color: (isOut)
                                  ? orangCoral.withOpacity(.6)
                                  : Colors.white)
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: (isOut)
                            ? orangCoral.withOpacity(.8)
                            : orangCoral.withOpacity(.1)),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            isOut = !isOut;
                          });
                        },
                        child: SvgPicture.asset(
                          "assets/icons/out.svg",
                          color: (isOut) ? white : orangCoral,
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: (!isOut) ? 20 : 0,
                              color: (!isOut)
                                  ? green.withOpacity(.6)
                                  : Colors.white)
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: (!isOut)
                            ? green.withOpacity(.8)
                            : green.withOpacity(.1)),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            isOut = !isOut;
                          });
                        },
                        child: SvgPicture.asset(
                          "assets/icons/in.svg",
                          color: (!isOut) ? white : green,
                        )),
                  )
                ],
              ),
              CupertinoButton.filled(
                  child: Text('Add'),
                  onPressed: () {
                    if (title.text.isEmpty ||
                        desc.text.isEmpty ||
                        value.text.isEmpty) {
                      Navigator.pop(context);
                      Get.snackbar("Error", "Please fill all textfield!");
                    } else {
                      transactionList.add(TransactionModel(
                          isOut: isOut,
                          transactionTitle: title.text,
                          transactionDesc: desc.text,
                          transactionValue: double.parse(value.text),
                          transactionDate: DateTime.now()));
                      Get.toNamed('cards');
                      Get.snackbar("Success", "New Transactions Added");
                    }
                  }),
            ],
          )
        ],
      ),
    );
  }
}
