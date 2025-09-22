import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;
  String _language = "en"; // en = English, ar = Arabic

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // ✅ تفعيل دعم اللغات
      supportedLocales: const [
        Locale("en"), // English
        Locale("ar"), // Arabic
      ],
      locale: Locale(_language),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_language == "en" ? "Settings" : "الإعدادات"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _language == "en" ? "John Doe" : "جون دو",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _language == "en"
                            ? "john@example.com"
                            : "جون@ايميل.كوم",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.edit),
              title: Text(_language == "en" ? "Edit Profile" : "تعديل الملف"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: Text(_language == "en" ? "Notifications" : "الإشعارات"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(_language == "en" ? "Language" : "اللغة"),
              trailing: DropdownButton<String>(
                value: _language,
                items: const [
                  DropdownMenuItem(value: "en", child: Text("English")),
                  DropdownMenuItem(value: "ar", child: Text("العربية")),
                ],
                onChanged: (val) {
                  setState(() {
                    _language = val!;
                  });
                },
              ),
            ),
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: Text(_language == "en" ? "Dark Mode" : "الوضع الداكن"),
              value: _isDarkMode,
              onChanged: (val) {
                setState(() {
                  _isDarkMode = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
