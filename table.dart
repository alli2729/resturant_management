class Table {
  // Variable
  final int number;
  final int capacity;
  String status; // can be : free , close , reserved
  // Constractor
  Table({required int this.number, required int this.capacity})
      : status = 'free';

  // Methods
  @override
  String toString() =>
      '(table $number : $capacity capacity , table is $status)';
}
