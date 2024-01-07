
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/model/trade_item.dart';
import '../../domain/repo/trade_repository.dart';

part 'trades_event.dart';

part 'trades_state.dart';

class TradesBloc extends Bloc<TradesEvent, TradesState> {
  /*TradesBloc() : super(TradesInitial()) {
    on<TradesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }*/

  final TradeRepository tradeRepository;

  TradesBloc(this.tradeRepository) : super(TradesInitial()) {
    on<FetchTrades>(_fetchTrades);
  }

  /* TradesBloc(this.tradeRepository) : super(TradesInitial()) {
    on<FetchTrades>((event, emit) async {

    });
  }*/

  _fetchTrades(
    TradesEvent event,
    Emitter<TradesState> emit,
  ) async {
    emit(TradesLoading());

    try {
      final trades = await tradeRepository.getTradeList();
      //emit(TradesLoaded(trades.rig));
    } catch (error) {
      emit(TradesError(error.toString()));
    }
  }
}
