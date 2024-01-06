import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trades_event.dart';
part 'trades_state.dart';

class TradesBloc extends Bloc<TradesEvent, TradesState> {
  TradesBloc() : super(TradesInitial()) {
    on<TradesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
