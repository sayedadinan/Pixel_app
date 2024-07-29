part of 'validation_bloc.dart';

@immutable
sealed class ValidationEvent {}

class PanValClicked extends ValidationEvent {
  final String val;

  PanValClicked({required this.val});
}
