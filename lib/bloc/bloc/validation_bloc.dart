import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pixel_app/data/service/validation_service.dart';

part 'validation_event.dart';
part 'validation_state.dart';

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  ValidationBloc() : super(ValidationInitial()) {
    on<PanValClicked>(panValClicked);
  }
  panValClicked(PanValClicked event, Emitter<ValidationState> emit) async {
    //whenever user is typing on panfield at that time itself this event calll and after that this funtions will work
    emit(PanNotValid());
    final isValid = isValidPAN(event.val);
    if (isValid) {
      log('its valid');
      emit(PanLoading());
      final response = await ValidationService().panValidation(event.val);
      if (response) {
        emit(PanVerified());
      } else {
        emit(PanNotValid());
      }
    } else {
      log('its not valid');
      emit(PanNotValid());
    }
  }
}

bool isValidPAN(String pan) {
  if (pan.length != 10) return false;

  // this will check the first 5 characters is that cap letter or not
  for (int i = 0; i < 5; i++) {
    if (!isUppercaseLetter(pan[i])) {
      return false;
    }
  }

  // this will check the next 4 values that is numbers or not
  for (int i = 5; i < 9; i++) {
    if (!isDigit(pan[i])) {
      return false;
    }
  }

  // and at last this will check if that last value is capital or not and it should be character also
  if (!isUppercaseLetter(pan[9])) {
    return false;
  }

  return true;
}

bool isUppercaseLetter(String character) {
  return character.codeUnitAt(0) >= 65 && character.codeUnitAt(0) <= 90;
}

bool isDigit(String character) {
  return character.codeUnitAt(0) >= 48 && character.codeUnitAt(0) <= 57;
}
