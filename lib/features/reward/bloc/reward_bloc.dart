import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_flash/core/db/prefs.dart';

part 'reward_event.dart';
part 'reward_state.dart';

class RewardBloc extends Bloc<RewardEvent, RewardState> {
  RewardBloc() : super(RewardInitial()) {
    on<CheckRewardEvent>((event, emit) async {});

    on<GetRewardEvent>((event, emit) async {
      await getCoins();
      emit(RewardClaimedState());
    });
  }
}
