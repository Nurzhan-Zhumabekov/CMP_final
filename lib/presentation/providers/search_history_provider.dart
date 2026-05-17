import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryNotifier extends AsyncNotifier<List<String>> {
  static const _key = 'search_history';
  static const _maxItems = 10;

  @override
  Future<List<String>> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  Future<void> add(String query) async {
    final q = query.trim();
    if (q.isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    final history = <String>[...state.valueOrNull ?? []];
    history.remove(q);
    history.insert(0, q);
    if (history.length > _maxItems) history.removeLast();
    await prefs.setStringList(_key, history);
    state = AsyncData(history);
  }

  Future<void> remove(String query) async {
    final prefs = await SharedPreferences.getInstance();
    final history = <String>[...state.valueOrNull ?? []]..remove(query);
    await prefs.setStringList(_key, history);
    state = AsyncData(history);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
    state = const AsyncData([]);
  }
}

final searchHistoryProvider =
    AsyncNotifierProvider<SearchHistoryNotifier, List<String>>(
  SearchHistoryNotifier.new,
);
