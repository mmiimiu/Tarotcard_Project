import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/bottom_nav.dart';
import 'select_cards_screen.dart';

class ChooseSpreadScreen extends StatelessWidget {
  final String category;

  const ChooseSpreadScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6FB),

      body: SafeArea(
        child: Column(
          children: [
            AppHeader(
              title: "Choose Your Spread",
              subtitle: "Category: $category",
              showBack: true,
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),

                // ✅ FIX: ใช้ ListView กันล้น
                child: ListView(
                  children: [

                    _spreadCard(
                      context,
                      title: "1 Card Reading",
                      subtitle: "Single insight for immediate clarity",
                      count: 1,
                    ),

                    const SizedBox(height: 20),

                    _spreadCard(
                      context,
                      title: "3 Card Reading",
                      subtitle: "Past, Present, Future revelations",
                      count: 3,
                    ),

                    const SizedBox(height: 30),

                    // ✨ quote ล่าง
                    const Text(
                      "“The cards are the mirrors of your soul's current tide.”",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const AppBottomNav(currentIndex: 0),
          ],
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////

  Widget _spreadCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required int count,
  }) {
    final isOneCard = count == 1;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isOneCard
            ? Colors.white
            : const Color(0xFFF3F2FF), // 🔥 card 3 ใบสีจาง
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [

          // 🔤 TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 12),

                Text(
                  isOneCard
                      ? "DURATION: 2 MINS"
                      : "DURATION: 8 MINS",
                  style: const TextStyle(
                    fontSize: 12,
                    letterSpacing: 1.2,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // 🎴 ICON + BUTTON
          Column(
            children: [

              // 🔮 icon
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  isOneCard ? Icons.auto_awesome : Icons.style,
                  color: const Color(0xFF6C63FF),
                ),
              ),

              const SizedBox(height: 12),

              // 🔘 Select button (เหมือนรูป)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectCardsScreen(
                        cardCount: count,
                        category: category,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Select",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}