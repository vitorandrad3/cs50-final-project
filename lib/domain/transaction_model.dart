class Transaction {
  Transaction(
      {required this.date,
      required this.id,
      required this.description,
      required this.value});

  final String id;
  final String description;
  final double value;
  final DateTime date;
}
