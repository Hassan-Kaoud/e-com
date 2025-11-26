part of 'categrorys_cubit.dart';

@immutable
sealed class CategrorysState {}

final class CategrorysInitial extends CategrorysState {}

final class CategrorysLoading extends CategrorysState {}

final class CategrorysLoaded extends CategrorysState {
  final List<CategroyModel> categories;

  CategrorysLoaded(this.categories);
}

final class CategrorysError extends CategrorysState {
  final String message;

  CategrorysError(this.message);
}
