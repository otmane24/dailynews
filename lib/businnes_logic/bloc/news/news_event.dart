part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

class GetNewsEvent extends NewsEvent {
  final int page ;
  final String? source;
  final String? from;
  final String? to;

  GetNewsEvent({required this.page,this.source, this.from, this.to});
}
class GetMoreNewsEvent extends NewsEvent {
  final int page ;
  final String? source;
  final String? from;
  final String? to;

  GetMoreNewsEvent({required this.page,this.source, this.from, this.to});
}