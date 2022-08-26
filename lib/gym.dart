import 'package:flutter/material.dart';

import 'map.dart';

class Gym extends StatefulWidget {
  const Gym({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Gym> createState() => _GymState();
}
 
class _GymState extends State<Gym> {
  final titles = ["Gym 1", "Gym 2", "Gm 3"];
  final subtitles = [
    "Budaiya",
    "Seef District",
    "Hidd"
  ];
  final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              MapSample(),
        ),
      );
    },
            child: Card(
                child: ListTile(
                    title: Text(titles[index]),
                    subtitle: Text(subtitles[index]),
                    leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                    trailing: Icon(icons[index]))),
          );
        })
    );
  }
}