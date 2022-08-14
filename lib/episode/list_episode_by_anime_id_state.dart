part of 'list_episode_by_anime_id_cubit.dart';

@immutable
abstract class ListEpisodeByAnimeIdState {}

class ListEpisodeByAnimeIdInitial extends ListEpisodeByAnimeIdState {}

class ListEpisodeByAnimeSuccess extends ListEpisodeByAnimeIdState {
  final List<Episode>? listEpisode;

  ListEpisodeByAnimeSuccess(this.listEpisode);
}

class ListEpisodeByAnimeError extends ListEpisodeByAnimeIdState {
  final String message;

  ListEpisodeByAnimeError(this.message);
}
