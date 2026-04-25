// lib/screens/auth_screen.dart

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'category_screen.dart';
import '../data/user_session.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  String get baseUrl {
    if (kIsWeb) {
      return "http://localhost/tarotcard/php";
    } else {
      return "http://10.0.2.2/tarotcard/php";
    }
  }

  Future<void> login() async {
    try {
      final res = await http.post(
        Uri.parse("$baseUrl/login.php"),
        body: {
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
        },
      );

      if (res.body.trim() != "error") {
        final data = jsonDecode(res.body);

        UserSession.setUser(
          id: int.parse(data["id"].toString()),
          userName: data["name"].toString(),
          userEmail: data["email"].toString(),
        );

        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const CategoryScreen(),
          ),
        );
      } else {
        showMsg("Login failed");
      }
    } catch (e) {
      showMsg("Error : $e");
    }
  }

  Future<void> register() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        confirmController.text.trim().isEmpty) {
      showMsg("Please fill all fields");
      return;
    }

    if (passwordController.text.trim() != confirmController.text.trim()) {
      showMsg("Password not match");
      return;
    }

    try {
      final res = await http.post(
        Uri.parse("$baseUrl/register.php"),
        body: {
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
        },
      );

      if (res.body.trim() == "success") {
        showMsg("Sign Up Success");

        setState(() {
          isLogin = true;
        });
      } else {
        showMsg(res.body);
      }
    } catch (e) {
      showMsg("Error : $e");
    }
  }

  void showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6FB),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Column(
                children: [
                  Icon(
                    Icons.auto_awesome,
                    color: Color(0xFF6C63FF),
                    size: 30,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "THE MODERN ORACLE",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6C63FF),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => isLogin = true),
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isLogin ? Colors.black : Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 5),
                              if (isLogin)
                                Container(
                                  height: 2,
                                  width: 40,
                                  color: const Color(0xFF6C63FF),
                                ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 20),

                        GestureDetector(
                          onTap: () => setState(() => isLogin = false),
                          child: Column(
                            children: [
                              Text(
                                "SIGN UP",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: !isLogin ? Colors.black : Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 5),
                              if (!isLogin)
                                Container(
                                  height: 2,
                                  width: 40,
                                  color: const Color(0xFF6C63FF),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Text(
                      isLogin ? "Welcome Back" : "Create Account",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      isLogin
                          ? "Enter your sanctuary to continue your journey."
                          : "Join the sanctuary to begin your journey.",
                      style: const TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 20),

                    const Text("EMAIL ADDRESS"),
                    const SizedBox(height: 8),
                    _input(
                      controller: emailController,
                      hint: "oracle@sanctuary.com",
                    ),

                    const SizedBox(height: 15),

                    const Text("PASSWORD"),
                    const SizedBox(height: 8),
                    _input(
                      controller: passwordController,
                      isPassword: true,
                      hint: "••••••••",
                    ),

                    const SizedBox(height: 15),

                    if (!isLogin) ...[
                      const Text("CONFIRM PASSWORD"),
                      const SizedBox(height: 8),
                      _input(
                        controller: confirmController,
                        isPassword: true,
                        hint: "••••••••",
                      ),
                      const SizedBox(height: 15),
                    ],

                    GestureDetector(
                      onTap: () {
                        if (isLogin) {
                          login();
                        } else {
                          register();
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF7B6DFF),
                              Color(0xFF5B4FCF),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            isLogin ? "Login" : "Sign Up",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    if (!isLogin)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? "),
                          GestureDetector(
                            onTap: () => setState(() => isLogin = true),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Color(0xFF6C63FF),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _input({
    required TextEditingController controller,
    bool isPassword = false,
    String hint = "",
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
        filled: true,
        fillColor: const Color(0xFFF1F1F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}