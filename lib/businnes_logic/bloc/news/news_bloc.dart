import 'package:bloc/bloc.dart';
import 'package:dailynews/assistant_methode/hivebase.dart';
import 'package:dailynews/data/repository/news_repository.dart';
import 'package:dailynews/models/news_model.dart';
import 'package:dailynews/presentation/constants/strings/strings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
part 'news_bloc.freezed.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository newsRepository;
  NewsBloc(this.newsRepository) : super(const NewsState.initial()) {
    on<GetNewsEvent>(_getNews);
    on<GetMoreNewsEvent>(_getMoreNews);
  }

  void _getNews(GetNewsEvent event, Emitter<NewsState> emit) async {
    emit(const NewsState.newsLoading());
    final response = await newsRepository.getNews(
        page: event.page, source: event.source, from: event.from, to: event.to);
    if (response is List<NewsModel>) {
      HiveBase.hiveBase.setNews(response);
      emit(NewsState.newsLoaded(news: response));
    } else {
      emit(NewsState.newsFailed(message: response));
    }
  }

  void _getMoreNews(GetMoreNewsEvent event, Emitter<NewsState> emit) async {
    emit(const NewsState.moreNewsLoading());
    if (nbrNews ~/ 10 < event.page) {
      emit(const NewsState.noMoreNews());
    } else {
      final response = await newsRepository.getNews(
          page: event.page,
          source: event.source,
          from: event.from,
          to: event.to);
      if (response is List<NewsModel>) {
      
        emit(NewsState.moreNewsLoaded(news: response));
      } else {
        emit(NewsState.newsFailed(message: response));
      }
    }
  }
}
