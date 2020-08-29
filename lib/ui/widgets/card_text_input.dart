part of 'widgets.dart';

class CardTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String placeHolder;
  final Function onChanged;
  final Function onCompleted;
  final TextInputType inputType;

  const CardTextInput(
      {Key key,
      this.controller,
      this.title,
      this.placeHolder,
      this.onChanged,
      this.onCompleted,
      this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: standardStyle.copyWith(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          CupertinoTextField(
              controller: controller,
              inputFormatters: (title == "Card Number")
                  ? [
                      WhitelistingTextInputFormatter.digitsOnly,
                      new LengthLimitingTextInputFormatter(16),
                      CardNumberInputFormatter()
                    ]
                  : (title == "Card Expires")
                      ? [
                          WhitelistingTextInputFormatter.digitsOnly,
                          new LengthLimitingTextInputFormatter(4),
                          CardExpiresInputFormatter()
                        ]
                      : [],
              keyboardType: inputType,
              style: standardStyle,
              placeholder: placeHolder,
              decoration: BoxDecoration(),
              onEditingComplete: onCompleted,
              onChanged: onChanged),
        ],
      ),
    );
  }
}

class CardExpiresInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
        buffer.write('/'); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}
