import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'sidebar.dart';
import 'notes_grid.dart';
import 'ai_sidebar.dart';
import 'tag_management_view.dart';
import 'search_results_view.dart';

class NotesAppShell extends StatefulWidget {
  const NotesAppShell({super.key});

  @override
  State<NotesAppShell> createState() => _NotesAppShellState();
}

class _NotesAppShellState extends State<NotesAppShell> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      sidebar: buildSidebar(
        _pageIndex,
        (index) {
          setState(() => _pageIndex = index);
        },
      ),
      child: IndexedStack(
        index: _pageIndex,
        children: [
          const DashboardView(), // Index 0: All Notes
          const Center(child: Text('Favorites')), // Index 1
          const SearchResultsView(), // Index 2: AI Search
          const SizedBox.shrink(), // Index 3: Smart Folders Header
          const Center(child: Text('Recently Edited')), // Index 4
          const SizedBox.shrink(), // Index 5: Tags Header
          const TagManagementView(), // Index 6: Work (Mocking as Tag Management)
          const Center(child: Text('Personal')), // Index 7
          const Center(child: Text('Ideas')), // Index 8
        ],
      ),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: NotesGridView(),
        ),
        Container(
          width: 1,
          color: MacosColors.separatorColor,
        ),
        const AiAssistantSidebar(),
      ],
    );
  }
}
