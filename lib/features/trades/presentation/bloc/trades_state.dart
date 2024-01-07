part of 'trades_bloc.dart';

abstract class TradesState extends Equatable {
  const TradesState();
}

class TradesInitial extends TradesState {
  @override
  List<Object> get props => [];
}

class TradesLoading extends TradesState {
  @override
  List<Object> get props => [];
}

class TradesLoaded extends TradesState {
  final List<TradeItem> trades;

  const TradesLoaded(this.trades);

  @override
  List<Object> get props => [trades];
}

class TradesError extends TradesState {
  final String message;

  const TradesError(this.message);

  @override
  List<Object> get props => [message];
}
