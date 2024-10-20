part of 'internet_cubit.dart';

@freezed
class InternetState with _$InternetState {
  const factory InternetState.initial() = _Initial;
  const factory InternetState.onState() = _OnState;
  const factory InternetState.offState() = _OffState;
}
