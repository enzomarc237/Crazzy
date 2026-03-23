import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class FocusedEditorView extends StatelessWidget {
  const FocusedEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MacosTheme.brightnessOf(context).isDark;
    return MacosScaffold(
      children: [
        ContentArea(
          child: Column(
            children: [
              _buildHeader(context, isDark),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 32),
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 720),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Project Alpha Launch',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -1,
                            ),
                          ),
                          const SizedBox(height: 40),
                          _buildParagraph(
                            "Our primary objective for the Q4 rollout is to achieve seamless integration between the core infrastructure and the new user-facing interface. The initial testing phase yielded promising results, with a 40% reduction in latency compared to the legacy system.",
                            isDark,
                          ),
                          const SizedBox(height: 24),
                          _buildAiSuggestionLine(
                            context,
                            isDark,
                            "We need to finalize the marketing collateral by next Tuesday. This includes the technical whitepaper, the landing page assets, and the internal sales deck for the regional managers.",
                            suggestion: "To optimize for engagement, we could also consider a series of short-form video demonstrations highlighting the new AI-driven capabilities and their impact on daily workflow productivity.",
                          ),
                          const SizedBox(height: 24),
                          _buildParagraph(
                            "Following the collateral freeze, the engineering team will begin the phased migration of user data. We've established a 72-hour window for this process to ensure data integrity and provide a rollback path if necessary.",
                            isDark,
                          ),
                          const SizedBox(height: 24),
                          _buildParagraph(
                            "Key stakeholders have already approved the revised timeline. The next milestone is the executive review scheduled for Friday afternoon.",
                            isDark,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              _buildBottomCommandBar(context, isDark),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const SizedBox(width: 80), // Traffic lights space if needed
          const Expanded(
            child: Center(
              child: Text(
                'Project Alpha Launch',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: MacosColors.systemGrayColor),
              ),
            ),
          ),
          MacosIconButton(icon: const Icon(Symbols.share, size: 20, color: MacosColors.systemGrayColor), onPressed: () {}),
          MacosIconButton(icon: const Icon(Symbols.more_horiz, size: 20, color: MacosColors.systemGrayColor), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildParagraph(String text, bool isDark) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        height: 1.6,
        color: isDark ? Colors.white.withOpacity(0.8) : const Color(0xFF3A3A3C),
      ),
    );
  }

  Widget _buildAiSuggestionLine(BuildContext context, bool isDark, String text, {required String suggestion}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 24),
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(color: Color(0x40007AFF), width: 2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildParagraph(text, isDark),
                  const SizedBox(height: 8),
                  Text(
                    suggestion,
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.6,
                      fontStyle: FontStyle.italic,
                      color: const Color(0xFF007AFF).withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -48,
              left: 24,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF2C2C2E) : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: isDark ? Colors.white.withOpacity(0.1) : const Color(0xFFE5E5E5)),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
                  ],
                ),
                child: Row(
                  children: [
                    _buildAiActionButton(Symbols.expand_content, 'Expand'),
                    _buildDivider(isDark),
                    _buildAiActionButton(Symbols.edit_note, 'Rewrite'),
                    _buildDivider(isDark),
                    _buildAiActionButton(Symbols.tune, 'Change Tone'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAiActionButton(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF007AFF)),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFF007AFF))),
        ],
      ),
    );
  }

  Widget _buildDivider(bool isDark) {
    return Container(width: 1, height: 16, color: isDark ? Colors.white.withOpacity(0.1) : const Color(0xFFE5E5E5));
  }

  Widget _buildBottomCommandBar(BuildContext context, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(99),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Symbols.psychology, size: 18, color: Color(0xFF007AFF)),
          const SizedBox(width: 12),
          const Text(
            'Press ',
            style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text('⌘ K', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          const Text(
            ' for AI commands',
            style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 12),
          Container(width: 1, height: 16, color: Colors.white.withOpacity(0.2)),
          const SizedBox(width: 12),
          const Text(
            'Continue Writing',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}
