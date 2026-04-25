import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;

    return SizedBox(
      width: double.infinity,
      height: 55, // 🔥 fix ความสูงให้เท่าทุกหน้า
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled
              ? Colors.grey.shade400
              : const Color(0xFF6C63FF),

          foregroundColor: Colors.white, // 🔥 fix สี text

          elevation: 0,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // 🔥 ให้โค้งเหมือน design
          ),

          padding: EdgeInsets.zero, // 🔥 กัน padding ซ้ำ
        ),

        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isDisabled
                ? Colors.white.withOpacity(0.6)
                : Colors.white,
          ),
        ),
      ),
    );
  }
}