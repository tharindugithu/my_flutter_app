import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/model/User.dart';

class SearchUi extends StatefulWidget {
  @override
  _SearchUiState createState() => _SearchUiState();
}

class _SearchUiState extends State<SearchUi> {
  List<User> users = [];
  List<User> filteredUsers = [];
  bool isLoading = true;
  String errorMessage = "";
  TextEditingController searchController = TextEditingController(); // Add a text controller for the search field

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final Dio dio = Dio();
    // ... existing code ...
  }

  void filterUsers(String query) {
    if(query.isEmpty) {
      filteredUsers = users; // If the query is empty, show all users
    } else {
      filteredUsers = users
          .where((user) =>
              user.userName.toLowerCase().contains(query.toLowerCase()))
          .toList(); // Update the filtered list based on the query
    }
    setState(() {}); // Call setState to update the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController, // Use the controller here
              onChanged: filterUsers, // Call filterUsers on text change
              decoration: InputDecoration(
                hintText: 'Search by username',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : errorMessage.isNotEmpty
                    ? Center(
                        child: Text(
                          errorMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text('User ID: ${filteredUsers[index].userId}'),
                              subtitle: Text('Username: ${filteredUsers[index].userName}'),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
