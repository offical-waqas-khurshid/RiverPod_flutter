import 'package:flutter_riverpod_one_habibi/album_state.dart';
import 'package:flutter_riverpod_one_habibi/counter.dart';
import 'package:riverpod/riverpod.dart';

final counteryProvider = Provider<String>(
  (ref) {
    return 'Pakistan';
  },
);
final cityProvider = Provider<String>(
  (ref) {
    return 'Bahawalpur';
  },
);

final counterProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

final counterStateNotifier = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});

final albumApiStateNotifierProvider =
    StateNotifierProvider<AlbumStateNotifier, AlbumState>((ref) {
  return AlbumStateNotifier();
});
