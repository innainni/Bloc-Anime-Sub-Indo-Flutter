part of 'search_anime_cubit.dart';

@immutable
abstract class SearchAnimeState {}

class SearchAnimeInitial extends SearchAnimeState {}

class SearchAnimeLoading extends SearchAnimeState {}

class SearchAnimeEmpty extends SearchAnimeState {
  final String message;

  SearchAnimeEmpty(this.message);
}

class SearchAnimeSuccess extends SearchAnimeState {
  final List<Anime>? listAnime;

  SearchAnimeSuccess(this.listAnime);
}

class SearchAnimeError extends SearchAnimeState {
  final String message;

  SearchAnimeError(this.message);
}
