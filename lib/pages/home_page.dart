import 'package:flutter/material.dart';
import 'package:myapp/models/user_model.dart';
import 'package:myapp/services/repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> listuser = [];
  Repository repository = Repository();
  // loading
  bool isLoading = true;

  // service get data
  getAll() async {
    listuser = await repository.getData();
    setState(() {
      listuser = listuser; // udah ada isi dari api
      isLoading = false;
    });
  }

  @override
  void initState() {
    getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('REST API'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              child: ListView.builder(
                itemCount: listuser.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.book),
                      title: Text(listuser[index].name),
                      subtitle: Text(listuser[index].email),
                      trailing: Icon(Icons.delete),
                    ),
                  );
                },
              ),
              onRefresh: () async {
                getAll();
              },
            ),
    );
  }
}
