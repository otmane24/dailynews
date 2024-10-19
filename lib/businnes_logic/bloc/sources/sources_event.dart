part of 'sources_bloc.dart';

@immutable
sealed class SourcesEvent {}

class GetSourceEvent extends SourcesEvent {}
