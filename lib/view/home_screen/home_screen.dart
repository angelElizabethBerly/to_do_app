// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: [Icon(Icons.search), SizedBox(width: 10)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Today",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                SizedBox(width: 5),
                Icon(Icons.sunny)
              ],
            ),
            Column(
              children: List.generate(
                  5,
                  (index) => ListTile(
                        leading: Checkbox(
                          value: false,
                          onChanged: (value) {
                            value = true;
                          },
                        ),
                        title: Row(
                          children: [
                            Text("Task"),
                            SizedBox(width: 10),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("Incomplete"),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {}, icon: Icon(Icons.delete)),
                      )),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
        child: TextButton.icon(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.deepPurple)),
            onPressed: () {},
            icon: Text(
              "Add a task",
              style: TextStyle(color: Colors.white),
            ),
            label: Icon(Icons.add_circle, color: Colors.white)),
      ),
    );
  }
}
