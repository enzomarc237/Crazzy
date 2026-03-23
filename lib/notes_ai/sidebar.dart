import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

Sidebar buildSidebar(int selectedIndex, ValueChanged<int> onIndexChanged) {
  return Sidebar(
    minWidth: 280,
    builder: (context, scrollController) {
      return SidebarItems(
        currentIndex: selectedIndex,
        onChanged: onIndexChanged,
        scrollController: scrollController,
        itemSize: SidebarItemSize.large,
        items: [
          SidebarItem(
            leading: const Icon(Symbols.description, size: 20),
            label: const Text('All Notes'),
            trailing: const Text('124', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
          ),
          SidebarItem(
            leading: const Icon(Symbols.star, size: 20),
            label: const Text('Favorites'),
            trailing: const Text('12', style: TextStyle(fontSize: 11)),
          ),
          SidebarItem(
            leading: const Icon(Symbols.psychology, size: 20),
            label: const Text('AI Search'),
          ),
          const SidebarItem(
            label: Text('Smart Folders', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF755E8D))),
            focusNode: null,
          ),
          SidebarItem(
            leading: const Icon(Symbols.folder_special, size: 20),
            label: const Text('Recently Edited'),
          ),
          const SidebarItem(
            label: Text('Tags', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF755E8D))),
          ),
          SidebarItem(
            leading: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFF007AFF), shape: BoxShape.circle)),
            label: const Text('Work'),
          ),
          SidebarItem(
            leading: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
            label: const Text('Personal'),
          ),
          SidebarItem(
            leading: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.amber, shape: BoxShape.circle)),
            label: const Text('Ideas'),
          ),
        ],
      );
    },
    top: Column(
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCwsL4tiOdtos8J29r2vPOZiO-Ea60LK6Ldm7uBxgt374P1pxEntn-rqoeVi8UOI9w0C8leNkxOraLt4fgGvUH6-3yCH4s2GON4XRBiVDXTJh5eI-tKO2OVmUlwA0jHbObHDQqB-eQ_dZ147LADlqz8zD7Uv7hlVQd5Z-ZmvhjZx01iwMKFf65evCx7zOSPKoDvOLHvaxtbE8hR0amQPP_7GscqPpAceyScZVhQwCP3oCIuohaNi52VGDydNZircwPeiLvwCzqr7l8'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Notes AI', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
                  const Text('Premium Plan', style: TextStyle(fontSize: 11, color: Color(0xFF007AFF), fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    ),
    bottom: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: PushButton(
            controlSize: ControlSize.large,
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Symbols.add, size: 18),
                SizedBox(width: 4),
                Text('New Note', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              MacosListTile(
                leading: const Icon(Symbols.settings, size: 20, color: Color(0xFF755E8D)),
                title: const Text('Settings', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                onClick: () {},
              ),
              MacosListTile(
                leading: const Icon(Symbols.delete, size: 20, color: Color(0xFF755E8D)),
                title: const Text('Trash', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                onClick: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    ),
  );
}
