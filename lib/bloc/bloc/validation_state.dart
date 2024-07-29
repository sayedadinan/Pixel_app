part of 'validation_bloc.dart';

@immutable
sealed class ValidationState {}

class ValidationInitial extends ValidationState {}

class PanNotValid extends ValidationState {}

class PanVerified extends ValidationState {}

class PanLoading extends ValidationState {}
