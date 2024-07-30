part of 'auto_fill_bloc.dart';

sealed class AutoFillState {
  final List<String> state;
  final List<String> city;

  AutoFillState({required this.state, required this.city});
}

final class AutoFillInitial extends AutoFillState {
  AutoFillInitial({required super.state, required super.city});
}
