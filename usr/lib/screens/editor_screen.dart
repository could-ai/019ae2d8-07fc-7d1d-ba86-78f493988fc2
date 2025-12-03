import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  String _selectedTool = 'select'; // select, move, brush
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Sidebar: Assets
          Container(
            width: 250,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: AppTheme.primaryIndigo,
                  width: double.infinity,
                  child: const Text(
                    'Assets',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: [
                      _buildAssetCategory('Characters', Icons.person),
                      _buildAssetItem('Hero Boy', Colors.blue),
                      _buildAssetItem('Hero Girl', Colors.pink),
                      _buildAssetItem('Ninja', Colors.black),
                      const SizedBox(height: 16),
                      _buildAssetCategory('Environment', Icons.landscape),
                      _buildAssetItem('Grass Block', Colors.green),
                      _buildAssetItem('Stone Block', Colors.grey),
                      _buildAssetItem('Tree', Colors.green[800]!),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Center: Canvas
          Expanded(
            child: Column(
              children: [
                // Top Toolbar
                Container(
                  height: 60,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Ninja Run - Level 1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.play_arrow, color: AppTheme.accentMint),
                        onPressed: () {},
                        tooltip: 'Preview',
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.save, size: 18),
                        label: const Text('Save'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Game Canvas Area
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey[400]!),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        // Grid Background (Simulated)
                        Positioned.fill(
                          child: CustomPaint(
                            painter: GridPainter(),
                          ),
                        ),
                        // Example Dropped Item
                        Positioned(
                          left: 100,
                          top: 200,
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.blue,
                            child: const Icon(Icons.person, color: Colors.white),
                          ),
                        ),
                        Positioned(
                          left: 100,
                          top: 250,
                          child: Container(
                            width: 200,
                            height: 50,
                            color: Colors.green,
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Drag assets here',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Right Sidebar: Properties
          Container(
            width: 250,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey[100],
                  width: double.infinity,
                  child: const Text(
                    'Properties',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Selected: Hero Boy'),
                      const SizedBox(height: 16),
                      TextFormField(
                        initialValue: '100',
                        decoration: const InputDecoration(labelText: 'X Position'),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        initialValue: '200',
                        decoration: const InputDecoration(labelText: 'Y Position'),
                      ),
                      const SizedBox(height: 16),
                      const Text('Behavior'),
                      SwitchListTile(
                        title: const Text('Physics'),
                        value: true,
                        onChanged: (v) {},
                        contentPadding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetCategory(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetItem(String name, Color color) {
    return Draggable<String>(
      data: name,
      feedback: Material(
        color: Colors.transparent,
        child: Container(
          width: 50,
          height: 50,
          color: color.withOpacity(0.5),
          child: const Icon(Icons.add),
        ),
      ),
      child: Card(
        margin: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          leading: Container(
            width: 32,
            height: 32,
            color: color,
          ),
          title: Text(name, style: const TextStyle(fontSize: 14)),
          dense: true,
        ),
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 1;

    const double gridSize = 50;

    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
