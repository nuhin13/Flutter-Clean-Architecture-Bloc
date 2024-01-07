part of 'trades_bloc.dart';

abstract class TradesEvent extends Equatable {
  const TradesEvent();
}

class FetchTrades extends TradesEvent {
  @override
  List<Object> get props => [];
}