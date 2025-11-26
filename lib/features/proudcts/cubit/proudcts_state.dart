part of 'proudcts_cubit.dart';

@immutable
sealed class ProudctsState {}

final class ProudctsInitial extends ProudctsState {}

final class ProudctsSuccess extends ProudctsState {

  final List<ProudctModel> proudcts;
  ProudctsSuccess({required this.proudcts});
}

final class ProudctsLoading extends ProudctsState {}

final class ProudctsFailure extends ProudctsState {

  final String errorMessage;
  ProudctsFailure({required this.errorMessage});
}
