import 'package:equatable/equatable.dart';

class NumberTrivia extends Equatable {
  final String text;
  final int number;

  // Constructor for creating a NumberTrivia instance.
  const NumberTrivia({required this.text, required this.number});

  // Override for Equatable, specifies properties for equality comparison.
  @override
  List<Object?> get props => [text, number];
}
