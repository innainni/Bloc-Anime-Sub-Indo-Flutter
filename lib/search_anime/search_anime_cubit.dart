import 'package:bloc/bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:meta/meta.dart';
import 'package:repository_anime_sub_indo/anime_sub_indo.dart';
import 'package:repository_anime_sub_indo/domain/model/anime.dart';

part 'search_anime_state.dart';

class SearchAnimeCubit extends Cubit<SearchAnimeState> {
  SearchAnimeCubit() : super(SearchAnimeInitial());

  final AnimeSubIndo _animeSubIndo = Injector().get<AnimeSubIndo>();

  searchAnime(String keyword) async {
    try {
      emit(SearchAnimeLoading());
      var result = await _animeSubIndo.findAnimeByTitle(keyword);
      result.isEmpty
          ? emit(SearchAnimeEmpty("No result for $keyword"))
          : emit(SearchAnimeSuccess(result));
    } catch (err) {
      emit(SearchAnimeError(err.toString()));
    }
  }
}
