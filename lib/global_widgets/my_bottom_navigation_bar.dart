import 'package:flutter/material.dart';

import '../core/constants/app_strings.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const MyBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return BottomAppBar(
      color: colorScheme.surface,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, Icons.home_outlined, AppStrings.home, colorScheme),
          _buildNavItem(1, Icons.calendar_today_outlined, AppStrings.calendar, colorScheme),
          const SizedBox(width: 50.0),
          _buildNavItem(2, Icons.timer_outlined, AppStrings.focus, colorScheme),
          _buildNavItem(3, Icons.person_outline, AppStrings.profile, colorScheme),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label, ColorScheme colorScheme) {
    final bool isSelected = currentIndex == index;
    final Color color = isSelected ? colorScheme.onPrimary : Colors.grey.shade400;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onItemSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 23,),
          const SizedBox(height: 5,),
          Text(label, style: TextStyle(color: color, fontSize: 12)),
        ],
      ),
    );
  }
}
