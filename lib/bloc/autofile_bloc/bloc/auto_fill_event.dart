part of 'auto_fill_bloc.dart';


sealed class AutoFillEvent {}
class PostValAdded extends AutoFillEvent {
  final String val;

  PostValAdded({required this.val});
}
