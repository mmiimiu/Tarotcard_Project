import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/app_header.dart';
import '../widgets/bottom_nav.dart';
import '../data/tarot_dart.dart';
import '../data/user_session.dart';
import 'result_screen.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  List<_JournalItem> history = [];
  bool isLoading = true;

  String get baseUrl {
    if (kIsWeb) {
      return "http://localhost/tarotcard/php";
    } else {
      return "http://10.0.2.2/tarotcard/php";
    }
  }

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  Future<void> loadHistory() async {
    try {
      final res = await http.get(
        Uri.parse("$baseUrl/get_history.php?user_id=${UserSession.userId}"),
      );

      final data = jsonDecode(res.body);

      history = data.map<_JournalItem>((item) {
        final indexes = item["cards"]
            .toString()
            .split(",")
            .map((e) => int.parse(e.trim()))
            .toList();

        return _JournalItem(
          indexes: indexes,
          category: item["category"].toString(),
          date: DateTime.parse(item["created_at"].toString()),
        );
      }).toList();
    } catch (e) {
      print("LOAD HISTORY ERROR: $e");
    }

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6FB),

      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(
              title: "Reading Journal",
              subtitle: "Your intuitive journey, archived in clarity.",
            ),

            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : history.isEmpty
                      ? const Center(
                          child: Text(
                            "No readings yet",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: history.length,
                          itemBuilder: (context, index) {
                            final entry = history[index];
                            final card = tarotDeck[entry.indexes.first];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ResultScreen(
                                      selected: entry.indexes,
                                      category: entry.category,
                                    ),
                                  ),
                                );
                              },

                              child: Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        card.image,
                                        width: 60,
                                        height: 90,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    const SizedBox(width: 14),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            card.name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),

                                          const SizedBox(height: 4),

                                          Text(
                                            "${entry.date.day}/${entry.date.month}/${entry.date.year}",
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),

                                          const SizedBox(height: 6),

                                          Text(
                                            card.meaning["career"] ?? "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const Icon(
                                      Icons.chevron_right,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
            ),

            const AppBottomNav(currentIndex: 1),
          ],
        ),
      ),
    );
  }
}

class _JournalItem {
  final List<int> indexes;
  final String category;
  final DateTime date;

  _JournalItem({
    required this.indexes,
    required this.category,
    required this.date,
  });
}