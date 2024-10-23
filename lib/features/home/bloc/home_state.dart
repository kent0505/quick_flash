part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {
  final int coins;
  HomeInitial({required this.coins});
}

class HomeNews extends HomeState {}

class HomeSettings extends HomeState {}
