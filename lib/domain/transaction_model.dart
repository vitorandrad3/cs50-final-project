class Transaction {
  Transaction(
      {required this.date,
      required this.id,
      required this.name,
      required this.value});

  final String id;
  final String name;
  final double value;
  final DateTime date;
}
