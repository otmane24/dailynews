import 'package:bloc/bloc.dart';

import 'package:dailynews/data/repository/sources_repository.dart';
import 'package:dailynews/models/source_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
    part 'sources_bloc.freezed.dart';
part 'sources_event.dart';
part 'sources_state.dart';

class SourcesBloc extends Bloc<SourcesEvent, SourcesState> {
  final SourcesRepository sourcesRepository;
  SourcesBloc(this.sourcesRepository) : super(const SourcesState.initial()) {
    on<GetSourceEvent>(_getSource);
  }

  void _getSource(GetSourceEvent event, Emitter<SourcesState> emit) async {
    emit(const SourcesState.sourcesLoading());
    final response = await sourcesRepository.getSource();
    if (response is List<SourceModel>) {
      emit(SourcesState.sourcesLoaded(sources: response));
    } else {
      emit(SourcesState.sourcesFailed(message: response));
    }
  }
}
