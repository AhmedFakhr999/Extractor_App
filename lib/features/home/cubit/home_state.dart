part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final PlatformFile? file;
  
  HomeSuccess(this.file);
}

final class HomeFailure extends HomeState {
  final String message;
  
  HomeFailure(this.message);
}