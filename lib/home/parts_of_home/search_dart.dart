import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/model/User.dart';

class SearchUi extends StatefulWidget {
  @override
  _SearchUiState createState() => _SearchUiState();
}

class _SearchUiState extends State<SearchUi> {
  List<User> users = [];
  bool isLoading = true;
  String errorMessage = "";
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final Dio dio = Dio();
    try {
      var res = await dio.get("http://10.0.2.2:3001/users");

      var resData = res.data as List;
      users = resData.map((e) => User.fromJson(e)).toList();
      print(users[0].userName);
      //isLoading = false;

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } on DioError catch (e) {
      print("DioError: $e");
      errorMessage = "Failed to fetch data. Please try again later.";

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error: $e");
      errorMessage = "An unexpected error occurred.";

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
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
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text('User ID: ${users[index].userId}'),
                        subtitle: Text('Username: ${users[index].userName}'),
                        // You can add more details as needed
                      ),
                    );
                  },
                ),
    );
  }
}
