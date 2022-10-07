import 'package:flutter/material.dart';

class MyStuffPage extends StatelessWidget {
  const MyStuffPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //backgroundColor: Colors.grey,
        appBar: appBar(),
        body: TabBarView(
          children: [
            Container(
                child: Center(
                    child: Text(
              "Watchlist",
              style: TextStyle(color: Colors.white),
            ))),
            Container(
              child: Center(
                child: Text(
                  "Purchases",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: Transform.scale(
        scale: 0.7,
        child: const CircleAvatar(
          backgroundColor: Colors.blue,
        ),
      ),
      title: const ListTile(
        title: Text('Muhirwa Gabo Oreste'),
        subtitle: Text('Switch profie'),
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))],
      bottom: const TabBar(
        tabs: [
          Tab(text: 'Watchlist'),
          Tab(text: 'Purchase'),
        ],
      ),
    );
  }
}
