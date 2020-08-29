part of 'models.dart';

class TransactionModel {
  final bool isOut;
  final String transactionTitle;
  final String transactionDesc;
  final double transactionValue;
  final DateTime transactionDate;

  TransactionModel(
      {@required this.isOut,
      @required this.transactionTitle,
      @required this.transactionDesc,
      @required this.transactionValue,
      @required this.transactionDate});
}

final transactionList = [
  TransactionModel(
      isOut: true,
      transactionTitle: "Indomaret",
      transactionDesc: "Coffee",
      transactionValue: 12000,
      transactionDate: DateTime.now()),
  TransactionModel(
      isOut: false,
      transactionTitle: "SmartBirth",
      transactionDesc: "Project",
      transactionValue: 1000000,
      transactionDate: DateTime.now().subtract(Duration(days: 40))),
  TransactionModel(
      isOut: false,
      transactionTitle: "JualMotorBekas.ID",
      transactionDesc: "Project",
      transactionValue: 3000000,
      transactionDate: DateTime.now().subtract(Duration(days: 1))),
];
