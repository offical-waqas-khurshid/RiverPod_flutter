import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_one_habibi/album.dart';
import 'package:flutter_riverpod_one_habibi/album_api_provider.dart';

@immutable
abstract class AlbumState extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class AlbumInitialState extends AlbumState {}

@immutable
class AlbumLoadingState extends AlbumState {}

@immutable
class AlbumLoadedState extends AlbumState {
  final List<Album> albums;
  AlbumLoadedState({required this.albums});

  @override
  List<Object?> get props => [albums];
}

@immutable
class AlbumErrorState extends AlbumState {
  final String error;
  AlbumErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}

class AlbumStateNotifier extends StateNotifier<AlbumState> {
  AlbumStateNotifier() : super(AlbumInitialState());
  AlbumAPIProvider _albumAPIProvider = AlbumAPIProvider();
  fetchAlbums() async {
    state = AlbumLoadingState();
    try {
      final albums = await _albumAPIProvider.fetchAlbums();
      state = AlbumLoadedState(albums: albums);
    } catch (e) {
      state = AlbumErrorState(error: e.toString());
    }
  }
}
