import 'history_model.dart';

class HistoryStorage {
  static final List<ReadingHistory> _history = [];

  static void addReading(List<int> cards, String category) {
    _history.insert(
      0,
      ReadingHistory(
        cards: List.from(cards),
        date: DateTime.now(),
        category: category,
      ),
    );

    print("🔥 Added: ${_history.length}");
  }

  static List<ReadingHistory> getAll() {
    return _history;
  }
}