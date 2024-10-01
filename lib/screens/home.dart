import 'package:flutter/material.dart';
import 'package:flutter_practice46_realtime_database/screens/task_add.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "/home_screen";

  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.width / 5,
        backgroundColor: Colors.black,
        title: Text(
          "To Do App",
          style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width / 13,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: index == 0
                ? const EdgeInsets.fromLTRB(15, 25, 15, 20)
                : const EdgeInsets.fromLTRB(15, 0, 15, 20),
            height: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 1)),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(11),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Read a book",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: MediaQuery.of(context).size.width / 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "1:11 PM",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: MediaQuery.of(context).size.width / 22,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                maxLines: 2,
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus volutpat orci sit amet orci faucibus.",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.remove_circle,
                                    size:
                                        MediaQuery.of(context).size.width / 10,
                                    color: Colors.red[800],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, TaskAddScreen.id);
        },
        backgroundColor: Colors.green[900],
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
