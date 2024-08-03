import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pixel_app/data/model/address_model.dart';
import 'package:pixel_app/view/screens/user_adding_screen.dart';
import 'package:pixel_app/view/utils/constants/navigations.dart';

import '../../data/model/data_model.dart';
import '../../data/repositery/data_funtions.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final HiveService _hiveService;
  UserBloc(this._hiveService) : super(UserInitial()) {
    on<UserAddEvent>(_add);
    on<UserUpdateEvent>(userupdate);

    on<UserDeleteEvent>(
      (event, emit) async {
        log('started');
        _hiveService.deletePanData(event.id);
        final List<PanDatas> list = await _hiveService.getPanData();
        emit(UserSuccessState(list));
      },
    );
  }

  _add(UserAddEvent event, Emitter<UserState> emit) async {
    final model = PanDatas(
      dataId: DateTime.now().toString(),
      name: event.name,
      email: event.email,
      addressModelList: event.addressTable,
      mobileNumber: event.phone,
      panCardNumber: event.pan,
    );
    log(model.toString());
    try {
      await _hiveService.addPanData(model);
      // Getting PanData list
      final List<PanDatas> list = await _hiveService.getPanData();
      emit(UserSuccessState(list));
    } catch (e) {
      log('error is there in this bloc $e');
    }
  }

  userupdate(UserUpdateEvent event, Emitter<UserState> emit) async {
    PageNavigations().push(PanCardAddingScreen(
      email: event.email,
      isEditMode: true,
      name: event.name,
      panCard: event.pan,
      phone: event.phone,
    ));
  }
}
