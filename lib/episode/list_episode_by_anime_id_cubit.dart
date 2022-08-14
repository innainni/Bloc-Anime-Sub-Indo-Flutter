import 'package:bloc/bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:meta/meta.dart';
import 'package:repository_anime_sub_indo/anime_sub_indo.dart';
import 'package:repository_anime_sub_indo/domain/model/episode.dart';

part 'list_episode_by_anime_id_state.dart';

class ListEpisodeByAnimeIdCubit extends Cubit<ListEpisodeByAnimeIdState> {
  ListEpisodeByAnimeIdCubit() : super(ListEpisodeByAnimeIdInitial());

  final AnimeSubIndo _repository = Injector().get<AnimeSubIndo>();
  List<Episode> _listEpisode = [];

  getData(idAnime, page, limit) async {
    try {
      emit(ListEpisodeByAnimeIdInitial());
      _listEpisode =
          await _repository.findEpisodeByIdAnime(idAnime, page, limit);
      emit(ListEpisodeByAnimeSuccess(_listEpisode));
    } catch (err) {
      emit(ListEpisodeByAnimeError(err.toString()));
    }
  }

  addToWatched(episode) async {
    try {
      await _repository.addEpisodeToWatched(episode);
      var result = _listEpisode.map((element) {
        if (element.episodeID == episode.episodeID) {
          element.isWatched = true;
        }
        return element;
      }).toList();
      emit(ListEpisodeByAnimeSuccess(result));
    } catch (err) {
      emit(ListEpisodeByAnimeError(err.toString()));
    }
  }

  toggleShort(isDesc) {
    try {
      emit(ListEpisodeByAnimeIdInitial());
      if (isDesc) {
        _listEpisode.sort((a, b) => a.episode.compareTo(b.episode));
      } else {
        _listEpisode.sort((a, b) => b.episode.compareTo(a.episode));
      }
      emit(ListEpisodeByAnimeSuccess(_listEpisode));
    } catch (err) {
      emit(ListEpisodeByAnimeError(err.toString()));
    }
  }

  searchEpisode(int episode) {
    try {
      emit(ListEpisodeByAnimeIdInitial());
      var result = _listEpisode
          .where(
            (element) => element.episode == episode,
          )
          .toList();
      emit(ListEpisodeByAnimeSuccess(result));
    } catch (err) {
      emit(ListEpisodeByAnimeError(err.toString()));
    }
  }

  resetData() {
    try {
      emit(ListEpisodeByAnimeIdInitial());
      emit(ListEpisodeByAnimeSuccess(_listEpisode));
    } catch (err) {
      emit(ListEpisodeByAnimeError(err.toString()));
    }
  }
}
