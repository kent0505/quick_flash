import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/db/prefs.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial(coins: 0)) {
    on<ChangePageEvent>((event, emit) async {
      if (event.index == 0) {
        if (state is HomeInitial) return;
        int coins = await getCoins();
        emit(HomeInitial(coins: coins));
      } else if (event.index == 1) {
        if (state is HomeNews) return;
        emit(HomeNews());
      } else {
        if (state is HomeSettings) return;
        emit(HomeSettings());
      }
    });
  }
}
