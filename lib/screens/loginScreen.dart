import 'package:dogo_app/screens/lesson_screen.dart';
import 'package:dogo_app/services/api_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> _login() async {
    setState(() {
      isLoading = true;
    });

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final res = await ApiService.login(email, password);

    setState(() {
      isLoading = false;
    });

    if (res["success"] == true) {
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LessonScreen()),
      );
    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res["message"] ?? "Login Failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/ChatGPT Image Aug 10, 2025, 08_36_54 PM (2).png',
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome Back',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: isLoading ? null : _login,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Login',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
