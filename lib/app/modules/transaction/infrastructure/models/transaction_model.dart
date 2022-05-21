import '../../domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  final String titleTransaction;
  final String descriptionTransaction;
  final double valueMoneyTransaction;

  TransactionModel({
    required this.titleTransaction,
    required this.descriptionTransaction,
    required this.valueMoneyTransaction,
  }) : super(
          description: descriptionTransaction,
          title: titleTransaction,
          valueMoney: valueMoneyTransaction,
        );

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      titleTransaction: map['title'],
      descriptionTransaction: map['description'],
      valueMoneyTransaction: map['value'],
    );
  }
  toMap() {}
}
