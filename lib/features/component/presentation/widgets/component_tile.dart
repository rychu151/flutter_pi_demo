import 'package:flutter/material.dart';
import '../../entities/component_entity.dart';

class ComponentTile extends StatelessWidget {
  final ComponentEntity component;
  final bool isSelected;
  final VoidCallback onTap;

  const ComponentTile({
    super.key,
    required this.component,
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
            component.name,
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
