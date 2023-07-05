import 'dart:math';

import 'package:flutter/material.dart';

class Tasbih {
  final String title;
  int maxCount;

  Tasbih({required this.title, required this.maxCount});
}

final List<Tasbih> tasbihs = [
  Tasbih(title: 'الله أكبر', maxCount: 33),
  Tasbih(title: 'لا إله إلا الله', maxCount: 33),
  Tasbih(title: 'سبحان الله وبحمده', maxCount: 33),
  Tasbih(title: 'أستغفر الله', maxCount: 33),
  // Add more tasbihs here
  // ...
];

class TasbihApp extends StatefulWidget {
  const TasbihApp({Key? key}) : super(key: key);

  @override
  _TasbihAppState createState() => _TasbihAppState();
}

class _TasbihAppState extends State<TasbihApp>
    with SingleTickerProviderStateMixin {
  int _count = 0;
  int _tasbihCounter = 0;
  Tasbih _selectedTasbih = tasbihs[0];
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isEditing = false;
  TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    super.initState();
  }

  void _incrementCount() {
    if (_count < _selectedTasbih.maxCount) {
      setState(() {
        _count++;
        _tasbihCounter++;
      });
      _animationController.reset();
      _animationController.forward();
    }
  }

  void _resetCount() {
    setState(() {
      _count = 0;
    });
    _animationController.reset();
  }

  void _changeSelectedTasbih(Tasbih tasbih) {
    setState(() {
      _selectedTasbih = tasbih;
      _count = 0;
    });
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
      if (!_isEditing) {
        _editingController.clear();
      }
    });
  }

  void _saveTasbih() {
    String newTasbihTitle = _editingController.text.trim();
    if (newTasbihTitle.isNotEmpty) {
      Tasbih newTasbih = Tasbih(title: newTasbihTitle, maxCount: 0);
      setState(() {
        tasbihs.add(newTasbih);
        _selectedTasbih = newTasbih;
      });
      _toggleEditing();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String countText = '$_count/${_selectedTasbih.maxCount}';
    String tasbihCounterText = '$_tasbihCounter';
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasbih'),
        actions: [
          IconButton(
            onPressed: _toggleEditing,
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _incrementCount,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (BuildContext context, Widget? child) {
                  return Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: _animation.value * 30,
                          spreadRadius: _animation.value * 5,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: 180.0,
                          height: 180.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                Colors.white.withOpacity(0.2),
                                Colors.transparent,
                              ],
                              stops: [0.3, 1.0],
                            ),
                          ),
                        ),
                        CustomPaint(
                          foregroundPainter: CircleProgressBarPainter(
                            progress: _count / _selectedTasbih.maxCount,
                            color: Colors.white,
                            width: 10.0,
                          ),
                          child: Center(
                            child: Text(
                              countText,
                              style:
                                  TextStyle(fontSize: 50.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              _selectedTasbih.title,
              style: TextStyle(fontSize: 30.0, color: Colors.blue),
            ),
            SizedBox(height: 16.0),
            Text(
              'Tasbih Counter: $tasbihCounterText',
              style: TextStyle(fontSize: 20.0, color: Colors.blue),
            ),
            SizedBox(height: 16.0),
            _isEditing ? _buildEditingWidget() : _buildDropdownWidget(),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _resetCount,
              child: Text('Reset'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditingWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add a New Tasbih:',
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: TextField(
                controller: _editingController,
                decoration: InputDecoration(
                  hintText: 'Type Tasbih Name',
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _saveTasbih,
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
            ),
            SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: _toggleEditing,
              child: Text('Cancel'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdownWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Select Tasbih:', style: TextStyle(color: Colors.blue)),
        SizedBox(width: 8.0),
        DropdownButton<Tasbih>(
          value: _selectedTasbih,
          onChanged: (Tasbih? selectedTasbih) {
            if (selectedTasbih != null) {
              _changeSelectedTasbih(selectedTasbih);
            }
          },
          items: tasbihs.map((Tasbih tasbih) {
            return DropdownMenuItem<Tasbih>(
              value: tasbih,
              child: Text(
                tasbih.title,
                style: TextStyle(color: Colors.blue),
              ),
            );
          }).toList(),
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('Edit Max Count'),
                content: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (String value) {
                    setState(() {
                      _selectedTasbih.maxCount = int.parse(value);
                    });
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _resetCount();
                    },
                    child: Text('Reset Count'),
                  ),
                ],
              ),
            );
          },
          icon: Icon(Icons.edit),
        ),
      ],
    );
  }
}

class CircleProgressBarPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double width;

  CircleProgressBarPainter({
    required this.progress,
    required this.color,
    required this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - width) / 2;

    final backgroundPaint = Paint()
      ..color = color.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -0.5 * pi,
      2 * pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
