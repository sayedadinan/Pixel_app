part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserSuccessState extends UserState {
  final List<PanDatas> list;
  UserSuccessState(this.list);
}
final class UserDeleteSuccessState extends UserState{
    final List<PanDatas> list;

  UserDeleteSuccessState( this.list);
}