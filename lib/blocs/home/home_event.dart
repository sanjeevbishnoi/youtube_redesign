import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class Fetch extends HomeEvent {
  @override
  String toString() => 'Fetch';
}