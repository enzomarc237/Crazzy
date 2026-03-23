import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({super.key});

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
                    _buildSectionHeader(context, isDark, Symbols.temp_preferences_custom, 'AI SEMANTIC MATCHES'),
                    const SizedBox(height: 12),
                    _buildResultCard(
                      context,
                      isDark,
                      title: 'Q4 Growth Initiatives',
                      reasoning: 'Related to product launch phases',
                      time: '2 days ago',
                      snippet: '...exploring new channels for the upcoming software release. We need to align the messaging across social and email to ensure the go-to-market plan matches our technical milestones...',
                      isSemantic: true,
                    ),
                    const SizedBox(height: 12),
                    _buildResultCard(
                      context,
                      isDark,
                      title: 'Competitor Analysis - Summer 2023',
                      reasoning: 'Contextually relevant to "Strategy"',
                      time: 'Oct 12',
                      snippet: '...understanding how others position their flagship products helps us define our unique value proposition. This will be the foundation for the promotional outreach next quarter...',
                      isSemantic: true,
                    ),
                    const SizedBox(height: 32),
                    _buildSectionHeader(context, isDark, Symbols.match_word, 'EXACT MATCHES'),
                    const SizedBox(height: 12),
                    _buildResultCard(
                      context,
                      isDark,
                      title: 'Project Alpha Marketing Strategy',
                      time: '3h ago',
                      snippet: 'Comprehensive marketing strategy for Project Alpha including budget allocation, target demographics, and key performance indicators for the first 90 days...',
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
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Symbols.search, color: Color(0xFF007AFF), size: 24),
              const SizedBox(width: 12),
              const Text(
                'Search Results',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              PushButton(
                controlSize: ControlSize.small,
                onPressed: () {},
                secondary: true,
                child: const Row(
                  children: [
                    Icon(Symbols.auto_fix_high, size: 16),
                    SizedBox(width: 8),
                    Text('Save as Smart Folder'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const MacosSearchField(
            placeholder: 'marketing strategy for project alpha',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, bool isDark, IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF755E8D)),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Color(0xFF755E8D),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 1,
            color: isDark ? Colors.white.withOpacity(0.05) : const Color(0xFFF2F0F5),
          ),
        ),
      ],
    );
  }

  Widget _buildResultCard(
    BuildContext context,
    bool isDark, {
    required String title,
    String? reasoning,
    required String time,
    required String snippet,
    bool isSemantic = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSemantic
            ? const Color(0xFF007AFF).withOpacity(0.05)
            : (isDark ? Colors.white.withOpacity(0.05) : Colors.white),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSemantic
              ? const Color(0xFF007AFF).withOpacity(0.2)
              : (isDark ? Colors.white.withOpacity(0.1) : const Color(0xFFE5E5E5)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isSemantic ? const Color(0xFF007AFF) : null,
                    ),
                  ),
                  if (reasoning != null) ...[
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: isDark ? Colors.black.withOpacity(0.2) : Colors.white,
                        borderRadius: BorderRadius.circular(99),
                        border: Border.all(color: const Color(0xFF007AFF).withOpacity(0.2)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Symbols.lightbulb, size: 12, color: Color(0xFF007AFF)),
                          const SizedBox(width: 4),
                          Text(
                            'Reasoning: $reasoning',
                            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF007AFF)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
              Text(
                time,
                style: TextStyle(
                  fontSize: 11,
                  color: isDark ? Colors.white.withOpacity(0.4) : const Color(0xFF755E8D),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            snippet,
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: isDark ? Colors.white.withOpacity(0.6) : const Color(0xFF755E8D),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
