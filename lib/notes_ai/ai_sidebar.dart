
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class AiAssistantSidebar extends StatelessWidget {
  const AiAssistantSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MacosTheme.brightnessOf(context).isDark;
    return Container(
      width: 380,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF252525) : const Color(0xFFFBFBFD),
      ),
      child: Column(
        children: [
          _buildHeader(context, isDark),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                _buildAiMessage(
                  context,
                  isDark,
                  "Hello! I'm your Notes AI. I've analyzed your recent notes. Would you like me to summarize 'Project Alpha' or create a task list from your meeting minutes?",
                ),
                const SizedBox(height: 24),
                _buildUserMessage(
                  context,
                  isDark,
                  "Can you summarize the main action items from the Project Alpha note?",
                ),
                const SizedBox(height: 24),
                _buildAiMessage(
                  context,
                  isDark,
                  "Based on your Project Alpha notes, here are the key action items:",
                  bullets: [
                    "Finalize design specs by Friday",
                    "Schedule kickoff with dev team",
                    "Review marketing budget for Q4",
                  ],
                ),
              ],
            ),
          ),
          _buildInput(context, isDark),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF2F0F5),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF007AFF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Symbols.psychology, size: 20, color: Colors.white),
          ),
          const SizedBox(width: 12),
          const Text(
            'AI Assistant',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          MacosIconButton(
            icon: const Icon(Symbols.more_horiz, size: 22, color: Color(0xFF755E8D)),
            onPressed: () {},
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildAiMessage(BuildContext context, bool isDark, String text, {List<String>? bullets}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Color(0xFF007AFF),
            shape: BoxShape.circle,
          ),
          child: const Icon(Symbols.smart_toy, size: 16, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AI ASSISTANT',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  color: isDark ? Colors.white.withValues(alpha: 0.3) : const Color(0xFF755E8D),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  border: Border.all(
                    color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFE5E5E5),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(fontSize: 13, height: 1.5),
                    ),
                    if (bullets != null) ...[
                      const SizedBox(height: 8),
                      ...bullets.map((b) => Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("• ", style: TextStyle(fontWeight: FontWeight.bold)),
                            Expanded(child: Text(b, style: const TextStyle(fontSize: 13))),
                          ],
                        ),
                      )),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserMessage(BuildContext context, bool isDark, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'YOU',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  color: isDark ? Colors.white.withValues(alpha: 0.3) : const Color(0xFF755E8D),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  color: Color(0xFF007AFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 13, height: 1.5, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withValues(alpha: 0.1) : const Color(0xFFF2F0F5),
            shape: BoxShape.circle,
          ),
          child: Icon(Symbols.person, size: 18, color: isDark ? Colors.white70 : const Color(0xFF755E8D)),
        ),
      ],
    );
  }

  Widget _buildInput(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF252525) : Colors.white,
        border: Border(
          top: BorderSide(
            color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF2F0F5),
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF2F0F5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Expanded(
                  child: MacosTextField(
                    placeholder: 'Ask anything...',
                    maxLines: 4,
                    minLines: 1,
                    decoration: BoxDecoration(color: Colors.transparent),
                  ),
                ),
                const SizedBox(width: 8),
                MacosIconButton(
                  icon: const Icon(Symbols.arrow_upward, size: 18, color: Colors.white),
                  onPressed: () {},
                  backgroundColor: const Color(0xFF007AFF),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              MacosIconButton(icon: const Icon(Symbols.attach_file, size: 20, color: Color(0xFF755E8D)), onPressed: () {}, backgroundColor: Colors.transparent),
              MacosIconButton(icon: const Icon(Symbols.mic, size: 20, color: Color(0xFF755E8D)), onPressed: () {}, backgroundColor: Colors.transparent),
              MacosIconButton(icon: const Icon(Symbols.image, size: 20, color: Color(0xFF755E8D)), onPressed: () {}, backgroundColor: Colors.transparent),
              const Spacer(),
              if (isDark)
                Text(
                  'GPT-4 TURBO',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
