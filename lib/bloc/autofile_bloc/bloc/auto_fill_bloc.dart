import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:pixel_app/data/service/postcode_service.dart';

part 'auto_fill_event.dart';
part 'auto_fill_state.dart';

class AutoFillBloc extends Bloc<AutoFillEvent, AutoFillState> {
  AutoFillBloc() : super(AutoFillInitial(state: ['state'], city: ['city'])) {
    on<PostValAdded>(postValAdded);
  }
  postValAdded(PostValAdded event, Emitter<AutoFillState> emit) async {
    log('worked');
    final postcode = int.parse(event.val);
    if (event.val.length == 6) {
      final val = await PostcodeService().getPostcodeDetails(postcode);
      print(val['state']);
      state.city.remove('city');
      state.state.remove('state');
      state.state.add(val['state']);
      state.city.add(val['city']);
      state.city.add('city');
      state.state.add('state');
      emit(AutoFillInitial(state: state.state, city: state.city));
    }
  }
}
