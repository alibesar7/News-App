import 'package:flutter/material.dart';
import 'package:s/Network/Networkclient.dart';

import 'Model/postmodel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Networkclient client = Networkclient();
  List<Articles>? posts = []; // Changed to Articles
  int _selectedIndex = 0;

  List<String> categories = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports"
  ];

  @override
  void initState() {
    super.initState();
    fetchDataForCurrentCategory();
  }

  Future<void> fetchDataForCurrentCategory() async {
    // Fetch data for the current category and update the posts list
    posts = await client.FetchData(categories[_selectedIndex]);
    setState(() {}); // Trigger a rebuild to update UI
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    fetchDataForCurrentCategory(); // Fetch data for the new category
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Headlines Egypt",
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),
        ),
        backgroundColor: Color(0xFFF0E101D),
        centerTitle: false,
      ),
      body: _buildCategoryContent(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFF445A82),
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(backgroundColor: Color(0xFFF445A82),
            icon: Icon(Icons.movie),
            label: 'Entertainment',
          ),
          BottomNavigationBarItem(backgroundColor: Color(0xFFF445A82),
            icon: Icon(Icons.public),
            label: 'General',
          ),
          BottomNavigationBarItem(backgroundColor: Color(0xFFF445A82),
            icon: Icon(Icons.health_and_safety),
            label: 'Health',
          ),
          BottomNavigationBarItem(backgroundColor: Color(0xFFF445A82),
            icon: Icon(Icons.science),
            label: 'Science',
          ),
          BottomNavigationBarItem(backgroundColor: Color(0xFFF445A82),
            icon: Icon(Icons.sports),
            label: 'Sports',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
backgroundColor:   Color(0xFFF445A82),
    );
  }

  Widget _buildCategoryContent() {
    if (posts == null || posts!.isEmpty) {
      return Center(child: CircularProgressIndicator()); // Show loading indicator
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: posts!.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 500,
          width: 300,
          child: Center(
            child: Column(
              children: [
                posts![index].urlToImage != null && posts![index].urlToImage!.isNotEmpty
                    ? Image.network(posts![index].urlToImage!)
                    : Image.asset('Images/lionel-messi-football-barcelona-hd-wallpaper-preview.jpg'), // Update with your asset path
                SizedBox(height: 5),
                Text(
                  posts![index].description ?? 'News refers to information about recent events or developments, typically reported by\n'
                      ' journalists through various media channels, including newspapers, television, radio, and online platforms.\n'
                      'It covers a wide range of topics, including polit ',
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}