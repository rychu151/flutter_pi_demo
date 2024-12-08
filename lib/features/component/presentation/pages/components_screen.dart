import 'package:flutter/material.dart';
import '../../entities/component_entity.dart';
import '../widgets/component_tile.dart'; // We'll implement this widget below

class ComponentsScreen extends StatefulWidget {
  const ComponentsScreen({super.key});

  @override
  State<ComponentsScreen> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<ComponentsScreen> {
  final List<ComponentEntity> _components = [
    ComponentEntity(id: 1, name: 'Component A', description: 'Description of A'),
    ComponentEntity(id: 2, name: 'Component B', description: 'Description of B'),
    ComponentEntity(id: 3, name: 'Component C', description: 'Description of C'),
  ];

  ComponentEntity? _selectedComponent;

  void _onComponentSelected(ComponentEntity component) {
    setState(() {
      _selectedComponent = component;
    });
  }

  void _onNextPressed() {
    if (_selectedComponent != null) {
      Navigator.pushNamed(context, '/panel',arguments: _selectedComponent);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a component first.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Component'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: _components.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  final component = _components[index];
                  final isSelected = component == _selectedComponent;
                  return ComponentTile(
                    component: component,
                    isSelected: isSelected,
                    onTap: () => _onComponentSelected(component),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _onNextPressed,
              child: const Text('NEXT'),
            ),
          ],
        ),
      ),
    );
  }
}
