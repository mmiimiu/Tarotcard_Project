import 'package:flutter/material.dart';
import 'auth_screen.dart';
import '../widgets/primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FB),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            children: [

              const Spacer(),

              // 🌙 รูปวงกลม
              ClipOval(
                child: Image.asset(
                  "assets/moon1.jpg",
                  width: 260,
                  height: 260,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 30),

              // 🪄 Title
              const Text(
                "Arcana",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B3F72),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "THE MODERN ORACLE",
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 1.5,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "A peaceful sanctuary for your intuition and daily ritual.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const Spacer(),

              // 🚀 ใช้ปุ่มกลาง (PrimaryButton)
              PrimaryButton(
                text: "Get Started →",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AuthScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}