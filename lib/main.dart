import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'notes_ai/notes_app_shell.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: NotesAIApp(),
    ),
  );
}

class NotesAIApp extends StatelessWidget {
  const NotesAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MacosApp(
      title: 'Notes AI',
      theme: MacosThemeData.light().copyWith(
        primaryColor: const Color(0xFF007AFF),
        typography: MacosTypography(
          color: const Color(0xFF141018),
          headline: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          body: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF141018),
          ),
        ),
      ),
      darkTheme: MacosThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A84FF),
        typography: MacosTypography(
          color: Colors.white,
          headline: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          body: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.white70,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const NotesAppShell(),
    );
  }
}
