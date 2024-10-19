import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'internet_state.dart';
part 'internet_cubit.freezed.dart';

class InternetCubit extends Cubit<InternetState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? streamSubscription;
  InternetCubit() : super(const InternetState.initial()) {
    streamSubscription = connectivity.onConnectivityChanged.listen((event) {
      print("state internet event $event");
      if (event[0] == ConnectivityResult.mobile ||
          event[0] == ConnectivityResult.wifi) {
        emit(const InternetState.onState());
      } else {
        emit(const InternetState.offState());
      }
    });
  }
  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
