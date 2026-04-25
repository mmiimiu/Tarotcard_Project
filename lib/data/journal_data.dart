import 'history_storage.dart';
import 'tarot_dart.dart';

class JournalEntry {
  final List<int> indexes;
  final List<TarotCard> cards;
  final DateTime date;
  final String category;

  JournalEntry({
    required this.indexes,
    required this.cards,
    required this.date,
    required this.category,
  });

  int get index => indexes.first;
  TarotCard get card => cards.first;
}

List<JournalEntry> get journalHistory {
  final history = HistoryStorage.getAll();

  print("📜 History length: ${history.length}");

  return history.map((h) {
    final indexes = List<int>.from(h.cards);

    return JournalEntry(
      indexes: indexes,
      cards: indexes.map((i) => tarotDeck[i]).toList(),
      date: h.date,
      category: h.category,
    );
  }).toList();
}