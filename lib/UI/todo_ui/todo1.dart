
import 'package:flutter/material.dart';

class TodoUIPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;

    return Scaffold(
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Tasks',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Today',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 80,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Checkbox(
                                  value: isChecked, onChanged: (value) {}),
                            ),
                            Expanded(
                              flex: 5,
                              child: Card(elevation: 3,
                                child: ListTile(
                                  title: Text(
                                    'Meeting with a friend',
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  subtitle: Text(
                                    'tomorrow by 6pm',
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ));
                  }),
            ),
          )
        ],
      )),
    );
  }
}
