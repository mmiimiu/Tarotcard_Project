import 'package:flutter/material.dart';
import '../data/tarot_dart.dart';
import '../widgets/app_header.dart';
import '../widgets/primary_button.dart';
import 'category_screen.dart';
import 'select_cards_screen.dart';

class ResultScreen extends StatelessWidget {
  final List<int> selected;
  final String category;

  const ResultScreen({
    super.key,
    required this.selected,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final cards = selected
        .map((i) => tarotDeck[i.clamp(0, tarotDeck.length - 1)])
        .toList();

    final isLove = category.toUpperCase() == "LOVE";

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4FA),

      body: SafeArea(
        child: Column(
          children: [

            // 🔝 Header
            const AppHeader(
              title: "Your Reading",
              subtitle: "",
              showBack: true,
            ),

            // 🔮 CONTENT
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [

                  ...cards.map((card) {
                    final meaningText = isLove
                        ? card.meaning["love"]
                        : card.meaning["career"];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            // 🃏 รูป
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: AspectRatio(
                                aspectRatio: 3 / 4,
                                child: Image.asset(
                                  card.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            const SizedBox(height: 15),

                            // 🔤 ชื่อไพ่
                            Text(
                              card.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 15),

                            // ✅ เหลือแค่กล่องเดียว (ลบ Text สีเทาซ้ำออกแล้ว)
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2F2F7),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                meaningText ?? "",
                                style: const TextStyle(
                                  height: 1.5,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 10),

                  // 🔮 Play Again
                  PrimaryButton(
                    text: "Play Again",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SelectCardsScreen(
                            cardCount: selected.length,
                            category: category,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  // 🏠 Home
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CategoryScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Text("Back to Home"),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}