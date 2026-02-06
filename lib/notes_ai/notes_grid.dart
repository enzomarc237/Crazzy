import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'dashboard_header.dart';

class NotesGridView extends StatelessWidget {
  const NotesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      children: [
        ContentArea(
          builder: (context, scrollController) => Column(
            children: [
              const DashboardHeader(title: 'All Notes'),
              Expanded(
                child: GridView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.all(32),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    mainAxisExtent: 260,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const NoteCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MacosTheme.brightnessOf(context).isDark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? MacosColors.white.withOpacity(0.05) : MacosColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? MacosColors.white.withOpacity(0.1) : const Color(0xFFE5E5E5),
        ),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF007AFF).withOpacity(0.05),
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF007AFF).withOpacity(0.2),
                  const Color(0xFF9C27B0).withOpacity(0.2),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Center(
              child: Icon(Symbols.rocket_launch, size: 40, color: Color(0xFF007AFF)),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Project Alpha Launch',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            'Oct 24 • Last edited 2h ago',
            style: TextStyle(
              fontSize: 11,
              color: isDark ? MacosColors.white.withOpacity(0.5) : const Color(0xFF755E8D),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF007AFF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'WORK',
                  style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Color(0xFF007AFF)),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isDark ? MacosColors.white.withOpacity(0.05) : const Color(0xFFF2F0F5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Q4',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: isDark ? MacosColors.white.withOpacity(0.5) : const Color(0xFF755E8D),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
