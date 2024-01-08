
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/core/domain/service_locator.dart';

import '../../domain/model/trade_item.dart';
import '../../domain/repo/trade_repository.dart';

part 'trades_event.dart';

part 'trades_state.dart';

class TradesBloc extends Bloc<TradesEvent, TradesState> {

  final TradeRepository tradeRepository;

  TradesBloc(this.tradeRepository) : super(TradesInitial()) {
    on<FetchTrades>(_fetchTrades);
  }

  _fetchTrades(
    TradesEvent event,
    Emitter<TradesState> emit,
  ) async {
    emit(TradesLoading());

    try {
      final trades = await tradeRepository.getTradeList();

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
