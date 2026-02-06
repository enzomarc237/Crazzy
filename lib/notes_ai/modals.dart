import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'dart:ui';

class AiSummaryModal extends StatelessWidget {
  const AiSummaryModal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MacosTheme.brightnessOf(context).isDark;
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: Container(
            width: 560,
            height: 600,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xB31E1E1E) : const Color(0xB3FFFFFF),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: isDark ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.3)),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 60, offset: const Offset(0, 20)),
              ],
            ),
            child: Column(
              children: [
                _buildHeader(context, isDark),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(32),
                    children: [
                      _buildSection(context, isDark, 'KEY POINTS', [
                        'Strategic focus on Q4 release for a revolutionary AI note-taking experience.',
                        'Inclusion of core features: Real-time collaboration and multimodal input.',
                        '\$50k budget allocation for initial social media marketing campaigns.',
                      ]),
                      const SizedBox(height: 32),
                      _buildActionItems(context, isDark),
                      const SizedBox(height: 32),
                      _buildSentiment(context, isDark),
                    ],
                  ),
                ),
                _buildFooter(context, isDark),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.05))),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF007AFF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Symbols.auto_awesome, size: 20, color: Color(0xFF007AFF)),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('AI Summary', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Text(
                'GENERATED FROM PROJECT ALPHA LAUNCH',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: MacosColors.systemGrayColor, letterSpacing: 0.5),
              ),
            ],
          ),
          const Spacer(),
          MacosIconButton(
            icon: const Icon(Symbols.close, size: 20, color: MacosColors.systemGrayColor),
            onPressed: () => Navigator.of(context).pop(),
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, bool isDark, String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: MacosColors.systemGrayColor, letterSpacing: 1.5)),
        const SizedBox(height: 16),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 6, height: 6, margin: const EdgeInsets.only(top: 6), decoration: const BoxDecoration(color: Color(0xFF007AFF), shape: BoxShape.circle)),
              const SizedBox(width: 12),
              Expanded(child: Text(item, style: const TextStyle(fontSize: 13, height: 1.5))),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildActionItems(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('KEY ACTION ITEMS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: MacosColors.systemGrayColor, letterSpacing: 1.5)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(color: const Color(0xFF007AFF).withOpacity(0.1), borderRadius: BorderRadius.circular(99)),
              child: const Text('3 TASKS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF007AFF))),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildCheckbox(context, 'Finalize brand assets (Marketing)', true),
        _buildCheckbox(context, 'Complete SOC2 Compliance check', false),
        _buildCheckbox(context, 'Reschedule weekly sync to Tuesdays', false),
      ],
    );
  }

  Widget _buildCheckbox(BuildContext context, String text, bool checked) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          MacosCheckbox(value: checked, onChanged: (v) {}),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildSentiment(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('SENTIMENT ANALYSIS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: MacosColors.systemGrayColor, letterSpacing: 1.5)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(99),
            border: Border.all(color: Colors.green.withOpacity(0.2)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Symbols.trending_up, size: 18, color: Colors.green),
              SizedBox(width: 8),
              Text('Positive & Professional', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'The tone is optimistic and decisive, focusing on clear deliverables and growth objectives.',
          style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: MacosColors.systemGrayColor),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? Colors.black.withOpacity(0.2) : Colors.black.withOpacity(0.02),
        border: Border(top: BorderSide(color: Colors.black.withOpacity(0.05))),
      ),
      child: Row(
        children: [
          PushButton(
            controlSize: ControlSize.large,
            secondary: true,
            onPressed: () {},
            child: const Row(children: [Icon(Symbols.refresh, size: 18), SizedBox(width: 8), Text('Regenerate')]),
          ),
          const Spacer(),
          PushButton(
            controlSize: ControlSize.large,
            secondary: true,
            onPressed: () {},
            child: const Row(children: [Icon(Symbols.content_copy, size: 18), SizedBox(width: 8), Text('Copy')]),
          ),
          const SizedBox(width: 12),
          PushButton(
            controlSize: ControlSize.large,
            onPressed: () {},
            child: const Row(children: [Icon(Symbols.input, size: 18), SizedBox(width: 8), Text('Insert into Note')]),
          ),
        ],
      ),
    );
  }
}

class SmartFolderModal extends StatelessWidget {
  const SmartFolderModal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MacosTheme.brightnessOf(context).isDark;
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            width: 640,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xE62C2C2E) : const Color(0xE6FFFFFF),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 60, offset: const Offset(0, 30)),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(context, isDark),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Folder Name'),
                      const MacosTextField(placeholder: 'e.g., Important Work Documents'),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildLabel('MATCH ANY OF THE FOLLOWING RULES'),
                          PushButton(
                            controlSize: ControlSize.small,
                            onPressed: () {},
                            secondary: true,
                            child: const Row(children: [Icon(Symbols.add, size: 16), SizedBox(width: 4), Text('Add Rule')]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildRuleRow(context, 'Tag', 'is', 'Work'),
                      const SizedBox(height: 12),
                      _buildRuleRow(context, 'Sentiment', 'is', 'Positive'),
                      const SizedBox(height: 12),
                      _buildRuleRow(context, 'Date Modified', 'is after', '2023-10-01'),
                    ],
                  ),
                ),
                _buildFooter(context, isDark),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('New Smart Folder', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          Row(
            children: [
              _buildTrafficLight(const Color(0xFFFF5F56)),
              const SizedBox(width: 6),
              _buildTrafficLight(const Color(0xFFFFBD2E)),
              const SizedBox(width: 6),
              _buildTrafficLight(const Color(0xFF27C93F)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrafficLight(Color color) {
    return Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle));
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4),
      child: Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF755E8D))),
    );
  }

  Widget _buildRuleRow(BuildContext context, String attr, String cond, String val) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(child: _buildDropDown(attr)),
              const SizedBox(width: 8),
              Expanded(child: _buildDropDown(cond)),
              const SizedBox(width: 8),
              Expanded(child: MacosTextField(placeholder: val)),
            ],
          ),
        ),
        const SizedBox(width: 8),
        MacosIconButton(icon: const Icon(Symbols.remove_circle_outline, size: 20, color: Color(0xFF755E8D)), onPressed: () {}),
      ],
    );
  }

  Widget _buildDropDown(String text) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: MacosColors.controlBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: MacosColors.controlColor),
      ),
      child: Row(
        children: [
          Text(text, style: const TextStyle(fontSize: 13)),
          const Spacer(),
          const Icon(CupertinoIcons.chevron_up_chevron_down, size: 12, color: MacosColors.systemGrayColor),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PushButton(controlSize: ControlSize.large, secondary: true, onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
          const SizedBox(width: 12),
          PushButton(controlSize: ControlSize.large, onPressed: () {}, child: const Text('Create Folder')),
        ],
      ),
    );
  }
}
