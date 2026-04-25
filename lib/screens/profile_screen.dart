import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../data/user_session.dart';
import 'change_password_screen.dart';
import 'auth_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final displayName =
        UserSession.name.isNotEmpty ? UserSession.name : UserSession.email;

    final displayEmail = UserSession.email.isNotEmpty
        ? UserSession.email
        : "john.doe@example.com";

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6FB),

      body: SafeArea(
        child: Column(
          children: [

            AppHeader(
              title: "Profile",
              showBack: true,
              rightWidget: const Icon(
                Icons.settings,
                color: Color(0xFF6C63FF),
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [

                  // 👤 PROFILE
                  Column(
                    children: [

                      // 🔥 กดเปลี่ยนรูปได้
                      GestureDetector(
                        onTap: () {
                          print("Change image");
                        },
                        child: Stack(
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundColor: Color(0xFFE0DDF5),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: Color(0xFF6C63FF),
                                child: const Icon(
                                  Icons.edit,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        displayName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        displayEmail,
                        style: const TextStyle(color: Colors.grey),
                      ),

                      const SizedBox(height: 16),

                      // 🔥 ปุ่มเล็กลงแล้ว
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF7B6DFF),
                                Color(0xFF5B4FCF),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // 📄 DATA
                  _sectionCard([
                    _infoRow("USERNAME", displayName),
                    _divider(),

                    _infoRow("EMAIL ADDRESS", displayEmail),
                    _divider(),

                    _infoRow("PASSWORD", "••••••"),
                    const SizedBox(height: 6),

                    // 🔥 กดเปลี่ยนรหัสได้
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ChangePasswordScreen(),
                          ),
                        );
                      },
                      child: const Center(
                        child: Text(
                          "Change Password",
                          style: TextStyle(
                            color: Color(0xFF6C63FF),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ]),

                  const SizedBox(height: 20),

                  // 🔥 LOGOUT
                  GestureDetector(
                    onTap: () {
                      UserSession.clear();

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AuthScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.logout, color: Colors.red),
                          SizedBox(width: 8),
                          Text(
                            "Logout",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- COMPONENTS ----------------

  Widget _sectionCard(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: children),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Text(title,
              style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(height: 20);
  }
}