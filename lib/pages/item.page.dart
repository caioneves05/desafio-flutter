import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  List<Item> Itens = [
    Item(name: 'ITEM MENU 01', icon: Icons.check_box),
    Item(name: 'ITEM MENU 02', icon: Icons.calendar_month),
    Item(name: 'ITEM MENU 03', icon: Icons.refresh),
    Item(name: 'ITEM MENU 04', icon: Icons.lock),
    Item(name: 'ITEM MENU 05', icon: Icons.car_crash),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MOBI'),
        backgroundColor: Color.fromARGB(255, 36, 36, 36),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 36, 36, 36),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome do usuário',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'user@email.com.br',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            for (int i = 0; i < Itens.length; i++)
              ListTile(
                leading: Icon(Itens[i].icon),
                title: Text(Itens[i].name),
                onTap: () {
                  setState(() {
                    Itens[i].icon = Icons.lock_open;
                  });
                },
              ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        padding: EdgeInsets.all(25),
        children: [
          for (int i = 0; i < Itens.length; i++)
            Card(
              color: Color.fromARGB(255, 36, 36, 36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: ListTile(
                  leading: Icon(Itens[i].icon), iconColor: Colors.yellow,
                  title: Text(Itens[i].name,), textColor: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class Item {
  String name;
  IconData icon;

  Item({required this.name, required this.icon});
}
