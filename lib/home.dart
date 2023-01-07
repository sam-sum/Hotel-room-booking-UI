import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  // This code for Check-in Date
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime checkInDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: checkInDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != checkInDate) {
      setState(() {
        checkInDate = picked;
      });
    }
  }

  DateTime checkOutDate = DateTime.now();

  Future<void> selectDate2(BuildContext context) async {
    final DateTime? pickedOut = await showDatePicker(
      context: context,
      initialDate: checkOutDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedOut != null && pickedOut != checkOutDate) {
      setState(() {
        checkOutDate = pickedOut;
      });
    }
  }

  var adultNumber = 0.0;
  var childNumber = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: const Text(
              'Android ATC Hotel',
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        Image(
                          alignment: Alignment.topCenter,
                          width: 350.0,
                          image: AssetImage('images/entrance.jpg'),
                        ),
                      ],
                    ),

                    // This Row for Check-in Date : Android ATC - Lab 8
                    Row(
                      children: <Widget>[
                        const Text(
                          'Check-in Date : ',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ('${checkInDate.year} - ${checkInDate.month} - ${checkInDate.day}')
                              .toString(),
                          style: const TextStyle(
                              fontSize: 20.0, color: Colors.blue),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.date_range,
                            color: Colors.deepOrangeAccent,
                          ),
                          onPressed: () {
                            selectDate(context);
                          },
                        ),
                      ],
                    ),
                    // This Row for the check-out date
                    Row(
                      // This row for Check-out Date : Android ATC - Lab 8
                      children: <Widget>[
                        const Text(
                          'Check-Out Date : ',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ('${checkOutDate.year} - ${checkOutDate.month} - ${checkOutDate.day}')
                              .toString(),
                          style: const TextStyle(
                              fontSize: 20.0, color: Colors.blue),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.date_range,
                            color: Colors.deepOrangeAccent,
                          ),
                          onPressed: () {
                            selectDate2(context);
                          },
                        ),
                      ],
                    ),
                    //***** Here the code for Slider Widget : Number of Adults ********
                    Row(
                      children: <Widget>[
                        Text(
                          'Adults:   '
                          '$adultNumber',
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 250.0,
                          child: Slider(
                            value: adultNumber,
                            onChanged: (newRating) {
                              setState(() => adultNumber = newRating);
                            },
                            divisions: 6,
                            label: '$adultNumber.Adult',
                            min: 0,
                            max: 6,
                          ),
                        ),
                      ],
                    ),
                    //***** Here the code for Slider Widget : Number of Children ********
                    Row(
                      children: <Widget>[
                        Text(
                          'Children: '
                          '$childNumber',
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 250.0,
                          child: Slider(
                            value: childNumber,
                            onChanged: (newRating) {
                              setState(() => childNumber = newRating);
                            },
                            divisions: 6,
                            label: '$childNumber.Children',
                            min: 0,
                            max: 6,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const <Widget>[
                        Text(
                          'Extras :',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200.0,
                      child: CheckboxGroup(
                        labelStyle: const TextStyle(fontSize: 20.0),
                        labels: const <String>[
                          "Breakfast (10 USD/Day)",
                          "Internet WiFi (5 USD/Day)",
                          "Parking (5 USD/Day)",
                          "Swimming Pool (10 USD/Day)",
                        ],
                        onSelected: (List<String> checked) =>
                            print(checked.toString()),
                      ),
                    ),
                    Row(
                      children: const <Widget>[
                        Text(
                          'View :',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    RadioButtonGroup(
                      orientation: GroupedButtonsOrientation.VERTICAL,
                      labelStyle: const TextStyle(fontSize: 20.0),
                      labels: const <String>[
                        "City View",
                        "Sea View",
                      ],
                      onSelected: (String selected) => print(selected),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                          ),
                          child: const Text(
                            'Check Rooms and Rates',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'RoomsPanel');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
