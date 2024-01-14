
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/features/trades/domain/usecase/trades_use_case.dart';

import '../../domain/entity/trade_item.dart';

part 'trades_event.dart';
part 'trades_state.dart';

class TradesBloc extends Bloc<TradesEvent, TradesState> {

  final TradeUseCase _tradeUseCase;

  TradesBloc(this._tradeUseCase) : super(TradesInitial()) {
    on<FetchTrades>(_fetchTrades);
  }

  _fetchTrades(
    TradesEvent event,
    Emitter<TradesState> emit,
  ) async {
    emit(TradesLoading());

    try {
      final trades = await _tradeUseCase.doGetTradeList();

      trades.fold(
            (failure) => emit(TradesError(failure.message)),
            (trade) => emit(TradesLoaded(trade.tradeItems!)),
      );

      //emit(TradesLoaded(trades.rig));
    } catch (error) {
      emit(TradesError(error.toString()));
    }
  }
}
