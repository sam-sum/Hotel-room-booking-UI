import 'package:flutter/material.dart';

class RoomsPanel extends StatefulWidget {
  const RoomsPanel({super.key});

  @override
  State<RoomsPanel> createState() => _RoomsPanelState();
}

class NewItem {
  bool isExpanded;
  final Widget header;
  final String selection;
  final String body;

  NewItem(
    this.isExpanded,
    this.header,
    this.selection,
    this.body,
  );
}

class _RoomsPanelState extends State<RoomsPanel> {
  List<NewItem> items = <NewItem>[
    NewItem(
        false,
        const Image(
          height: 100,
          width: 200,
          image: AssetImage('images/1bed.jpg'),
        ),
        "King Room",
        "A room with a king-sized bed."),
    NewItem(
        false,
        const Image(
          height: 100,
          width: 200,
          image: AssetImage('images/2beds.jpg'),
        ),
        "Double Room",
        "A room assigned to two people."),
    NewItem(
        false,
        const Image(
          height: 100,
          width: 200,
          image: AssetImage('images/3beds.jpg'),
        ),
        "Family Room",
        "A room assigned to three or four people."),
  ];

  late ListView listCriteria;

  @override
  Widget build(BuildContext context) {
    listCriteria = ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                items[index].isExpanded = !items[index].isExpanded;
              });
            },
            children: items.map((NewItem item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                      leading: item.header,
                      title: Text(
                        item.selection,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent,
                        ),
                      ));
                },
                isExpanded: item.isExpanded,
                body: Text(
                  item.body,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          "Rooms List",
          style: TextStyle(fontSize: 25.0, color: Colors.white),
        ),
      ),
      body: listCriteria,
      persistentFooterButtons: <Widget>[
        ButtonBar(children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              seeYou(context);
            },
          ),
        ]),
      ],
    );
    return scaffold;
  }

  void seeYou(BuildContext context) {
    var alertDialog = AlertDialog(
        title: const Text(
          "See You!",
          style: TextStyle(color: Colors.orange),
        ),
        content: const Text(" This is the end of my UI demo"),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
            ),
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {
              print('Thanks, I got it.');
              Navigator.pop(context);
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
            ),
            child: const Text(
              'No',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ]);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }
}
