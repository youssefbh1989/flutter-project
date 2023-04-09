import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchTerm = '';
  List<String> _searchResults = List<String>.generate(50, (int index) => 'Result ${index + 1}');

  // variables to keep track of filter state
  bool _filterApplied = false;
  String _selectedFilter = '';

  void _search() {
    // function to perform search with current search term and filters
    List<String> results = List<String>.generate(50, (int index) => 'Result ${index + 1}');
    if (_filterApplied && _selectedFilter.isNotEmpty) {
      results = results.where((result) => result.contains(_selectedFilter)).toList();
    }
    if (_searchTerm.isNotEmpty) {
      results = results.where((result) => result.contains(_searchTerm)).toList();
    }
    setState(() {
      _searchResults = results;
    });
  }

  void _clearFilters() {
    // function to clear filter state
    setState(() {
      _filterApplied = false;
      _selectedFilter = '';
    });
  }

  void _applyFilter(String filter) {
    // function to apply filter and update filter state
    setState(() {
      _filterApplied = true;
      _selectedFilter = filter;
    });
    _search();
  }

  void _showFilterPopup() {
    // function to show filter popup
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Filter Results',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('Filter 1'),
                      onTap: () {
                        _applyFilter('Filter 1');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Filter 2'),
                      onTap: () {
                        _applyFilter('Filter 2');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Filter 3'),
                      onTap: () {
                        _applyFilter('Filter 3');
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  _clearFilters();
                  Navigator.pop(context);
                },
                child: Text('Clear Filters',style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          onChanged: (String searchTerm) {
            setState(() {
              _searchTerm = searchTerm;
            });
            _search();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: _showFilterPopup,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_searchResults[index]),
          );
        },
      ),
    );
  }
}