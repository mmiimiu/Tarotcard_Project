import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showBack;
  final Widget? rightWidget; // ✅ เพิ่มตรงนี้

  const AppHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.showBack = false,
    this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [

          // 🔝 TOP BAR
          Row(
            children: [

              // 🔙 Back Button (มาตรฐานเดียวทั้งแอป)
              if (showBack)
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const Icon(Icons.arrow_back),
                  ),
                )
              else
                const SizedBox(width: 40),

              const Spacer(),

              Text(
                "The Modern Oracle",
                style: TextStyle(
                  color: Color(0xFF6C63FF),
                  fontWeight: FontWeight.w600,
                ),
              ),

              const Spacer(),

              // 👉 ใช้ widget ขวา (เช่น settings)
              rightWidget ??
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: Color(0xFFE0DDF5),
                  ),
            ],
          ),

          const SizedBox(height: 16),

          // 🔤 TITLE
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          if (subtitle != null) ...[
            const SizedBox(height: 6),
            Text(
              subtitle!,
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}