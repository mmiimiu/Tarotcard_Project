import 'package:flutter/material.dart';
import 'choose_spread_screen.dart';
import '../widgets/app_header.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6FB),

      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(
              showBack: true,
              title: "What path calls to you?",
              subtitle:
                  "Clear the noise and select the sphere of your life seeking guidance today.",
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [

                    // 🔮 LOVE
                    _categoryCard(
                      context,
                      title: "LOVE",
                      subtitle: "CONNECTIONS & SOUL",
                      icon: Icons.favorite,
                      image: "assets/love.jpg",
                    ),

                    const SizedBox(height: 20),

                    // 💼 CAREER
                    _categoryCard(
                      context,
                      title: "CAREER",
                      subtitle: "PURPOSE & GROWTH",
                      icon: Icons.work,
                      image: "assets/career.jpg",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////

  Widget _categoryCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required String image,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
          )
        ],
      ),
      child: Column(
        children: [

          // 🔥 รูป (ปรับขนาดให้สวย)
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25),
            ),
            child: Image.asset(
              image,
              height: 180, // ✅ ขนาดพอดี
              width: double.infinity,
              fit: BoxFit.cover,

              errorBuilder: (_, __, ___) => Container(
                height: 180,
                color: Colors.grey[200],
                child: const Center(
                  child: Icon(Icons.image_not_supported),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          const Color(0xFF6C63FF).withOpacity(0.2),
                      child: Icon(icon,
                          color: const Color(0xFF6C63FF)),
                    ),
                    const SizedBox(width: 10),

                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6C63FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChooseSpreadScreen(
                            category: title,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Enter Sanctuary",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}