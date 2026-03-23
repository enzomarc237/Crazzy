import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class DashboardHeader extends StatelessWidget {
  final String title;
  const DashboardHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: const BoxDecoration(
        color: MacosColors.windowBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: MacosColors.separatorColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(width: 32),
          Text(
            'File',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: MacosTheme.brightnessOf(context).isDark ? MacosColors.white.withValues(alpha: 0.6) : MacosColors.black.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(width: 24),
          Text(
            'Edit',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: MacosTheme.brightnessOf(context).isDark ? MacosColors.white.withValues(alpha: 0.6) : MacosColors.black.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(width: 24),
          Text(
            'View',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: MacosTheme.brightnessOf(context).isDark ? MacosColors.white.withValues(alpha: 0.6) : MacosColors.black.withValues(alpha: 0.6),
            ),
          ),
          const Spacer(),
          const SizedBox(
            width: 240,
            child: MacosSearchField(
              placeholder: 'Search notes...',
            ),
          ),
          const SizedBox(width: 16),
          MacosIconButton(
            icon: const Icon(Symbols.grid_view, size: 20),
            onPressed: () {},
            boxConstraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            backgroundColor: MacosColors.controlBackgroundColor,
          ),
          const SizedBox(width: 8),
          MacosIconButton(
            icon: const Icon(Symbols.sort, size: 20),
            onPressed: () {},
            boxConstraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            backgroundColor: MacosColors.controlBackgroundColor,
          ),
        ],
      ),
    );
  }
}
