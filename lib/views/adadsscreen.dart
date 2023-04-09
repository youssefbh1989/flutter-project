import 'package:flutter/material.dart';

import 'addetailpage.dart';

class CategorySelectionPage extends StatefulWidget {
  @override
  _CategorySelectionPageState createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  String? _selectedCategory;

  final List<String> _categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
    'Category 5',
    'Category 6',
    'Category 7',
    'Category 8',
    'Category 9',
    'Category 10',
  ];

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _submitCategory() {
    if (_selectedCategory != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AdDetailsPage(category: _selectedCategory!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Select Category',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          crossAxisCount: 3,
          shrinkWrap: true,
          children: _categories.map((category) {
            return GestureDetector(
              onTap: () => _selectCategory(category),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _selectedCategory == category
                        ? Colors.black
                        : Colors.grey,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Center(
                  child: Text(
                    category,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: _submitCategory,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
