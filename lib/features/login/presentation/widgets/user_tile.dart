import 'package:flutter/material.dart';

import '../../entities/user.dart';

class UserTile extends StatelessWidget {
  final User user;
  final bool isSelected;
  final VoidCallback onTap;

  const UserTile({
    super.key,
    required this.user,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.blueAccent : Colors.grey[300],
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            user.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
