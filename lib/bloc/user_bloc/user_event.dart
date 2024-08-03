part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class UserAddEvent extends UserEvent {
  final String name;
  final String email;
  final String phone;
  final String pan;
  final List<AddressTable> addressTable;

  UserAddEvent({
    required this.name,
    required this.email,
    required this.phone,
    required this.pan,
    required this.addressTable,
  });
}

final class UserUpdateEvent extends UserEvent {
  final String name;
  final String email;
  final String phone;
  final String pan;
  UserUpdateEvent({
    required this.name,
    required this.email,
    required this.phone,
    required this.pan,
  });
}

final class UserDeleteEvent extends UserEvent {
  final String id;

  UserDeleteEvent({required this.id});
}


