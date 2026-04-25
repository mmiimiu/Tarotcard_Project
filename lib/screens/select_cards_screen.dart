import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/app_header.dart';
import '../widgets/primary_button.dart';
import '../data/history_storage.dart';
import '../data/tarot_dart.dart';
import '../data/user_session.dart';
import 'result_screen.dart';

class SelectCardsScreen extends StatefulWidget {
  final int cardCount;
  final String category;

  const SelectCardsScreen({
    super.key,
    required this.cardCount,
    required this.category,
  });

  @override
  State<SelectCardsScreen> createState() => _SelectCardsScreenState();
}

class _SelectCardsScreenState extends State<SelectCardsScreen> {
  List<int> selected = [];
  late List<int> cardIndexes;
  final random = Random();

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
    cardIndexes = List.generate(tarotDeck.length, (i) => i);
  }

  void pick(int index) {
    setState(() {
      if (selected.contains(index)) {
        selected.remove(index);
      } else if (selected.length < widget.cardCount) {
        selected.add(index);
      }
    });
  }

  void shuffleCards() {
    setState(() {
      cardIndexes.shuffle(random);
      selected.clear();
    });
  }

  Future<void> saveHistory(List<int> cards, String category) async {
    try {
      final res = await http.post(
        Uri.parse("$baseUrl/add_history.php"),
        body: {
          "cards": cards.join(","),
          "category": category,
          "user_id": UserSession.userId.toString(),
        },
      );

      print("SAVE HISTORY: ${res.body}");
    } catch (e) {
      print("ERROR SAVE HISTORY: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6FB),

      body: SafeArea(
        child: Column(
          children: [

            // 🔝 HEADER
            AppHeader(
              title: "Select Cards",
              subtitle: "Choose ${widget.cardCount} Card(s)",
              showBack: true,
            ),

            // 🔀 SHUFFLE
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: IconButton(
                  icon: const Icon(Icons.shuffle),
                  onPressed: shuffleCards,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // 🃏 GRID
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: cardIndexes.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (_, index) {
                  final card = cardIndexes[index];
                  final isSelected = selected.contains(card);

                  return GestureDetector(
                    onTap: () => pick(card),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF6C63FF)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 12,
                          ),
                        ],
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF6C63FF)
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          isSelected
                              ? Icons.check
                              : Icons.auto_awesome,
                          color: isSelected
                              ? Colors.white
                              : Colors.grey.shade400,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // 🔮 REVEAL BUTTON
            Padding(
              padding: const EdgeInsets.all(16),
              child: PrimaryButton(
                text: "Reveal (${selected.length}/${widget.cardCount})",

                // 🔥 FIX สำคัญ: disable ปุ่มเมื่อเลือกไม่ครบ
                onTap: selected.length == widget.cardCount
                    ? () async {
                        final pickedCards = List<int>.from(selected);

                        // ✅ SAVE LOCAL เหมือนเดิม เพื่อให้ Journal ในแอปยังแสดงทันที
                        HistoryStorage.addReading(
                          pickedCards,
                          widget.category,
                        );

                        // ✅ SAVE ลง DATABASE
                        await saveHistory(
                          pickedCards,
                          widget.category,
                        );

                        if (!mounted) return;

                        // 🔥 FIX: ใช้ pushReplacement กันหน้าซ้อน
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ResultScreen(
                              selected: pickedCards,
                              category: widget.category,
                            ),
                          ),
                        );
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}