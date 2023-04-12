class MyTransaction {
  MyTransaction(
      {required this.date,
      required this.id,
      required this.description,
      required this.value});

  final String id;
  final String description;
  final double value;
  final DateTime date;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'value': value,
      'date': date.toString(),
    };
  }

  static MyTransaction fromMap(Map<String, dynamic> map) {
    return MyTransaction(
      id: map['id'],
      description: map['description'],
      value: map['value'],
      date: DateTime.parse(map['date']),
    );
  }
}
