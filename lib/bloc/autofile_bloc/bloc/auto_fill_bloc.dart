import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:pixel_app/data/service/postcode_service.dart';

part 'auto_fill_event.dart';
part 'auto_fill_state.dart';

class AutoFillBloc extends Bloc<AutoFillEvent, AutoFillState> {
  AutoFillBloc() : super(AutoFillInitial(state: '', city: '')) {
    on<PostValAdded>(postValAdded);
  }
  postValAdded(PostValAdded event, Emitter<AutoFillState> emit) async {
    log('worked');
    final postcode = int.parse(event.val);
    if (event.val.length == 6) {
      final val = await PostcodeService().getPostcodeDetails(postcode);
      print(val['state']);
      emit(AutoFillInitial(state: val['state'], city: val['city']));
    }
  }
}
