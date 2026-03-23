import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class TagManagementView extends StatelessWidget {
  const TagManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MacosTheme.brightnessOf(context).isDark;
    return MacosScaffold(
      children: [
        ContentArea(
          builder: (context, scrollController) => Column(
            children: [
              _buildHeader(context, isDark),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(32),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: isDark ? Colors.white.withOpacity(0.05) : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDark ? Colors.white.withOpacity(0.1) : const Color(0xFFE5E5E5),
                        ),
                      ),
                      child: Column(
                        children: [
                          _buildTagRow(context, isDark, 'Work', const Color(0xFF007AFF), 42, isLast: false),
                          _buildTagRow(context, isDark, 'Personal', Colors.green, 28, isLast: false),
                          _buildTagRow(context, isDark, 'Ideas', Colors.amber, 15, isLast: false),
                          _buildTagRow(context, isDark, 'Urgent', Colors.red, 5, isLast: false),
                          _buildTagRow(context, isDark, 'Archive', Colors.blueGrey, 102, isLast: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      decoration: BoxDecoration(
        color: isDark ? MacosColors.windowBackgroundColor.withOpacity(0.8) : Colors.white.withOpacity(0.8),
        border: Border(
          bottom: BorderSide(
            color: isDark ? Colors.white.withOpacity(0.05) : const Color(0xFFF2F0F5),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Manage Tags',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Organize and categorize your notes with custom labels',
                style: TextStyle(fontSize: 13, color: Color(0xFF755E8D)),
              ),
            ],
          ),
          PushButton(
            controlSize: ControlSize.large,
            onPressed: () {},
            child: const Row(
              children: [
                Icon(Symbols.add, size: 20),
                SizedBox(width: 8),
                Text('New Tag'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagRow(BuildContext context, bool isDark, String name, Color color, int count, {bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: isLast ? null : Border(
          bottom: BorderSide(
            color: isDark ? Colors.white.withOpacity(0.05) : const Color(0xFFF2F0F5),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'NOTES',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white.withOpacity(0.4) : const Color(0xFF755E8D),
                  letterSpacing: 1.0,
                ),
              ),
              Text(
                count.toString(),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(width: 24),
          MacosIconButton(
            icon: const Icon(Symbols.delete, size: 20, color: Color(0xFF755E8D)),
            onPressed: () {},
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
