part of 'sources_bloc.dart';

@freezed
class SourcesState with _$SourcesState {
  const factory SourcesState.initial() = _Initial;
  const factory SourcesState.sourcesLoading() = _SourcesLoading;
  const factory SourcesState.sourcesLoaded(
      {required List<SourceModel> sources}) = _SourcesLoaded;
  const factory SourcesState.sourcesFailed({required String message}) =
      _SourcesFailed;
}
