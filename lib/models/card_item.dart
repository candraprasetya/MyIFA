part of 'models.dart';

class CardModel {
  final Color cardColor;
  final String cardNumber;
  final String cardName;
  final String cardHolder;
  final String cardExpires;

  CardModel(
      {@required this.cardColor,
      @required this.cardNumber,
      @required this.cardName,
      @required this.cardHolder,
      @required this.cardExpires});
}

final cardList = [
  CardModel(
      cardColor: orangCoral,
      cardName: "JENIUS",
      cardHolder: "Candra Ramadhan Prasetya",
      cardNumber: "3725600687911234",
      cardExpires: "12/24"),
  CardModel(
      cardColor: jostBlue,
      cardName: "BCA",
      cardNumber: "6574887609124543",
      cardHolder: "Tsamara",
      cardExpires: "10/22")
];
