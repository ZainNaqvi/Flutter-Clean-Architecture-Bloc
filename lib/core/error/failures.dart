import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List<Object?> properties;
  const Failure({required this.properties});
  // Override for Equatable, specifies properties for equality comparison.
  @override
  List<Object?> get props => [properties];
}
