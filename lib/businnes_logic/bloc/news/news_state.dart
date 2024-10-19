part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;
  const factory NewsState.newsLoading() = _NewsLoading;
  const factory NewsState.moreNewsLoading() = _MoreNewsLoading;
  const factory NewsState.newsLoaded({required List<NewsModel> news}) =
      _NewsLoaded;
        const factory NewsState.moreNewsLoaded({required List<NewsModel> news}) =
      _MoreNewsLoaded;
       const factory NewsState.noMoreNews() = _NoMoreNews;
  const factory NewsState.newsFailed({required String message}) = _NewsFailed;
}
