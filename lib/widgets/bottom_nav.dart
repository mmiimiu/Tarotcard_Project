import 'package:flutter/material.dart';
import '../screens/choose_spread_screen.dart';
import '../screens/journal_screen.dart';
import '../screens/profile_screen.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;

  const AppBottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _item(
              context,
              icon: Icons.style,
              label: "Draw",
              active: currentIndex == 0,
              onTap: () {
                if (currentIndex == 0) return;

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const ChooseSpreadScreen(category: "LOVE"),
                  ),
                );
              },
            ),

            _item(
              context,
              icon: Icons.menu_book,
              label: "Journal",
              active: currentIndex == 1,
              onTap: () {
                if (currentIndex == 1) return;

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const JournalScreen(),
                  ),
                );
              },
            ),

            _item(
              context,
              icon: Icons.settings,
              label: "Essence",
              active: currentIndex == 2,
              onTap: () {
                if (currentIndex == 2) return;

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfileScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required IconData icon,
    required String label,
    required bool active,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22,
              color: active ? const Color(0xFF6C63FF) : Colors.grey,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: active ? const Color(0xFF6C63FF) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}