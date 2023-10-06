import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SizeSelectionScreen(),
    );
  }
}

class SizeSelectionScreen extends StatefulWidget {
  @override
  _SizeSelectionScreenState createState() => _SizeSelectionScreenState();
}

class _SizeSelectionScreenState extends State<SizeSelectionScreen> {
  String selectedSize = '';

  // Sizes to display as buttons
  List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Selection'),
        centerTitle: true,
      ),
      body: Center(
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: sizes.map((String size) {
            return Container(
              height: 39,
              width: 100,
              child: ElevatedButton(
                onPressed: () {

                  setState(() {
                    selectedSize = size;
                  });


                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Selected Size: $size'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: selectedSize == size ? Colors.grey : Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  minimumSize: Size(60, 60), // Set a fixed size for each button
                ),
                child: Text(
                  size,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
