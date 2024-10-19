import 'dart:ui';

import 'package:dailynews/assistant_methode/hivebase.dart';
import 'package:dailynews/assistant_methode/size_config.dart';
import 'package:dailynews/businnes_logic/bloc/news/news_bloc.dart';
import 'package:dailynews/businnes_logic/bloc/sources/sources_bloc.dart';
import 'package:dailynews/businnes_logic/cubit/internet/internet_cubit.dart';
import 'package:dailynews/businnes_logic/cubit/state_cubit.dart';
import 'package:dailynews/data/repository/news_repository.dart';
import 'package:dailynews/data/repository/sources_repository.dart';
import 'package:dailynews/data/web_services/news_web_services.dart';
import 'package:dailynews/data/web_services/sources_web_services.dart';
import 'package:dailynews/models/news_model.dart';
import 'package:dailynews/models/source_model.dart';
import 'package:dailynews/presentation/colors/color_manager.dart';
import 'package:dailynews/presentation/constants/strings/strings.dart';
import 'package:dailynews/screen/home/components/loading_news_container.dart';
import 'package:dailynews/screen/home/components/news_app_bar.dart';
import 'package:dailynews/screen/home/components/news_container.dart';
import 'package:dailynews/screen/home/components/source_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsBloc newsBloc = NewsBloc(NewsRepository(NewsWebService()));
  SourcesBloc sourcesBloc = SourcesBloc(SourcesRepository(SourcesWebService()));
  InternetCubit internetCubit = InternetCubit();
  StateCubit stateCubit = StateCubit(false);
  StateCubit stateListNewsCubit = StateCubit(false);
  DateTimeRange? _selectedDateRange;
  SourceModel? selectedSource;
  final ScrollController _scrollController = ScrollController();
  List<NewsModel> newsList = [];
  int page = 1;
  void _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      currentDate: DateTime.now(),
      initialDateRange: _selectedDateRange,
      initialEntryMode: DatePickerEntryMode.calendar,
    );
    if (picked != null) {
      _selectedDateRange = picked;
      page = 1;
      newsBloc.add(
        GetNewsEvent(
          page: page,
          source: selectedSource?.id,
          from: DateFormat(
            'yyyy-MM-dd',
          ).format(_selectedDateRange!.start),
          to: DateFormat(
            'yyyy-MM-dd',
          ).format(_selectedDateRange!.end),
        ),
      );
    }
  }

  void _loadMoreData() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      page++;
      newsBloc.add(
        GetMoreNewsEvent(
          page: page,
          source: selectedSource?.id,
          from: _selectedDateRange != null
              ? DateFormat(
                  'yyyy-MM-dd',
                ).format(_selectedDateRange!.start)
              : null,
          to: _selectedDateRange != null
              ? DateFormat(
                  'yyyy-MM-dd',
                ).format(_selectedDateRange!.end)
              : null,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);

    internetCubit.streamSubscription;
  }

  @override
  void dispose() {
    super.dispose();
    newsBloc.add(GetNewsEvent(page: page));
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCubit, InternetState>(
      bloc: internetCubit,
      listener: (context, state) {
        state.whenOrNull(
          onState: () {
            newsBloc.add(GetNewsEvent(page: 1));
            sourcesBloc.add(GetSourceEvent());
          },
        );
      },
      builder: (context, internetState) {
        return BlocConsumer<NewsBloc, NewsState>(
          bloc: newsBloc,
          listener: (context, state) {
            state.whenOrNull(
              newsLoaded: (news) {
                newsList.clear();
                newsList.addAll(news);
              },
              moreNewsLoaded: (news) async {
                for (var newElement in news) {
                  newsList.add(newElement);
                }
                await HiveBase.hiveBase.setNews(newsList);

                stateListNewsCubit.setBlocState(
                    newState: !stateListNewsCubit.state);
              },
            );
          },
          builder: (context, newsState) {
            return BlocBuilder<SourcesBloc, SourcesState>(
              bloc: sourcesBloc,
              builder: (context, sourcesState) {
                return Scaffold(
                  floatingActionButton: internetState.whenOrNull(
                    onState: () => newsState.maybeWhen(
                      newsFailed: (_) => FloatingActionButton(
                        backgroundColor:
                            const Color.fromARGB(255, 220, 160, 247),
                        onPressed: () {
                          sourcesBloc.add(GetSourceEvent());
                          newsBloc.add(
                            GetNewsEvent(
                              page: 1,
                              source: selectedSource?.id,
                              from: _selectedDateRange != null
                                  ? DateFormat(
                                      'yyyy-MM-dd',
                                    ).format(_selectedDateRange!.start)
                                  : null,
                              to: _selectedDateRange != null
                                  ? DateFormat(
                                      'yyyy-MM-dd',
                                    ).format(_selectedDateRange!.end)
                                  : null,
                            ),
                          );
                        },
                        child: Icon(
                          Icons.sync_sharp,
                          size: 3 * SizeConfig.blockSizeVertical!,
                        ),
                      ),
                      newsLoading: () => null,
                      orElse: () => FloatingActionButton(
                        backgroundColor:
                            const Color.fromARGB(255, 220, 160, 247),
                        onPressed: () => _selectDateRange(context),
                        child: Icon(
                          Icons.calendar_month,
                          size: 3 * SizeConfig.blockSizeVertical!,
                        ),
                      ),
                    ),
                  ),
                  body: RefreshIndicator(
                    onRefresh: () async => internetState.whenOrNull(
                      onState: () => newsBloc.add(
                        GetNewsEvent(
                          page: 1,
                          source: selectedSource?.id,
                          from: _selectedDateRange != null
                              ? DateFormat(
                                  'yyyy-MM-dd',
                                ).format(_selectedDateRange!.start)
                              : null,
                          to: _selectedDateRange != null
                              ? DateFormat(
                                  'yyyy-MM-dd',
                                ).format(_selectedDateRange!.end)
                              : null,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        const NewsAppBar(),
                        SizedBox(
                          height: 2 * SizeConfig.blockSizeVertical!,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                internetState.maybeWhen(
                                  orElse: () => Container(),
                                  onState: () => sourcesState.maybeWhen(
                                    sourcesLoading: () => SizedBox(
                                      height:
                                          3.2 * SizeConfig.blockSizeVertical!,
                                      child: ListView.separated(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 4 *
                                              SizeConfig.blockSizeHorizontal!,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Shimmer.fromColors(
                                            baseColor: Colors.grey.shade300,
                                            highlightColor: ColorManager.grey200
                                                .withOpacity(.2),
                                            child: Container(
                                              width: 22 *
                                                  SizeConfig
                                                      .blockSizeHorizontal!,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: ColorManager.white,
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                          width: 2 *
                                              SizeConfig.blockSizeHorizontal!,
                                        ),
                                        itemCount: 10,
                                      ),
                                    ),
                                    sourcesLoaded: (sources) {
                                      return SizedBox(
                                        height:
                                            3.2 * SizeConfig.blockSizeVertical!,
                                        child: BlocBuilder<StateCubit, bool>(
                                          bloc: stateCubit,
                                          builder: (context, state) {
                                            return ListView.separated(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 4 *
                                                    SizeConfig
                                                        .blockSizeHorizontal!,
                                              ),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  SourceContainer(
                                                      source: sources[index],
                                                      onTap: (source) {
                                                        selectedSource = source;
                                                        newsBloc.add(
                                                          GetNewsEvent(
                                                            page: 1,
                                                            source: source?.id,
                                                            from: _selectedDateRange !=
                                                                    null
                                                                ? DateFormat(
                                                                    'yyyy-MM-dd',
                                                                  ).format(
                                                                    _selectedDateRange!
                                                                        .start)
                                                                : null,
                                                            to: _selectedDateRange !=
                                                                    null
                                                                ? DateFormat(
                                                                    'yyyy-MM-dd',
                                                                  ).format(
                                                                    _selectedDateRange!
                                                                        .end)
                                                                : null,
                                                          ),
                                                        );
                                                        stateCubit.setBlocState(
                                                            newState: !state);
                                                      },
                                                      isSelected:
                                                          selectedSource ==
                                                              sources[index]),
                                              separatorBuilder:
                                                  (context, index) => SizedBox(
                                                width: 2 *
                                                    SizeConfig
                                                        .blockSizeHorizontal!,
                                              ),
                                              itemCount: sources.length,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    orElse: () => Container(),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.2 * SizeConfig.blockSizeVertical!,
                                ),
                                if (_selectedDateRange != null)
                                  InkWell(
                                    onTap: () {
                                      _selectedDateRange = null;
                                      newsBloc.add(
                                        GetNewsEvent(
                                          page: 1,
                                          source: selectedSource?.id,
                                          from: _selectedDateRange != null
                                              ? DateFormat(
                                                  'yyyy-MM-dd',
                                                ).format(
                                                  _selectedDateRange!.start)
                                              : null,
                                          to: _selectedDateRange != null
                                              ? DateFormat(
                                                  'yyyy-MM-dd',
                                                ).format(
                                                  _selectedDateRange!.end)
                                              : null,
                                        ),
                                      );
                                      setState(() {});
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 4 *
                                              SizeConfig.blockSizeHorizontal!),
                                      height:
                                          3.2 * SizeConfig.blockSizeVertical!,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 83, 21, 94),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 4,
                                                spreadRadius: 0,
                                                color: ColorManager.shadowColor)
                                          ]),
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              SizeConfig.blockSizeHorizontal!),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Form : ${DateFormat(
                                              'yyyy-MM-dd',
                                            ).format(_selectedDateRange!.start)} - To : ${DateFormat(
                                              'yyyy-MM-dd',
                                            ).format(_selectedDateRange!.end)}",
                                            style: TextStyle(
                                                color: ColorManager.white),
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: .4 *
                                                    SizeConfig
                                                        .blockSizeHorizontal!,
                                              ),
                                              Icon(
                                                Icons.close,
                                                color: ColorManager.white,
                                                size: 4 *
                                                    SizeConfig
                                                        .blockSizeHorizontal!,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                internetState.maybeWhen(
                                  orElse: () => Container(),
                                  onState: () => newsState.maybeWhen(
                                    newsFailed: (message) => Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4 *
                                                SizeConfig
                                                    .blockSizeHorizontal!),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.error,
                                              color: ColorManager.textRed,
                                              size: 18 *
                                                  SizeConfig
                                                      .blockSizeHorizontal!,
                                            ),
                                            SizedBox(
                                              height: 2 *
                                                  SizeConfig.blockSizeVertical!,
                                            ),
                                            Text(
                                              message,
                                              style: TextStyle(
                                                  fontSize: 4 *
                                                      SizeConfig
                                                          .blockSizeHorizontal!,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    orElse: () {
                                      return newsList.isEmpty
                                          ? Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4 *
                                                      SizeConfig
                                                          .blockSizeHorizontal!,
                                                  vertical: 12 *
                                                      SizeConfig
                                                          .blockSizeVertical!),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                      "$pngsPath/no_news.png"),
                                                  SizedBox(
                                                    height: 2 *
                                                        SizeConfig
                                                            .blockSizeVertical!,
                                                  ),
                                                  Text(
                                                    "No news founded",
                                                    style: TextStyle(
                                                      fontSize: 6 *
                                                          SizeConfig
                                                              .blockSizeHorizontal!,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          : Column(
                                              children: [
                                                BlocBuilder<StateCubit, bool>(
                                                  bloc: stateListNewsCubit,
                                                  builder: (context, state) {
                                                    print(
                                                        "lest new ${newsList.length}");
                                                    return ListView.separated(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: 4 *
                                                                SizeConfig
                                                                    .blockSizeHorizontal!,
                                                            vertical: 1.2 *
                                                                SizeConfig
                                                                    .blockSizeVertical!),
                                                        itemBuilder:
                                                            (context, index) {
                                                          return NewsContainer(
                                                              newsInfo:
                                                                  newsList[
                                                                      index]);
                                                        },
                                                        separatorBuilder:
                                                            (context, index) {
                                                          return const SizedBox(
                                                            height: 12,
                                                          );
                                                        },
                                                        itemCount:
                                                            newsList.length);
                                                  },
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 4 *
                                                          SizeConfig
                                                              .blockSizeHorizontal!),
                                                  child: newsState.whenOrNull(
                                                    moreNewsLoading: () =>
                                                        const LoadingNewsContainer(),
                                                    noMoreNews: () => Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          vertical: 2 *
                                                              SizeConfig
                                                                  .blockSizeVertical!),
                                                      child: Text(
                                                        "No more news",
                                                        style: TextStyle(
                                                            fontSize: 4.8 *
                                                                SizeConfig
                                                                    .blockSizeHorizontal!,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            );
                                    },
                                    newsLoading: () => ListView.separated(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 4 *
                                              SizeConfig.blockSizeHorizontal!,
                                          vertical: 1.2 *
                                              SizeConfig.blockSizeVertical!,
                                        ),
                                        itemBuilder: (context, index) =>
                                            const LoadingNewsContainer(),
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            height: 12,
                                          );
                                        },
                                        itemCount: 10),
                                  ),
                                  offState: () => HiveBase.hiveBase
                                          .getNews()
                                          .isEmpty
                                      ? Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4 *
                                                  SizeConfig
                                                      .blockSizeHorizontal!,
                                              vertical: 12 *
                                                  SizeConfig
                                                      .blockSizeVertical!),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                  "$pngsPath/no_news.png"),
                                              SizedBox(
                                                height: 2 *
                                                    SizeConfig
                                                        .blockSizeVertical!,
                                              ),
                                              Text(
                                                "No news founded ",
                                                style: TextStyle(
                                                  fontSize: 6 *
                                                      SizeConfig
                                                          .blockSizeHorizontal!,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      : Column(
                                          children: [
                                            BlocBuilder<StateCubit, bool>(
                                              bloc: stateListNewsCubit,
                                              builder: (context, state) {
                                                return ListView.separated(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 4 *
                                                            SizeConfig
                                                                .blockSizeHorizontal!,
                                                        vertical: 1.2 *
                                                            SizeConfig
                                                                .blockSizeVertical!),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return NewsContainer(
                                                          newsInfo: HiveBase
                                                                  .hiveBase
                                                                  .getNews()[
                                                              index]);
                                                    },
                                                    separatorBuilder:
                                                        (context, index) {
                                                      return const SizedBox(
                                                        height: 12,
                                                      );
                                                    },
                                                    itemCount: HiveBase.hiveBase
                                                        .getNews()
                                                        .length);
                                              },
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4 *
                                                      SizeConfig
                                                          .blockSizeHorizontal!),
                                              child: newsState.whenOrNull(
                                                moreNewsLoading: () =>
                                                    const LoadingNewsContainer(),
                                                noMoreNews: () => Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 2 *
                                                          SizeConfig
                                                              .blockSizeVertical!),
                                                  child: Text(
                                                    "No more news",
                                                    style: TextStyle(
                                                        fontSize: 4.8 *
                                                            SizeConfig
                                                                .blockSizeHorizontal!,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
