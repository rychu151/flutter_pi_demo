import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../component/entities/component_entity.dart';

class PanelScreen extends StatefulWidget {
  const PanelScreen({super.key});

  @override
  State<PanelScreen> createState() => _PanelScreenState();
}

class _PanelScreenState extends State<PanelScreen> {
  late Timer _timer;
  String _formattedTime = _formatCurrentTime();

  // Hardcoded previous declarations data
  final List<Map<String, dynamic>> _previousDeclarations = [
    {
      'datetime': DateTime.now().subtract(const Duration(hours: 1)),
      'author': 'Alice',
      'componentName': 'Component A',
    },
    {
      'datetime': DateTime.now().subtract(const Duration(hours: 2)),
      'author': 'Bob',
      'componentName': 'Component B',
    },
    {
      'datetime': DateTime.now().subtract(const Duration(hours: 3)),
      'author': 'Charlie',
      'componentName': 'Component C',
    },
  ];

  static String _formatCurrentTime() {
    final now = DateTime.now();
    return DateFormat('HH:mm').format(now);
  }

  @override
  void initState() {
    super.initState();
    // Update time every 30 seconds
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      setState(() {
        _formattedTime = _formatCurrentTime();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _logout() {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void _goToDeclarationScreen() {
    Navigator.pushNamed(context, '/declaration');
  }

  @override
  Widget build(BuildContext context) {
    final component = ModalRoute.of(context)!.settings.arguments as ComponentEntity;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _goToDeclarationScreen,
        child: const Text('+1', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Top row: LOGOUT (left), Clock icon & time (right)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _logout,
                    child: const Text('LOGOUT'),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time),
                      const SizedBox(width: 4),
                      Text(
                        _formattedTime,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Content area
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row with MEMBER button and chosen component tile
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            // Future instructions for MEMBER button can be implemented here
                          },
                          icon: const Icon(Icons.person_add),
                          label: const Text('MEMBER'),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  component.name,
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  component.description,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Fake list of previously declared components
                    Expanded(
                      child: ListView.builder(
                        itemCount: _previousDeclarations.length,
                        itemBuilder: (context, index) {
                          final item = _previousDeclarations[index];
                          final dateTime = item['datetime'] as DateTime;
                          final author = item['author'] as String;
                          final compName = item['componentName'] as String;

                          final formattedDateTime = DateFormat('yyyy-MM-dd HH:mm').format(dateTime);

                          return ListTile(
                            leading: const Icon(Icons.history),
                            title: Text(compName),
                            subtitle: Text('Author: $author | Declared at: $formattedDateTime'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
